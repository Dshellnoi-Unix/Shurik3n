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
#   CLASE      :        LIBS::GNRL::Colores.pm                                                             
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              12-2-2013                             
#   ACTUALIZACION:      25-3-2013 
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N WEB TOOL           
####


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
   #CONTROLAMOS EL FLUJO 
   goto SHELL ;
}

}

1;