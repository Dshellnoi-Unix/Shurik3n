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
#   CLASE      :        AUX::UTIL::WPauditor                                                             
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              20-4-2013                             
#   ACTUALIZACION:      
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N            
####

package AUX::UTIL::WPauditor ;
use strict;
use LWP::UserAgent;
use strict ;
use XML::Simple;
use LIBS::GNRL::Files ;
use LWP::Protocol::socks ;
use LIBS::GNRL::Colores ;
use LIBS::GNRL::Texto ;
use DICC::WP::WPbugs ; 
use Switch;
use Module::Util qw(:all);


use vars qw($VERSION @ISA);
@ISA = qw(); 
$VERSION = '0.01';


sub new {
    my($class) = @_;
    
     my $self =  ( { Title        => "WPauditor",
                    Author        => "Dshellnoi Unix",
                    Type          => "AUX",
                    Date          => "20.04.2013",
                    Ranking       => "Normal", 
                    Webauthor     => "http://templesec.org", 
                    Descrition    =>qq[Module to audit WordPress],
                    ARG           => [
                                      ["TARGET","Set the target"       ,1],
                                      ["UA"    ,"Set the User Agent"   ,0],
                                      ["PROXY" ,"Set the proxy"        ,0],                                  
                                      ],
                  


                 });
     

    bless($self, $class);
    return $self;
}


