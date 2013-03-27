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
#   CLASE      :        LIBS::GNRL::Texto                                                             
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              12-2-2013                             
#   ACTUALIZACION:       
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N            
####



package LIBS::GNRL::Texto ;
use strict;
use vars qw($VERSION @ISA);
@ISA = qw();
$VERSION = '0.01';


###
#
# CONSTRUCTOR DE LA CLASE
#
###

sub new {
    my($class, $data) = @_; #Agregamos las variables en la lista para crear el objeto y bendecir despues
    
    my $self = { 
    	         _DATA => undef
                              
               };  
    
    bless($self, $class);
    return $self;
}

###
#
# METODO PARA CONVERTIR DE MAYUSCULAS A MINUSCULAS
#
###  

sub min{

my($self,$data) = @_;
$self->{'_DATA'} = $data if @_ ;
my $string = lc( $data);
return $string ;
}

###
#
# METODO PARA CONVERTIR DE MINUSCULAS A MAYUSCULAS
#
###  

sub may{

my($self,$data) = @_;
$self->{'_DATA'} = $data if @_ ;
my $string = uc( $data);
return $string ;
}

1; #todas las clases tienen quedevolver un "true"