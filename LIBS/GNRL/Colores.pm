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
#   CLASE      :        LIBS::GNRL::Colores                                                            
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              20-2-2013                             
#   ACTUALIZACION:      25-3-2013 
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N            
#
#                   COLORES DISPONIBLES                        
#
#                        #NEGRO
#                        #ROJO 
#                        #VERDE 
#                        #MARRON
#                        #AZUL 
#                        #PURPURA 
#                        #CIAN
#                        #GRIS_CLARO 
#                        #GRIS_OSCURO
#                        #ROJO_CLARO 
#                        #VERDE_CLARO
#                        #AMARILLO 
#                        #AZUL_CLARO 
#                        #PURPURA_CLARO
#                        #CIAN_CLARO 
#                        #BLANCO
#                        #CIERRE 
#
######


package LIBS::GNRL::Colores ;
use strict;
use vars qw($VERSION @ISA);
@ISA = qw();
$VERSION = '0.02';

###
#
#DEFINIMOS LOS COLORES
#
###
my %col=(  
         
         "NEGRO"        => "\033[30m",
         "ROJO"         => "\033[31m",
         "VERDE"        => "\033[32m",
         "MARRON"       => "\033[33m",
         "AZUL"         => "\033[34m",
         "PURPURA"      => "\033[35m",
         "CIAN"         => "\033[36m",           
         "GRIS_CLARO"   => "\033[37m",         
         "GRIS_OSCURO"  => "\033[1;30m",
         "ROJO_CLARO"   => "\033[1;31m",
         "VERDE_CLARO"  => "\033[1;32m",
         "AZUL_CLARO"   => "\033[1;34m",
         "PURPURA_CLARO" => "\033[1;35m",
         "CIAN_CLARO"   => "\033[1;36m",
         "BLANCO"       => "\033[1;37m",
         "AMARILLO"     => "\033[1;33m",
         "CIERRE"       => "\033[00m"
         
                       
        );



##
# CONSTRUCTOR DE LA CLASE
##

sub new {
    my($class, $data, $cmd ) = @_; 
    
    my $self = { 
                 _COLOR => undef, 
                 _STR   => undef            
               };  
    
    bless($self, $class);
    return $self;
}

###
# FUNCION PARA COLOREAR
###
sub pinta
{
my($self,$color, $str) = @_;

#Definimos las var de entrada
$self->{'_COLOR'} = $color  if @_ ;
$self->{'_STR'} =   $str    if @_ ;

#cierre al pintar
my $cierre = $col{"CIERRE"} ;


print $col{"$self->{'_COLOR'}"};
print $self->{'_STR'}  ;
print $cierre ;
}

1; 
