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
#   CLASE      :        AUX::UTIL::SHODAN                                                             
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              1-5-2013                             
#   ACTUALIZACION:      
#   VERSION      :      0.1 
#   THANKS TO    : SHODAN && MaxMind                           
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N            
####

package AUX::UTIL::SHODAN ;
use strict;
use LIBS::GNRL::Colores ;
use Geo::IP::PurePerl;
use Shodan::WebAPI;
use LIBS::GNRL::Texto ;


use vars qw($VERSION @ISA);
@ISA = qw(); 
$VERSION = '0.01';


sub new {
    my($class) = @_;
    
     my $self =  ( { Title        => "SHODAN",
                    Author        => "Dshellnoi Unix",
                    Type          => "AUX",
                    Date          => "1.05.2013",
                    Ranking       => "Good", 
                    Webauthor     => "http://templesec.org", 
                    Descrition    =>qq[Module to get info and vulns],

                    ARG           => [
                                      ["SEARCH"     ,"WORD FOR SEARCH" ,1]
                                     ],
                  


                 });
     

    bless($self, $class);
    return $self;
}


sub run
{

my($self,@data) = @_;

my $word = "$data[0]";

#-------------------------#
#Insert your api key here #
#-------------------------#

my $SHODAN_KEY = " ";

if($SHODAN_KEY eq " "){

my $test =  LIBS::GNRL::Colores->new(); 
   $test->pinta("ROJO", "[-]Insert your SHODAN API KEY in the file Shurik3n/AUX/UTIL/SHODAN.pm \n") ;
   goto SHELL;
}



my $gi = Geo::IP::PurePerl->open("DATABASES/GeoLiteCity.dat", GEOIP_STANDARD);
my $api = new Shodan::WebAPI($SHODAN_KEY);



my $results = $api->search($word);


if ( $results->{'error'} ) {
      my $test =  LIBS::GNRL::Colores->new(); 
         $test->pinta("ROJO", "[-]Error to perform the query\n") ;
        goto SHELL;
}
else {
       my $s =  LIBS::GNRL::Colores->new(); 
          $s->pinta("ROJO", "[+]searching {$word}\n") ;

       my @matches = @{$results->{'matches'}};

       if(scalar(@matches) < 1){
         my $test =  LIBS::GNRL::Colores->new(); 
            $test->pinta("ROJO", "[-]Error to perform the query\n") ;
            goto SHELL;
       }

        for (my $i = 0; $i < $#matches; $i++ ) {

                my @dat = $gi->get_city_record($matches[$i]->{ip});

                if(scalar(@dat) < 1){
                my $test =  LIBS::GNRL::Colores->new(); 
                $test->pinta("ROJO", "[-]Unable to locate the ip $matches[$i]->{ip}\n") ;
                }
               
               my $test =  LIBS::GNRL::Colores->new(); 
                  $test->pinta("AMARILLO", "[+]IP: $matches[$i]->{ip}\n") ;
                  if(defined $matches[$i]->{hostnames}->[0]){
                  $test->pinta("AMARILLO", "[+]Hostname    :$matches[$i]->{hostnames}->[0]\n") ;}
                  $test->pinta("AMARILLO", "[+]Port        : $matches[$i]->{port}\n") ;
                  $test->pinta("AMARILLO", "[+]Country code: $dat[0]\n") ;
                  $test->pinta("AMARILLO", "[+]Country     : $dat[2]\n") ;
                  $test->pinta("AMARILLO", "[+]City        : $dat[4]\n") ;
                  $test->pinta("AMARILLO", "[+]Longitude   : $dat[7]\n") ;
                  $test->pinta("AMARILLO", "[+]Latitude    : $dat[6]\n");
                  $test->pinta("AMARILLO", "[+]Update      : $matches[$i]->{updated}\n");
                  $test->pinta("AMARILLO", "[+]Data        :\n $matches[$i]->{data}\n");

                 my $a =  LIBS::GNRL::Colores->new(); 
                    $a->pinta("ROJO", "[+]Want more ?? (N or NO or NOT for exit):") ;

                my $opt=<STDIN>; 
                chop($opt);

                my $texto =  LIBS::GNRL::Texto->new();
                my $nocase = $texto->may($opt); 

                if($nocase eq "N" or $nocase eq "NOT" or $nocase eq "NO"){
                  my $test =  LIBS::GNRL::Colores->new();
                  
                  $test->pinta("AMARILLO", "This module uses SHODAN available from:: \n http://www.shodanhq.com/ \n");
                  $test->pinta("AMARILLO", "This product includes GeoLite data created by MaxMind, available from::\nhttp://www.maxmind.com\n\n");
                  goto SHELL ;
                  } 



       }
}


}

1;