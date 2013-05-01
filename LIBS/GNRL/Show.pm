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
#   CLASE        :      LIBS::GNRL::Show                                                             
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA        :      25-2-2013                             
#   ACTUALIZACION:       
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N            
####

package LIBS::GNRL::Show ;
use strict;
use Module::Util qw(:all);
use vars qw($VERSION @ISA);
@ISA = qw();
$VERSION = '0.01';

###
#
# CONSTRUCTOR DE LA CLASE
#
###
sub new {
    my($class, $ruta) = @_; 
    
    my $self = { 
    	         _RUTA   => undef,
                 
               };  
    
    bless($self, $class);
    return $self;
}



my @todo =(
            "AUX/UTIL",
            "AUX/STRESS",                   
            "AUX/CRAWLERS",
            "AUX/BACKDOORS",
            "AUX/BRUTE-FORCE",
            "AUX/SNIFFERS",
            "AUX/SCANNERS",
            "EXPLOITS/COMMAND-INJECT",
            "EXPLOITS/SQLI",
            "EXPLOITS/CLIENT-SIDE",
            "EXPLOITS/S.O/FREE-BSD",
            "EXPLOITS/S.O/LINUX",
            "EXPLOITS/S.O/MAC",
            "EXPLOITS/S.O/UNIX",
            "EXPLOITS/S.O/WINDOWS",
            "EXPLOITS/S.O/GENERICS",
            "EXPLOITS/LFI",
            "EXPLOITS/LOCAL"
	       );


my @aux =(
          "AUX/UTIL",
          "AUX/STRESS",
          "AUX/CRAWLERS",
          "AUX/BACKDOORS",
          "AUX/BRUTE-FORCE",
          "AUX/SNIFFERS",
          "AUX/SCANNERS"
	     );

my @exploits = (
                "EXPLOITS/COMMAND-INJECT",
                "EXPLOITS/SQLI",
                "EXPLOITS/CLIENT-SIDE",
                "EXPLOITS/S.O/FREE-BSD",
                "EXPLOITS/S.O/LINUX",
                "EXPLOITS/S.O/MAC",
                "EXPLOITS/S.O/UNIX",
                "EXPLOITS/S.O/WINDOWS",
                "EXPLOITS/S.O/GENERICS",
                "EXPLOITS/LFI",
                "EXPLOITS/LOCAL"
	           );



sub listar{


for(my $j = 0; $j<= $#todo; $j++){

opendir(DIR,"$todo[$j]");

my @entradas = grep {!/^\./} readdir(DIR);
closedir(DIR);

for(my $i = 0; $i<= $#entradas; $i++){


my $path = $todo[$j]."/".$entradas[$i] ;

print path_to_module($path);
print "\n" ;

} 

} 

}

sub find {
    my ($self, $search_term) = @_; 

    #my $search_term_regex = qr/$search_term/i;

    for ( my $j = 0; $j <= $#todo; $j++ ) { 
        my (@entries);
        opendir( DIR, "$todo[$j]" );
        push @entries, grep { ! /^\./ } readdir( DIR );
        closedir( DIR );

        for ( my $i = 0; $i <= $#entries; $i++ ) { 
            if ( $entries[ $i ] =~ /$search_term/i ) { 
                my $path = $todo[ $j ] . "/" . $entries[ $i ];
                print path_to_module( $path );
                print "\n";
            }   
        }   
    }   
}



sub listar_aux{


for(my $j = 0; $j<= $#aux; $j++){

opendir(DIR,"$aux[$j]");

my @entradas = grep {!/^\./} readdir(DIR);
closedir(DIR);

for(my $i = 0; $i<= $#entradas; $i++){


my $path = $aux[$j]."/".$entradas[$i] ;

print path_to_module($path);
print "\n" ;

} 

} 

}



sub listar_exp{


for(my $j = 0; $j<= $#exploits; $j++){

opendir(DIR,"$exploits[$j]");

my @entradas = grep {!/^\./} readdir(DIR);
closedir(DIR);

for(my $i = 0; $i<= $#entradas; $i++){


my $path = $exploits[$j]."/".$entradas[$i] ;

print path_to_module($path);
print "\n" ;

} 

} 

}


####
#
# CONTADOR
#
####


sub count
{
my($self,$ruta) = @_;

$self->{'_RUTA'} = $ruta if @_ ;

opendir(DIR,"$self->{'_RUTA'}");
my @entradas = grep {!/^\./} readdir(DIR);

closedir(DIR);
return  scalar(@entradas);

}


1;
