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
#              =============================        
#              [[[[[[[[MAIN SHURIK3N]]]]]]]]
#              ============================= 
#                                                            
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              15-3-2013                             
#   ACTUALIZACION:      25-3-2013 
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N WEB TOOL           
####

use LIBS::GNRL::Creditos ;
use LIBS::GNRL::Shell ;
use LIBS::GNRL::Cmd ;
use strict ;
use LIBS::GNRL::Show ;


my $cmd =  LIBS::GNRL::Cmd->new();
   $cmd->clean() ;


my $work = LIBS::GNRL::Shell->new();
my $banner =  $creditos::banner ;
my $prompt =  "((Shurik3n))" ;
my $name_modulo;
my $puntero = ")->" ;   

BANNER :
my $test =  LIBS::GNRL::Colores->new(); 
   $test->pinta("AMARILLO", $banner) ;
   print "\n" ;

#
# CONTADORES
#

my $contador = LIBS::GNRL::Show->new();

my $util = $contador->count("AUX/UTIL");
my $sqli = $contador->count("EXPLOITS/SQLI");


#SUMAMOS 
my $aux = $util ;
my $exploits = $sqli ;
my $total = $aux + $exploits ;

print "             ";
$test->pinta("ROJO", "[EXPLOITS::$exploits]") ;
$test->pinta("ROJO", "[AUX::$aux]") ;
$test->pinta("ROJO", "[TOTAL::$total]\n\n") ;


#
# FINAL CONTADORES
#

SHELL:
$name_modulo = $ENV{'MODULO'} ;
$test->pinta("AMARILLO", $prompt) .$test->pinta("ROJO", $name_modulo). $test->pinta("AMARILLO", $puntero); 


my $cmd=<STDIN>; 

chop($cmd);
$work->shell($cmd);


 goto SHELL ;




 

















