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
               "Switch" 
              );


for my $modulo (@modulos) {
        
  $color->pinta("AMARILLO", "[+]installing $modulo \n") ;
        sleep 1;
     
        system("cpan $modulo");
     
        sleep 1;
    }



$color->pinta("AMARILLO", "[+]Congratulations, you can use Shurik3n\n") ;

