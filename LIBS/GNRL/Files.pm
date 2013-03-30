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
#   CLASE      :        LIBS::GNRL::Files.pm                                                             
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              30-2-2013                             
#   ACTUALIZACION:      
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N            
####

package LIBS::GNRL::Files ;
use strict;
use LIBS::GNRL::Colores ;
use vars qw($VERSION @ISA);
@ISA = qw();
$VERSION = '0.01';

###
#
# CONSTRUCTOR DE LA CLASE
#
###

sub new {
    my($class) = @_; 
    
    my $self = { 
                 FILE      => undef,
                  
               };  
    
    bless($self, $class);
    return $self;
}


#
# COMPROVACIONES PARA LOS DICCIONARIOS
#

sub cmpfile{

my($self,$file) = @_;

$self->{'FILE'} = $file if @_ ;
my $error =  LIBS::GNRL::Colores->new(); 
   

    if (! -r "$self->{'FILE'}") {
          $error->pinta("ROJO", "[-]The $self->{'FILE'} does not exist or can not be read\n");
          goto SHELL;
                              }
    if ( -z "$self->{'FILE'}") {
          $error->pinta("ROJO", "[-]The $self->{'FILE'} is empty\n");
          goto SHELL;
                              } 

}

1;