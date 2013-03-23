###
#           CLASE:User_agents
#
#          DESCRIPCION : 
#                       Devuelve un user agent para configurar en los exploits
#                       y en los modulos auxiliares y lista todos los user agents
#                       tambien cuenta todos los user agents
#
#          LLAMANDO E INTANCIANDO LA CLASE :
#                       use LIBS::GNRL::User_agents ;
#                       $user_agent =  LIBS::GNRL::User_agents->new();
#                       
#          USANDO LOS METODOS :
#
#                       Devuelve un user agent listo para configurar una peticion en un exploiit
#                       o en un modulo auxiliar 
#
#                       print $user_agent->show_ua(12);
#
#          LISTA TODOS LOS USER AGENTS :
#
#                       $user_agent->lista_ua();
#
#
#
#          CONFIGURA UN USER AGENT:
#                       print $user_agent->ua_configure("MI USER AGENT");
#
#
#
#          CREADA:                   12-03-2013                                
#          ESCRITA POR:              Dshellnoi_Unix
#          ULTIMA ACTUALIZACION:     17-03-2013
#####





package LIBS::GNRL::User_agents ;
use strict;
use LIBS::GNRL::Colores ;
use vars qw($VERSION @ISA);
@ISA = qw();
$VERSION = '0.02';

##
#
#LISTA DE USER AGENTS
#
##

my @ua ;
$ua[0]="Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)" ;
$ua[1]="Googlebot/2.1 ( http://www.googlebot.com/bot.html)" ;
$ua[2]="Mozilla/2.0 (compatible; MSIE 3.02; Update a; AOL 3.0; Windows 95)" ;
$ua[3]="Mozilla/3.0 (compatible; Opera/3.0; Windows 3.1) v3.1" ;
$ua[4]="Mozilla/4.0 (PDA; PalmOS/sony/model prmr/Revision:1.1.54 (en)) NetFront/3.0" ;
$ua[5]="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.45 Safari/535.19" ;
$ua[6]="Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; es-es) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B405" ;
$ua[7]="msnbot-Products/1.0 (+http://search.msn.com/msnbot.htm)" ;
$ua[8]="BenQ-CF61/1.00/WAP2.0/MIDP2.0/CLDC1.0 UP.Browser/6.3.0.4.c.1.102 (GUI) MMP/2.0" ;
$ua[9]="Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)" ;
$ua[10]="Opera/9.20 (Windows NT 6.0; U; en)" ;
$ua[11]="Mozilla/2.0 (compatible; Ask Jeeves)" ;
$ua[12]="Googlebot-Image/1.0 ( http://www.googlebot.com/bot.html)" ;




###
#
# CONSTRUCTOR DE LA CLASE
#
###

sub new {
    my($class, $num, $configure ) = @_; #Agregamos las variables en la lista para crear el objeto y bendecir despues
    
    my $self = { 
    	         num => undef,
    	         configure => undef           
               };  
    
    bless($self, $class);
    return $self;
}

###
#
#DEVUELVE EL USER AGENT
#
###


sub show_ua
{

my($self,$num) = @_;
$self->{'num'} = $num  ;

if (! $ua[$self->{'num'}]){
 
my $test =  LIBS::GNRL::Colores->new();  
   $test->pinta("ROJO", "[-]I do not recognize the user agent\n"); 
   #
   # CONTROLAR EL FLUJO SI FALLA
   #
   exit ;
}
#
# IMPRIME EL USER AGENT
#
my $test =  LIBS::GNRL::Colores->new();  
   $test->pinta("AMARILLO", $ua[$self->{'num'}]); 
 
}


##
# LISTA TODOS LOS USER AGENTS
##

sub lista_ua
{
for(my $i=0; $i <= $#ua ; $i++ ){
     my $shw = "[$i]".$ua[$i]."\n";
     my $test =  LIBS::GNRL::Colores->new();  
        $test->pinta("AMARILLO", $shw); 
    }
}


##
#
#
#CONFIGURA UN USER AGENT MANUAL
#
##

sub ua_configure
{

my($self,$configure) = @_;
$self->{'configure'} = $configure ;
return $self->{'configure'} ;

}

1;