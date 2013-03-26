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
#   CLASE      :        AUX::UTIL::ShellcodeHelper                                                             
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              26-3-2013                             
#   ACTUALIZACION:      
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N             
####

package AUX::UTIL::ShellcodeHelper;
use strict;

use vars qw($VERSION @ISA);
@ISA = qw(); 
$VERSION = '0.01';


sub new {
    my($class) = @_;
    
     my $self =  ( { Title        => "ShellcodeHelper",
                    Author        => "Dshellnoi Unix",
                    Date          => "26.03.2013",
                    Ranking       => "Good", 
                    Webauthor     => "http://templesec.org", 
                    Descrition    =>qq[Converts str to 32b memory addresses],

                    ARG           => [
                                      ["STR"   ,"Sets Str to convert" ,1]
                                     ],
                  


                 });
     

    bless($self, $class);
    return $self;
}


sub charshell{

my $str_dos = shift ;

my $len_str = length($str_dos);

#============#
# CONTADORES # 
#============#
 my $ini = 0 ;
 my $des = 1 ;


for(my $i =0 ; $i < $len_str ; $i ++ ){

my $str = substr($str_dos,$ini, $des);

my $st =$str ;
$st =~ s/(.)/sprintf("%x",ord($1))/eg;

print '\x'.$st ;

$ini = $ini + 1 ;

}

print "\n" ;

}


sub run
{

my($self,@data) = @_;

my $largo = length($data[0]) ;

my  $total = $largo / 4 ;

if ($total =~ m/^[0-9]+$/) {

print "========================\n";
print "Total Bytes::" . $largo ."\n";
print "Str to convert:\n" ;
print  $data[0] . "\n" ;
print "=========================\n";
}else{
 
print "Not a multiple of 4 are $largo Bytes, so dumb!!! :)\n";
goto SHELL ;
}

#============#
# CONTADORES # 
#============#
 my $ini = 0 ;
 my $des = 4 ;

for(my $i =0 ; $i < $total ; $i ++ ){

my $str = substr($data[0],$ini, $des);
my $reve  = scalar reverse("$str"), "\n";
my $st = $reve ;
$st =~ s/(.)/sprintf("%x",ord($1))/eg;


print "ORIGINAL: "    . $str . "\n" ;
print "REVERSE : "    . $reve  ."\n";
print "MEM DIRE: "    ."0x",$st."\n";
print "HEX SHELLCODE:\n" ;
&charshell($str) ;





$ini = $ini + 4 ;
 
}

}

1;