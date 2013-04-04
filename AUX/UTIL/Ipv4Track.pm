####
#  _________.__                 .__ __    ________         
# /   _____/|  |__  __ _________|__|  | __\_____  \  ____  
# \_____  \ |  |  \|  |  \_  __ \  |  |/ /  _(__  < /    \ 
# /        \|   Y  \  |  /|  | \/  |    <  /       \   |  \
#/_______  /|___|  /____/ |__|  |__|__|_ \/______  /___|  /
#        \/      \/                     \/       \/     \/ 
#
#                    Dshellnoi Unix  2013
#                      
#   CLASE        :      AUX::UTIL::Ipv4Track                                                             
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              4-4-2013                             
#   ACTUALIZACION:      
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N           
####

package AUX::UTIL::Ipv4Track;
use LIBS::GNRL::Texto;
use LIBS::GNRL::Colores ;
use strict;
use warnings;
use Geo::IP::PurePerl;



use vars qw($VERSION @ISA);
@ISA = qw(); 
$VERSION = '0.01';


sub new {
    my($class) = @_;
    
     my $self =  ( { Title        => "Ipv4Track",
                    Author        => "Dshellnoi Unix",
                    Date          => "04.04.2013",
                    Ranking       => "Normal", 
                    Webauthor     => "http://templesec.org", 
                    Descrition    =>qq[trace a ipv4],

                    ARG           => [
                                      ["IP"     ,"Set ip" ,1]
                                     ],
                  


                 });
     

    bless($self, $class);
    return $self;
}


sub run
{

my($self,@data) = @_;



my $cmp_ip = LIBS::GNRL::Texto->new();
   $cmp_ip->cmp_ip($data[0]); 


my $gi = Geo::IP::PurePerl->open("DATABASES/GeoLiteCity.dat", GEOIP_STANDARD);
my @dat = $gi->get_city_record($data[0]);

if(scalar(@dat) < 1){
my $test =  LIBS::GNRL::Colores->new(); 
   $test->pinta("ROJO", "[-]Unable to locate the ip $data[0]\n") ;
   goto SHELL;
}

my $test =  LIBS::GNRL::Colores->new(); 
   $test->pinta("AMARILLO", "[+]Country code: $dat[0]\n") ;
   $test->pinta("AMARILLO", "[+]Country     : $dat[2]\n") ;
   $test->pinta("AMARILLO", "[+]City        : $dat[4]\n") ;
   $test->pinta("AMARILLO", "[+]Longitude   : $dat[6]\n") ;
   $test->pinta("AMARILLO", "[+]Latitude    : $dat[7]\n\n") ;

$test->pinta("AMARILLO", "This product includes GeoLite data created by MaxMind, available from\nhttp://www.maxmind.com\n\n");

}

1;