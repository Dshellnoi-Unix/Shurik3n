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
#   CLASE      :        AUX::UTIL::FileDiscoverer                                                             
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              01-4-2013                             
#   ACTUALIZACION:      
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N            
####

package AUX::UTIL::FileDiscoverer ;
use strict;
use LWP::Simple;
use LWP::UserAgent;
use Switch;
use LIBS::GNRL::Files;
use LWP::Protocol::socks ;
use LIBS::GNRL::Colores ;
use LIBS::GNRL::Texto ;

use vars qw($VERSION @ISA);
@ISA = qw(); 
$VERSION = '0.01';


sub new {
    my($class) = @_;
    
     my $self =  ( { Title        => "Discoverer 1.0",
                    Author        => "Dshellnoi Unix",
                    Type          => "AUX",
                    Date          => "26.03.2013", 
                    Ranking       => "Normal",
                    Webauthor     => "http://templesec.org", 
                    Descrition    =>qq[Module to search for files or admin panels, +info man],
                    ARG           => [
                                      ["DIC"   ,"Set the dic, conf your own with the path"   ,1],
                                      ["UA"    ,"Set the User Agent"   ,0],
                                      ["PROXY" ,"Set the proxy"        ,0],
                                      ["TARGET","Set the target"       ,1],
                                      ["PT"    ,"Set the path"         ,1]
                                      ],
                  


                 });
     

    bless($self, $class);
    return $self;
}


sub run
{


my($self,@data) = @_;

my @strange ;
my @proh ;
my @founds ;
my $url =  "$data[3]";
my $path = "$data[4]" ;
my $user_agent ;
my @steps ;
my $dicc ;

##
## COMPROVAMOS URI
##

my $cmp_uri = LIBS::GNRL::Texto->new();
   $cmp_uri->cmp_url($url); 


#
# COMPROVAMOS EL DICCIONARIO
#

switch ($data[0]) {

case "def"        { 
                   my $file = LIBS::GNRL::Files->new();
                      $file->cmpfile("DICC/def") ;
                      $dicc = "DICC/$data[0]" ;
                  }

else              {
                   my $file = LIBS::GNRL::Files->new();
                      $file->cmpfile("$data[0]") ;
                      $dicc = "$data[0]" ;
                  }


}

#
# PATH
#

my $cmp_path = LIBS::GNRL::Texto->new();
   $cmp_path->cmp_path($path); 



#
# CONFIGURAMOS EL UA
#

if($data[1] eq 0){

$user_agent = "$0/0.1" ;

}
else{

$user_agent = $data[1] ;

}



open (LEE, "$dicc"); 
@steps = <LEE>;
close @steps;



for my $step (@steps) {

  
        
my $ua = new LWP::UserAgent;
   $ua->timeout(60);
   $ua->agent("$user_agent");



if($data[2] ne 0){

my $cmp_proxy = LIBS::GNRL::Texto->new();
   $cmp_proxy->cmp_proxy($data[2]); 
   $ua->proxy([qw(http https)] => "$data[2]");

}



my $req = new HTTP::Request "GET" => "$url$path$step";
   $req->header('Accept' => 'text/html');
my $res = $ua->request($req); 


#imprimimos el estado#
print "--------------------\n";
print "$step------->";
printf("Status[%d]", $res->code);
print "\n";


switch ($res->code) {

case 200  { 
           push(@founds, $step);
          }

case 300  { 
           push(@strange, "$step-->multiple Choice 300") ;
          }

case 301  { 
           push(@strange, "$step-->Moved Permanently 301") ;
          }

case 302  { 
           push(@strange, "$step-->redirection 302") ;
          }

case 303  { 
           push(@strange, "$step-->See Other 303") ;
          }

case 400  { 
           my $test =  LIBS::GNRL::Colores->new(); 
           $test->pinta("ROJO", "Bad Request\n") ;
           goto SHELL;
          }

case 403  { 
           push(@proh, $step);
          }

case 408  { 
           my $test =  LIBS::GNRL::Colores->new(); 
           $test->pinta("ROJO", "Timeout expired\n") ;
           goto SHELL;
          }

case 413  { 
           push(@strange, "$step::Request Entity too large 413");
          }

case 414  { 
           push(@strange, "$step:: Request URI too long 414");
          }

case 500  { 
           my $test =  LIBS::GNRL::Colores->new(); 
           $test->pinta("ROJO", "[-]Internal Server Error\n") ;
           goto SHELL;
          }

case 501  { 
           my $test =  LIBS::GNRL::Colores->new(); 
           $test->pinta("ROJO", "[-]Protocol not implemented\n") ;
           goto SHELL;
          }

case 505  { 
           my $test =  LIBS::GNRL::Colores->new(); 
           $test->pinta("ROJO", "[-]HTTP version not supported\n") ;
           goto SHELL;
          }

}#case


}#termina for





##
# VOLCADO DE DATOS EN PANTALLA
##
if(scalar(@founds) > 0 ){

print <<FOUNDS;
===========================================
|                FOUNDS                   |
===========================================
FOUNDS

for my $found (@founds) {

print $found ."\n";

}
}


if(scalar(@proh) > 0 ){
print <<RES;
===========================================
|               RESTRICTED                 |
===========================================
RES

for my $proh (@proh) {

print $proh ."\n";

}
}


if(scalar(@strange) > 0 ){

print <<STR;
===========================================
|                STRANGE                  |
===========================================
STR

for my $str (@strange) {

print $str ."\n";

}
}


my $total = scalar(@founds) + scalar(@proh) + scalar(@strange) ;


if($total == 0){

print "\n";
my $test =  LIBS::GNRL::Colores->new(); 
   $test->pinta("ROJO", "[-]Nothing found\n") ;
print "\n";
}



}

1;