sub run
{

my($self,@data) = @_;  

my $url =  "$data[0]";
my $user_agent ;
my $stop ;


if($url !~ /\/$/){
$url = $url."/";
}



my $file_plugs = LIBS::GNRL::Files->new();
   $file_plugs->cmpfile("DICC/WP/wp-plugins.xml") ;
                     
my $file_tem = LIBS::GNRL::Files->new();
   $file_tem->cmpfile("DICC/WP/wp-themes.xml") ;



my $datos = XMLin('DICC/WP/wp-plugins.xml', forcearray=>1);
my $tem = XMLin('DICC/WP/wp-themes.xml', forcearray=>1);




##
## COMPROVAMOS URI
##

my $cmp_uri = LIBS::GNRL::Texto->new();
   $cmp_uri->cmp_url($url); 


#
# CONFIGURAMOS EL UA
#

if($data[1] eq 0){

$user_agent = "$0/0.1" ;

}
else{

$user_agent = $data[1] ;

}


my $ua = new LWP::UserAgent;
   $ua->timeout(60);
   $ua->agent("$user_agent");


#
# CONFIGURAMOS EL PROXY
#

if($data[2] ne 0){

my $cmp_proxy = LIBS::GNRL::Texto->new();
   $cmp_proxy->cmp_proxy($data[2]); 
   $ua->proxy([qw(http https)] => "$data[2]");

}


print "[+]Going into stealth mode, one shot!!!\n";
sleep 2;

 
my $response = $ua->get("$url"); 

if($response->code eq 404){

my $err =  LIBS::GNRL::Colores->new(); 
   $err->pinta("ROJO", "[-]Not found Status [404]\n");
   goto SHELL; 
}


if($response->code eq 500){

my $err =  LIBS::GNRL::Colores->new(); 
   $err->pinta("ROJO", "[-]Something goes wrong, check target,internet connection or socks\n");
   goto SHELL; 
}


open(FILE, ">/tmp/salida.txt");
  print FILE $response->as_string;
close(FILE);



my $version ;
my $teme ;
my $jquery ;
my @plugs ;




my $count_version = 0;
my $count_temes = 0 ;
my $count_jquery = 0 ;


my @titulo ;
my @version ;
my @adv     ;
my @vuln    ;

my @titulo_tem ;
my @version_tem ;
my @adv_tem     ;
my @vuln_tem    ;




open(WP, "/tmp/salida.txt");

while (my $p = <WP>) { 


 if($p =~ m/(content=.)+(WordPress.)+(\d.\d.\d|\d.\d)/) {
  if($count_version eq 0){
       $version = $3  ;
         $count_version ++ ;
       }
         } 


if($p =~ m/(\/themes\/)+([a-zA-Z0-9_-]{1,})/) {
      if($count_temes eq 0){
         $teme = $2  ;
         $count_temes ++ ;
       }
    }


if($p =~ m/(jquery)+(.js\?ver=)+(\d.\d.\d)/) {        
        if($count_jquery eq 0){
          $jquery = $3  ;
          $count_jquery ++ ;
       }
    }


if($p =~ m/(\/plugins\/)+([a-zA-Z0-9_-]{1,})/) {  
      if (!grep $_ eq $2, @plugs) {
            push(@plugs, $2);
                                  }   
    }



       
}#WHILE
close(WP);




print "[+]Trying to identify WP version\n" ;

sleep 1;

print "[+]Trying to identify Jquery version\n" ;

sleep 1;

print "[+]Trying to identify vulnerabilities in  plugin's\n" ;

sleep 2;



#
#
# AQUI EMPEZAMOS A TRABAJAR LOS PLUGINS 
#
#



for(my $i =0 ; $i < scalar(@plugs); $i++) {

sleep 1;

$plugs[$i] =~ tr/-/_/;

my $PLUG_NAME = $plugs[$i] ;


  if (!exists $datos->{plug}->{$PLUG_NAME}->{plugname}){

                $PLUG_NAME = $plugs[$i] ;
             my $test =  LIBS::GNRL::Colores->new(); 
                $test->pinta("ROJO", "[-]The plugin $PLUG_NAME not have vulnerabilities\n") ;
  } 
else{



print "[+]Found a vulnerability in $PLUG_NAME\n";

for my $arg (@{$datos->{plug}->{$PLUG_NAME}->{tit}}) {
  
    push(@titulo, $arg);
}

for my $arg (@{$datos->{plug}->{$PLUG_NAME}->{version}}) {

    push(@version, $arg);
}

for my $arg (@{$datos->{plug}->{$PLUG_NAME}->{adv}}) {
  
    push(@adv, $arg);
}

for my $arg (@{$datos->{plug}->{$PLUG_NAME}->{vuln}}) {
  
  push(@vuln, $arg);
   
}

}

}



#
#
# TRABAJAMOS CON LOS THEMES
#
#


if(defined $teme){


print "[+]Trying to identify vulnerabilities in the theme\n" ;
sleep 3;


$teme =~ tr/-/_/;

my $TEM_NAME = $teme ;

 

  if (!exists $tem->{theme}->{$TEM_NAME}->{temname}){

           
             my $test =  LIBS::GNRL::Colores->new(); 
                $test->pinta("ROJO", "[-]The Theme $TEM_NAME not have vulnerabilities\n") ;
           
  } 
else{



print "[+]Found a vulnerability in $TEM_NAME\n";

for my $arg (@{$tem->{theme}->{$TEM_NAME}->{tit}}) {
  
    push(@titulo_tem, $arg);
}

for my $arg (@{$tem->{theme}->{$TEM_NAME}->{version}}) {

    push(@version_tem, $arg);
}

for my $arg (@{$tem->{theme}->{$TEM_NAME}->{adv}}) {
  
    push(@adv_tem, $arg);
}

for my $arg (@{$tem->{theme}->{$TEM_NAME}->{vuln}}) {
  #print $arg . "\n" ;
  push(@vuln_tem, $arg);
   
}

}

}


unlink("/tmp/salida.txt");



#
#
# VOLCAMOS LOS DATOS
#
#


print "\n\n" ;

if(defined $version or defined $teme or defined $jquery){

print "======================================================\n";
print "                     INFO                             \n";
print "======================================================\n";

if(defined $version){
print "WordPress version                :: "    . $version ."\n";
}

if(defined $teme){
print "WordPress Theme                  :: "    . $teme ."\n";
}

if(defined $jquery){
print "JQuery version                   :: "    . $jquery ."\n";
}

if(scalar(@plugs) > 0){
print "Total plugins found              :: "    . scalar(@plugs) . "\n\n\n" ;
}

}else{

my $test =  LIBS::GNRL::Colores->new(); 
   $test->pinta("ROJO", "[-]Not found, important information about the target\n") ;
   $test->pinta("ROJO", "[-]Are you sure that the target has wordpress installed?: Y/N ") ;

my $opt=<STDIN>; 
     chop($opt);

my $texto =  LIBS::GNRL::Texto->new();
my $nocase = $texto->may($opt); 

     if($nocase eq "N" or $nocase eq "NOT" or $nocase eq "NO"){
         goto SHELL ;
       }
   
}




if(scalar(@titulo) > 0){

print "======================================================\n";
print "                   PLUGINS  VULNS                      \n";
print "======================================================\n";


for(my $i =0; $i< scalar(@titulo) ; $i ++){

print "[+]Title  :\n" ;
print "$titulo[$i]\n" ;
print "[+]Version : [$version[$i]]\n";
print "[+]Vuln :$vuln[$i]\n";
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
print "[+]Version : [$version_tem[$i]\n";
print "[+]Vuln :$vuln_tem[$i]\n";
print "[+]Exploit | Advisory :\n";
print "$adv_tem[$i]"."\n\n\n";

}
}



my $term =  LIBS::GNRL::Colores->new(); 
   $term->pinta("ROJO", "[+]Want to get in mode suicide? Y/N ") ;

 my $opt=<STDIN>; 
     chop($opt);

my $texto =  LIBS::GNRL::Texto->new();
my $nocase = $texto->may($opt); 

     if($nocase eq "N" or $nocase eq "NOT" or $nocase eq "NO"){
         goto SHELL ;
       } 

$term->pinta("ROJO", "[+]Use this mode is your responsibility and it is illegal,\n we continue with the analysis? Y/N ") ;

my $opt=<STDIN>; 
     chop($opt);

my $texto =  LIBS::GNRL::Texto->new();
my $nocase = $texto->may($opt); 

     if($nocase eq "N" or $nocase eq "NOT" or $nocase eq "NO"){
         goto SHELL ;
       } 

print "\n" ;




my $term =  LIBS::GNRL::Colores->new(); 
   $term->pinta("ROJO", "[+]want to stop first vulnerability?  Y/N ") ;

 my $opt=<STDIN>; 
     chop($opt);

my $texto =  LIBS::GNRL::Texto->new();
my $nocase = $texto->may($opt); 

if($nocase eq "Y" or $nocase eq "YES" or $nocase eq "SI"){
         $stop = 1;
  } 

 print "\n" ;    


my $pt_payload ;
my @founds ;
my $wrong_status = 0;



print "[+]Total payloads that will be launched::[";
print scalar(@bugs)."]\n\n";

for(my $i=0; $i < scalar(@bugs); $i++){




my $ua = new LWP::UserAgent;
   $ua->timeout(60);
   $ua->agent("$user_agent");


if($data[2] ne 0){

my $cmp_proxy = LIBS::GNRL::Texto->new();
   $cmp_proxy->cmp_proxy($data[2]); 
   $ua->proxy([qw(http https)] => "$data[2]");

}

 
print "[+]looking for: $bugs[$i]->{tit}\n";


my $response = $ua->get($url.$bugs[$i]->{payload});


switch ($response->code) {

case 200  { 
            push(@founds, $i);
          }

case 403  { 
           push(@founds, $i);
          }

case 500  { 
           $wrong_status = $wrong_status + 1;
           if($wrong_status eq 4){
            my $err =  LIBS::GNRL::Colores->new(); 
               $err->pinta("ROJO", "[-]Something goes wrong, check scanner settings, internet connection or socks\n") ;
               goto SHELL ;
           }

          }

}

sleep 1 ;


if($stop eq 1){
  if(scalar(@founds) > 0){
   last ;
 }
  }


}



my $panel;
my $robots ;
my $trans ;


my @extra_data=(
                "wp-admin/",
                "robots.txt",
                "wp-content/"
               );


for(my $i=0; $i < scalar(@extra_data); $i++){

my $ua = new LWP::UserAgent;
   $ua->timeout(60);
   $ua->agent("$user_agent");



if($data[2] ne 0){

my $cmp_proxy = LIBS::GNRL::Texto->new();
   $cmp_proxy->cmp_proxy($data[2]); 
   $ua->proxy([qw(http https)] => "$data[2]");

}


my $response = $ua->get($url.$extra_data[$i]);


if($response->code eq 200){

switch ($i) {

case 0    { 
            $panel = $url.$extra_data[$i];
          }

case 1    { 
            $robots = $url.$extra_data[$i];
          }

case 2    { 
            if($response->header('content-length') ne 0){
               $trans = $url.$extra_data[$i];
            }
            
          }

}

}


print "\n";

}


if(defined $panel  or defined $robots or defined $trans){

print "======================================================\n";
print "                     EXTRA DATA                       \n";
print "======================================================\n";

}

if(defined $panel){
print "[+]Admin panel:".$panel."\n";
}

if(defined $robots){
print "[+]Robots     :".$robots."\n";
}

if(defined $trans){
print "[+]Tranversal :".$trans."\n";
}


sleep 2;

print "\n\n";

if(scalar(@founds) > 0){
print "======================================================\n";
print "                  VULNS     FOUNDS                    \n";
print "======================================================\n";


for(my $j=0; $j < scalar(@founds); $j++){

print "[+]Title  :\n" ;
print $bugs[$founds[$j]]->{tit}."\n";
print "[+]Version : [$bugs[$founds[$j]]->{version}]\n";
print "[+]Vuln :[$bugs[$founds[$j]]->{vuln}]\n";
print "[+][Exploit | Advisory]:\n";
print $bugs[$founds[$j]]->{adv}."\n";
print "[+]Payload:\n";
print $url.$bugs[$founds[$j]]->{payload}."\n\n";

}

}else{

my $test =  LIBS::GNRL::Colores->new(); 
   $test->pinta("ROJO", "[-]Not found, important information about the target\n") ;

}




}

1;