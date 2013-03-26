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
#   CLASE      :        AUX::UTIL::Getip                                                             
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              25-3-2013                             
#   ACTUALIZACION:      
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N            
####

package AUX::UTIL::Getip ;
use strict;
use LWP::Simple;
use LWP::UserAgent;
use vars qw($VERSION @ISA);
@ISA = qw(); 
$VERSION = '0.01';


sub new {
    my($class) = @_;
    
     my $self =  ( { Title        => "Get ip",
                    Author        => "Dshellnoi Unix",
                    Date          => "25.03.2013", 
                    Webauthor     => "http://templesec.org", 
                    Descrition    =>qq[Module to get ip from the console
                                       ],
                    ARG           => [

                                      
                                      
                                      ],
                  


                 });
     

    bless($self, $class);
    return $self;
}


sub run
{

my $ua = new LWP::UserAgent;
   $ua->agent("$0/0.1 " . $ua->agent);
my $req = new HTTP::Request "GET" => "http://cloud.templesec.org/KENJUTSU/ip.php";
   $req->header('Accept' => 'text/html');
my $res = $ua->request($req); 

if ($res->is_error) {
    printf "Status::[%d]\n", $res->code;
    goto SHELL;
  }

   print $res->decoded_content();
}

1;
