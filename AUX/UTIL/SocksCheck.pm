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
#   CLASE      :        AUX::UTIL::SocksCheck                                                             
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              03-4-2013                             
#   ACTUALIZACION:      
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N            
####

package AUX::UTIL::SocksCheck  ;
use strict;
use LWP::Simple;
use LWP::UserAgent;
use Switch;
use LIBS::GNRL::Files;
use LWP::Protocol::socks ;
use LIBS::GNRL::Colores ;
use LIBS::GNRL::Texto ;
use Geo::IP::PurePerl;


use vars qw($VERSION @ISA);
@ISA = qw(); 
$VERSION = '0.01';


sub new {
    my($class) = @_;
    
     my $self =  ( { Title         => "SocksCheck",
                     Author        => "Dshellnoi Unix",
                     Type          => "AUX",
                     Date          => "03.04.2013", 
                     Ranking       => "Normal",
                     Webauthor     => "http://templesec.org", 
                     Descrition    =>qq[Module to check socks4 && socks5 ],
                     ARG           => [
                                      ["DIC"   ,"Set the dic with socks",1],
                                      ["UA"    ,"Set the User Agent"    ,0]
                                      ],
                  


                 });
     

    bless($self, $class);
    return $self;
}


sub run
{


my($self,@data) = @_;

my $user_agent ;
my @steps ;
my $dicc ;
my @works ;
#
# COMPROVAMOS EL DICCIONARIO
#

switch ($data[0]) {

case "def"        { 
                   my $file = LIBS::GNRL::Files->new();
                      $file->cmpfile("DICC/SOCKS") ;
                      $dicc = "DICC/SOCKS" ;
                  }

else              {
                   my $file = LIBS::GNRL::Files->new();
                      $file->cmpfile("$data[0]") ;
                      $dicc = "$data[0]" ;
                  }


}



#
# CONFIGURAMOS EL UA
#

if($data[1] eq 0){

$user_agent = "$0/0.1" ;

}
else{

$user_agent = $data[1] ;

}



open (LEE, "$dicc"); 
@steps = <LEE>;
close @steps;



for my $step (@steps) {

        
my $ua = new LWP::UserAgent;
   $ua->timeout(15);
   $ua->agent("$user_agent");

my $cmp_proxy = LIBS::GNRL::Texto->new();
   $cmp_proxy->cmp_proxy($step); 
   $ua->proxy([qw(http https)] => "$step");

my $req = new HTTP::Request "GET" => "http://cloud.templesec.org/KENJUTSU/ip.php";
   $req->header('Accept' => 'text/html');
my $res = $ua->request($req); 

my @geoip = split("//", $step);
my @ip = split(":", $geoip[1]);

my $gi = Geo::IP::PurePerl->open("DATABASES/GeoLiteCity.dat", GEOIP_STANDARD);
my @dat = $gi->get_city_record($ip[0]);



switch ($res->code) {

case 200  { 
          my $test =  LIBS::GNRL::Colores->new(); 
           $test->pinta("AMARILLO", "[+]Satus [200] $step") ;
           $test->pinta("AMARILLO", "[+]Country:$dat[2] Longitude:$dat[6] Latitude:$dat[7]  \n") ;
           push(@works, "$step");
          }
else      {

          my $test =  LIBS::GNRL::Colores->new(); 
           $test->pinta("ROJO", "[-]Unable to connect $step") ;
           
          }

}


}#termina for

my $total_a = scalar(@steps);
my $total_work = scalar(@works) ;


print "\n\n";



my $info =  LIBS::GNRL::Colores->new(); 
$info->pinta("AMARILLO", "+---------------------------+\n");
$info->pinta("AMARILLO", "            INFO               \n");
$info->pinta("AMARILLO", "+---------------------------+\n");
$info->pinta("AMARILLO", "[+]Total analyzed socks $total_a\n");
$info->pinta("AMARILLO", "[+]Total working socks $total_work\n");
print "\n";


my $test =  LIBS::GNRL::Colores->new(); 
$test->pinta("AMARILLO", "This product includes GeoLite data created by MaxMind, available from\nhttp://www.maxmind.com");
print "\n";


}

1;