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
#   CLASE      :        AUX::UTIL::Md5Crack                                                             
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              2-3-2013                             
#   ACTUALIZACION:      
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N           
####

package AUX::UTIL::Md5Crack;
use strict;
use LWP::Simple;
use LWP::UserAgent;
use LIBS::GNRL::Colores ;

use vars qw($VERSION @ISA);
@ISA = qw(); 
$VERSION = '0.01';


sub new {
    my($class) = @_;
    
     my $self =  ( { Title        => "Simple md5 crack",
                    Author        => "Dshellnoi Unix",
                    Date          => "26.03.2013",
                    Ranking       => "Normal", 
                    Webauthor     => "http://templesec.org", 
                    Descrition    =>qq[Module to crack md5 hash],

                    ARG           => [
                                      ["HASH"   ,"Sets the md5" ,1],
                                      ["UA"     ,"Sets the ua " ,1]
                                     ],
                  


                 });
     

    bless($self, $class);
    return $self;
}


sub run
{

my($self,@data) = @_;


if(length($data[0]) ne 32){

my $error =  LIBS::GNRL::Colores->new(); 
   $error->pinta("ROJO", "[-]This is not a md5 hash\n") ;
goto SHELL;

}


my $ua = new LWP::UserAgent;
   $ua->agent($data[1]);
my $req = new HTTP::Request "GET" => "http://md5.gromweb.com/query/$data[0]";
   $req->header('Accept' => 'text/html');
my $res = $ua->request($req); 


if(length($res->decoded_content()) eq 0){

my $error =  LIBS::GNRL::Colores->new(); 
   $error->pinta("ROJO", "[-]Nothing found\n") ;
   goto SHELL;

}
                                               
print "[+]Found::[".$res->decoded_content()."]::[$data[0]]\n";

}

1;