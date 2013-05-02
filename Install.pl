#!/usr/bin/perl
####
#  _________.__                 .__ __    ________         
# /   _____/|  |__  __ _________|__|  | __\_____  \  ____  
# \_____  \ |  |  \|  |  \_  __ \  |  |/ /  _(__  < /    \ 
# /        \|   Y  \  |  /|  | \/  |    <  /       \   |  \
#/_______  /|___|  /____/ |__|  |__|__|_ \/______  /___|  /
#        \/      \/                     \/       \/     \/ 
#
#                    Dshellnoi Unix  2013
#              ============================        
#                 [[[[[[[[Instal]]]]]]]]
#              ============================ 
#                                                            
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              28-3-2013                             
#   ACTUALIZACION:       
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N           
####

use LIBS::GNRL::Colores ;


$banner ='
  _________.__                 .__ __    ________         
 /   _____/|  |__  __ _________|__|  | __\_____  \  ____  
 \_____  \ |  |  \|  |  \_  __ \  |  |/ /  _(__  < /    \ 
 /        \|   Y  \  |  /|  | \/  |    <  /       \   |  \
/_______  /|___|  /____/ |__|  |__|__|_ \/______  /___|  /
        \/      \/                     \/       \/     \/ 

                 Shurik3n    Installer
';


 my $color =  LIBS::GNRL::Colores->new(); 
    $color->pinta("AMARILLO", "$banner\n") ;


$user = $< ;

if($user !=0 ){

 $color->pinta("ROJO", "[-]Be root my friend\n") ;
exit ;

}


my @modulos = (
               "Module::Load",
               "Module::Util",
               "Term::Screen",
               "Switch",
               "LWP::Protocol::socks",
               "HTML::Strip",
               "Geo::IP::PurePerl",
               "XML::Simple",
               "CGI::Enurl",
               "JSON::XS",
               "HTTP::Request::Common"
              );


for my $modulo (@modulos) {
        
  $color->pinta("AMARILLO", "[+]installing $modulo \n") ;
        sleep 1;
     
        system("cpan $modulo");
     
        sleep 1;
    }

$color->pinta("AMARILLO", "[+]Downloading SHODAN \n") ;
system("wget http://github.com/downloads/achillean/shodan-perl/Shodan-0.3.tar.gz");
$color->pinta("AMARILLO", "[+]installing SHODAN \n") ;
system("tar zxvf Shodan-0.3.tar.gz");
system("cd Shodan-0.3 && perl Makefile.PL");
system("cd Shodan-0.3 && make");
system("cd Shodan-0.3 && make install");
system("rm -R  Shodan-0.3");
system("rm Shodan-0.3.tar.gz");

$color->pinta("AMARILLO", "[+]Congratulations, you can use Shurik3n\n") ;


