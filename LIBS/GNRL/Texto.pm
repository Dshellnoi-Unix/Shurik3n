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
#   ACTUALIZACION:      01-4-2013 
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N            
####



package LIBS::GNRL::Texto ;
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
    my($class, $data) = @_; #Agregamos las variables en la lista para crear el objeto y bendecir despues
    
    my $self = { 
    	        _DATA  => undef,
    	        _PR    => undef,
                _URI   => undef,
                _PT    => undef 

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


#
# COMPRUEBA SI ES UN SOCKS VALIDO
#


sub cmp_proxy{

my($self,$proxy) = @_;
$self->{'_PR'} = $proxy if @_ ;

if($self->{'_PR'} !~ /(socks:\/\/|socks4:\/\/)/) {

        my $test =  LIBS::GNRL::Colores->new(); 
           $test->pinta("ROJO", "[-]$self->{'_PR'}  Not a valid proxy\n") ;
           goto SHELL ;
    }


}

#
# URL VALIDA
#

sub cmp_url{

my($self,$proxy) = @_;
$self->{'_URI'} = $proxy if @_ ;

if($self->{'_URI'} !~ /(http:\/\/|https:\/\/)/) {

        my $test =  LIBS::GNRL::Colores->new(); 
           $test->pinta("ROJO", "[-]$self->{'_URI'}  Not a valid url\n") ;
           goto SHELL ;
    }


}

#
# CMP PATH
#

sub cmp_path{

my($self,$proxy) = @_;
$self->{'_PT'} = $proxy if @_ ;

if($self->{'_PT'} !~ /^\//) {

        my $test =  LIBS::GNRL::Colores->new(); 
           $test->pinta("ROJO", "[-]$self->{'_URI'}  Not a valid path\n") ;
           goto SHELL ;
    }


}


1; 
