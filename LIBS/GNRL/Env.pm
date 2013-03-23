######
#             PACKTAGE PARA MANEJAR LAS VARS DE ENTORNO EN LINUX 
#                          
#   CLASE      :        Env.pm                                                             
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              12-3-2013                             
#   ACTUALIZACION:      17-3-2013 
#   VERSION      :      0.2                            
#   METODOS      :      setenv(), delenv(), cmpenv(), envempty()  
#   PARAMETROS setenv()  :Nombre_var,valor var 
#   PARAMETROS delenv()  :Nombre_var
#   PARAMETROS cmpenv()  :Nombre_var
#   PARAMETROS envempty():Nombre_var                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N WEB TOOL           
#
#
#           ::::IMPLEMENTACION::::
#
#            LLAMAMOS A LA LIBRERIA
#
#           use LIBS::GNRL::Env;  
#
#          #INSTANCIAMOS LA CLASE
#
#          $env = LIBS::GNRL::Env->new() ; 
#
#         EJEMPLO :
#
#         $env->setenv("HOST", "http://192.168.1.1") ;
#         $env->envempty("HOST");
#         $env->delenv("HOST") ;
#         $env->cmpenv("HOST");
#
#
#          
#
######


package LIBS::GNRL::Env ;
use strict;
use LIBS::GNRL::Colores ;
use vars qw($VERSION @ISA);
@ISA = qw(); 
$VERSION = '0.02';


sub new {
    my($class, $name, $data) = @_; 
    
    my $self = { 
    	         _NAME      => undef, 
    	         _DATA      => undef
    	         
               };  
    
    bless($self, $class);
    return $self;
}

##
# MANDA UNA VARIABLE DE ENTORNO
##

sub setenv {

my($self,$name, $data) = @_;
$self->{_NAME} = $name if @_;
$self->{_DATA} = $data if @_;

return $ENV{"$self->{_NAME}"}=$self->{_DATA} ;

}

##
# BORRA UNA VARIABLE DE ENTORNO
##

sub delenv {

my($self,$name, ) = @_;
$self->{_NAME} = $name if @_;

delete $ENV{"$self->{_NAME}"} ;

}

##
# COMPRUEBA SI EXISTE UNA VARIABLE DE ENTORNO
##
sub cmpenv {

my($self,$name, ) = @_;

$self->{_NAME} = $name if @_;
if (! defined $ENV{"$self->{_NAME}"}){
##
#LANZAMOS EL MENSAJE DE ERROR
##
my $msg  = "[-]Does not exist parameter $self->{_NAME}\n" ;
my $test =  LIBS::GNRL::Colores->new();  
   $test->pinta("ROJO", $msg); 

}

}#termina funcion


##
# COMPRUEBA QUE EL VALOR DE UNA VARIABLE DE ENTORNO NO 
# ESTE VACIO
##

sub envempty
{
my($self,$name, ) = @_;

$self->{_NAME} = $name if @_;

if(length($ENV{"$self->{_NAME}"}) == 0 || $ENV{"$self->{_NAME}"} eq ' ' )
{
my $msg = "[-]Parameter $self->{_NAME} is empty \n" ;
my $test =  LIBS::GNRL::Colores->new();  
   $test->pinta("ROJO", $msg); 
}

}#termina funcion

1;