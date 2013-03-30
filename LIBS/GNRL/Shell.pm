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
#   CLASE      :        LIBS::GNRL::Shell                                                             
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              12-2-2013                             
#   ACTUALIZACION:       
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N            
####


package LIBS::GNRL::Shell ;
use strict ;
use LIBS::GNRL::Help;
use LIBS::GNRL::Colores ;
use LIBS::GNRL::Cmd ;
use LIBS::GNRL::Texto; 
use LIBS::GNRL::User_agents ;
use LIBS::GNRL::Cargas ;
use LIBS::GNRL::Show ;
use LIBS::GNRL::Env;
use Switch;
use vars qw($VERSION @ISA);
@ISA = qw();
$VERSION = '0.01';


sub new {
    my($class, $modulo, @arg) = @_; 
    
    my $self = { 
    	         _ARGUMENTOS   => undef,
                 
               };  
    
    bless($self, $class);
    return $self;
}


####
# METODO PARA MANEJAR
# LOS COMANDOS 
####


sub shell 
{

my($self,$comandos) = @_;

$self->{'_ARGUMENTOS'} = $comandos if @_ ;

###
# PARSEAMOS LOS COMANDOS
###
my $cmd =  LIBS::GNRL::Cmd->new();
my @com = $cmd->parse_shell($self->{'_ARGUMENTOS'}) ; 


##
# COMANDOS DE SHURIKEN
##

#PARA CONVERTIR A MAYUSCULAS
my $texto =  LIBS::GNRL::Texto->new(); 

switch ($texto->may($com[0])) {

case "CLEAR"      { 
                   my $cmd =  LIBS::GNRL::Cmd->new();
                      $cmd->clean() ;
                      goto BANNER ;
                  }

case  "EXIT"      {
    	             my $cmd =  LIBS::GNRL::Cmd->new();
                      $cmd->clean() ;
                   my $msg = "Technology Powered by : Dshellnoi Unix  =^.^=";
                   my $test =  LIBS::GNRL::Colores->new(); 
                      $test->pinta("ROJO", $msg) ;
                      print "\n"; 
                      exit ;
                  }

case "UA"         { 
                   my  $user_agent =  LIBS::GNRL::User_agents->new();
                       $user_agent->lista_ua(); 
                  }

case "LOAD"       { 
                   my $test = LIBS::GNRL::Cargas->new(); 
                   my $modulo = $test->modulo_existe($com[1]);
                                $test->modulo_valido($modulo);
                   $ENV{'MODULO'} = $modulo   
                  }

case "BACK"       {

                   if(!exists($ENV{'MODULO'})){
                    my $test =  LIBS::GNRL::Colores->new(); 
                       $test->pinta("ROJO", "[-]Not modules loaded\n") ;
                       goto SHELL ;
                                               }
                 
                   my $borra = LIBS::GNRL::Cargas->new(); 
                      $borra->reset_params($ENV{'MODULO'});
                      delete($ENV{'MODULO'});       
                  }

case "INFO"       {
                   
	               if(exists($ENV{'MODULO'})){
                                              $com[1] = $ENV{'MODULO'} ;
     	                   	                 }

	               my $test = LIBS::GNRL::Cargas->new();
                 my $modulo = $test->modulo_existe($com[1]);
                              $test->modulo_valido($modulo);
                              $test->info($com[1]);      
                  }

case "OPT"        {
                   if(!exists($ENV{'MODULO'})){

                    my $test =  LIBS::GNRL::Colores->new(); 
                       $test->pinta("ROJO", "[-]Not modules loaded\n") ;
                       goto SHELL ;

                                               }
                    my $test = LIBS::GNRL::Cargas->new();
                    my $modulo = $test->modulo_existe($ENV{'MODULO'});
                                 $test->modulo_valido($modulo);
                                 $test->show_opt($modulo);
                  }

case "CONF"       {
                   if(!exists($ENV{'MODULO'})){

                    my $test =  LIBS::GNRL::Colores->new(); 
                       $test->pinta("ROJO", "[-]Not modules loaded\n") ;
                       goto SHELL ;

                                               }
                    my $test = LIBS::GNRL::Cargas->new();
                    my $modulo = $test->modulo_existe($ENV{'MODULO'});
                       $test->existe_parametro($modulo, $texto->may($com[1]));


                    #PASAMOS A MAY EL NOMBRE DE LA ENV VAR
                    my $var = $texto->may($com[1]);

                    #SOLO SE EJECUTA ESTE BLOQUE SI EL PAR
                    # A CONFIGURAR ES EL UA

                    if($var eq "UA"){

                    my $user_agent =  LIBS::GNRL::User_agents->new();
                  
                    #MANDAMOS LA ENVVAR
                    my $env = LIBS::GNRL::Env->new() ; 
                       $env->setenv($var, $user_agent->show_ua($com[2])) ;
                       $env->envempty($var) ;

                    #SI NO ESTA VACIA LA ENV VAR MUESTRA VALOR
                    print "[$var]"."-->". $ENV{"$var"} ."\n" ;
                    goto SHELL ;
                   
                    }
                    

                    #MANDAMOS LA ENVVAR
                    my $env = LIBS::GNRL::Env->new() ; 
                       $env->setenv($var, $com[2]) ;
                       $env->envempty($var) ;
                    #SI NO ESTA VACIA LA ENV VAR MUESTRA VALOR
                    print "[$var]"."-->". $ENV{"$var"} ."\n" ;
                  }

case "RESET"       {

                   if(!exists($ENV{'MODULO'})){
                    my $test =  LIBS::GNRL::Colores->new(); 
                       $test->pinta("ROJO", "[-]Not modules loaded\n") ;
                       goto SHELL ;
                                               }
                 
                   my $borra = LIBS::GNRL::Cargas->new(); 
                      $borra->reset_params($ENV{'MODULO'});
                     
                  }

case "RUN"        {
                   if(!exists($ENV{'MODULO'})){
                    my $test =  LIBS::GNRL::Colores->new(); 
                       $test->pinta("ROJO", "[-]Not modules loaded\n") ;
                       goto SHELL ;
                                               }

                    my $exploit = LIBS::GNRL::Cargas->new();
                    my $modulo = $exploit->modulo_existe($ENV{'MODULO'}); 
                                 $exploit->run($modulo);
                       
                  }

case "SHOW"       { 
                   my $todo = LIBS::GNRL::Show->new();
                      $todo->listar(); 
                  }
case "AUX"        { 
                   my $a = LIBS::GNRL::Show->new();
                      $a->listar_aux(); 
                  }

case "EXPLOITS"   { 
                   my $ex = LIBS::GNRL::Show->new();
                      $ex->listar_exp(); 
                  }

case "HELP"       { 
                   my $ayuda = LIBS::GNRL::Help->new();
                      $ayuda->help(); 
                  }
else              {
                   my $test =  LIBS::GNRL::Colores->new(); 
                      $test->pinta("ROJO", "[-]$com[0] is not a command\n") ;
                  }

}#case

} #TERMINA FUNCION

1;