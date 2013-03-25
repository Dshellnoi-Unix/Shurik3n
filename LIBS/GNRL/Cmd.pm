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
#   CLASE      :        LIBS::GNRL::Cmd                                                            
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              12-2-2013                             
#   ACTUALIZACION:      25-3-2013 
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N WEB TOOL           
####

package LIBS::GNRL::Cmd ;
use strict;
use Term::Screen ;
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
                 _CMD      => undef,
                 _NUM_ARG  => undef,
                 _ARRAY    => undef
                  
               };  
    
    bless($self, $class);
    return $self;
}


###
# FUNCION PARA PARSEAR LA LINEA DE COMANDOS
# PARTIDOS POR ESPACIOS
###  


sub parse_shell{

my($self,$cmd) = @_;

$self->{'_CMD'} = $cmd if @_ ;

   my $datos  = $self->{'_CMD'};
   my @comandos;
   my $comando;
   my $corte = 0;


  foreach(split('', $datos)) {
    
    if($corte){
              $comando .= $_;
              $corte = 0;
               next;
              }
    if($_ eq '\\'){
                 $corte = 1;
                  next;
                }

    if($_ eq ' '){
      push(@comandos, $comando)if(defined($comando));
      $comando = undef;
      next;
    }

    $comando .= $_;
  }
  push(@comandos, $comando) if(defined($comando));

  return(@comandos) ;

}

###
# LIMPIA LA PANTALLA
###

sub clean{

my $pantalla = Term::Screen->new();
unless ($pantalla) { die "Failed to clear screen\n"; }
$pantalla->clrscr();

}

##
# METODO PARA CONTABILIZAR ARGUMENTOS
##

sub num_arg_permitidos
{
my($self,$num, @array, ) = @_;

$self->{'_NUM_ARG'} = $num if @_ ;
$self->{'_ARRAY'} = @array if @_ ;


if((scalar $self->{'_ARRAY'}) > $self->{'_NUM_ARG'}){ 

     my $test =  LIBS::GNRL::Colores->new(); 
        $test->pinta("ROJO", "[-]number of arguments is very big\n") ;
        goto SHELL ;
  
    }



}


1;
