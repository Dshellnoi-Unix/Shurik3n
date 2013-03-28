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
#   CLASE        :      AUX::UTIL::AlphaNumPattern                                                             
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              28-3-2013                             
#   ACTUALIZACION:      
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N WEB TOOL           
####

package AUX::UTIL::AlphaNumPattern;
use LIBS::GNRL::Texto;
use LIBS::GNRL::Colores ;
use strict;

use vars qw($VERSION @ISA);
@ISA = qw(); 
$VERSION = '0.01';


sub new {
    my($class) = @_;
    
     my $self =  ( { Title        => "AlphaNumPattern",
                    Author        => "Dshellnoi Unix",
                    Date          => "28.03.2013",
                    Ranking       => "Normal", 
                    Webauthor     => "http://templesec.org", 
                    Descrition    =>qq[Create pattern numeric, alphanumeric],

                    ARG           => [
                                      ["NUM"       ,"Sets the num"              ,1],
                                      ["NUMERIC"   ,"Sets YES for numeric"      ,0],
                                      ["ALPHA"     ,"Sets YES for alphanumeric" ,0]
                                     ],
                  


                 });
     

    bless($self, $class);
    return $self;
}


sub run
{

my($self,@data) = @_;


my $texto =  LIBS::GNRL::Texto->new(); 
my $color =  LIBS::GNRL::Colores->new(); 
    

if($data[0] !~ /[0-9]/) {
        $color->pinta("ROJO", "[-]This is not a number\n") ;
        goto SHELL ;
    }


if($texto->may($data[1])  eq 'YES' and  $texto->may($data[2])  eq 'YES' ){

 $color->pinta("ROJO", "[-]You can not set NUMERIC, ALPHA at once\n") ;
 goto SHELL ;
}


if($texto->may($data[1])  eq 'YES'){
my @chars = (1 .. 9);
my $out = join("", @chars[ map { rand @chars } ( 1 .. $data[0] ) ]);
print $out ."\n";
goto SHELL ;
}



if($texto->may($data[2])  eq 'YES'){
my @chars = ( "A" .. "Z", "a" .. "z", 1 .. 9);
my $out = join("", @chars[ map { rand @chars } ( 1 .. $data[0] ) ]);
print $out ."\n";
goto SHELL ;
}

$color->pinta("ROJO", "[-]This is not a valid option\n") ;

}

1;