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
#   CLASE      :        AUX::UTIL::WpVulnDataBase                                                             
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              08-4-2013                             
#   ACTUALIZACION:      
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N            
####

package AUX::UTIL::WpVulnDataBase   ;
use strict;
use XML::Simple;
use LIBS::GNRL::Files ;
use LIBS::GNRL::Colores ;
use LIBS::GNRL::Texto ;


use vars qw($VERSION @ISA);
@ISA = qw(); 
$VERSION = '0.01';


sub new {
    my($class) = @_;
    
     my $self =  ( { Title        => "WpVulnDataBase",
                    Author        => "Dshellnoi Unix",
                    Type          => "AUX",
                    Date          => "8.04.2013",
                    Ranking       => "Normal", 
                    Webauthor     => "http://templesec.org", 
                    Descrition    =>qq[Module to see if a plugin or theme of WP has known vulnerabilities],
                    ARG           => [
                                      ["QUERY","Set the query"       ,1],
                                     ],
                  


                 });
     

    bless($self, $class);
    return $self;
}


sub run
{
my($self,@data) = @_;  

my $query =  "$data[0]";


my @titulo ;
my @version ;
my @adv     ;
my @vuln    ;



my @titulo_tem ;
my @version_tem ;
my @adv_tem     ;
my @vuln_tem    ;



my $file_plugs = LIBS::GNRL::Files->new();
   $file_plugs->cmpfile("DICC/WP/wp-plugins.xml") ;
                     
my $file_tem = LIBS::GNRL::Files->new();
   $file_tem->cmpfile("DICC/WP/wp-themes.xml") ;

my $datos = XMLin('DICC/WP/wp-plugins.xml', forcearray=>1);
my $tem = XMLin('DICC/WP/wp-themes.xml', forcearray=>1);





$query =~ tr/-/_/;

my $QUERY = $query ;


if (!exists $datos->{plug}->{$QUERY}->{plugname} and !exists $tem->{theme}->{$QUERY}->{temname}){

                
                my $test =  LIBS::GNRL::Colores->new(); 
                $test->pinta("ROJO", "[-] $QUERY not have vulnerabilities\n") ;
                goto SHELL ;
  } 



if (exists $tem->{theme}->{$QUERY}->{temname}){



for my $arg (@{$tem->{theme}->{$QUERY}->{tit}}) {
  
    push(@titulo_tem, $arg);
}

for my $arg (@{$tem->{theme}->{$QUERY}->{version}}) {

    push(@version_tem, $arg);
}

for my $arg (@{$tem->{theme}->{$QUERY}->{adv}}) {
  
    push(@adv_tem, $arg);
}

for my $arg (@{$tem->{theme}->{$QUERY}->{vuln}}) {
 
  push(@vuln_tem, $arg);
   
}


}


if (exists $datos->{plug}->{$QUERY}->{plugname}){


for my $arg (@{$datos->{plug}->{$QUERY}->{tit}}) {
  
    push(@titulo, $arg);
}

for my $arg (@{$datos->{plug}->{$QUERY}->{version}}) {

    push(@version, $arg);
}

for my $arg (@{$datos->{plug}->{$QUERY}->{adv}}) {
  
    push(@adv, $arg);
}

for my $arg (@{$datos->{plug}->{$QUERY}->{vuln}}) {
  
  push(@vuln, $arg);
   
}

}



if(scalar(@titulo) > 0){

print "======================================================\n";
print "                   PLUGINS  VULNS                      \n";
print "======================================================\n";


for(my $i =0; $i< scalar(@titulo) ; $i ++){

print "[+]Title  :\n" ;
print "$titulo[$i]\n" ;
print "[+]Version && Vuln : [$version[$i]]| |[$vuln[$i]]\n";
print "[+]Exploit | Advisory :\n";
print "$adv[$i]"."\n\n\n";

}

}



if(scalar(@titulo_tem) > 0){
print "======================================================\n";
print "                      THEME                           \n";
print "======================================================\n";


for(my $i =0; $i< scalar(@titulo_tem) ; $i ++){

print "[+]Title  :\n" ;
print "$titulo_tem[$i]\n" ;
print "[+]Version && Vuln : [$version_tem[$i]]| |[$vuln_tem[$i]]\n";
print "[+]Exploit | Advisory :\n";
print "$adv_tem[$i]"."\n\n\n";

}
}




}

1;