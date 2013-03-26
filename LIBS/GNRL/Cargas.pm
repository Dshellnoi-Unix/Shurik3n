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
#   CLASE      :        LIBS::GNRL::Cargas.pm                                                             
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              15-3-2013                             
#   ACTUALIZACION:      25-3-2013 
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N WEB TOOL           
####

package LIBS::GNRL::Cargas ;
use Module::Load;
use Module::Util qw(:all);
use strict ;
use LIBS::GNRL::Colores ;
use vars qw($VERSION @ISA);
@ISA = qw();
$VERSION = '0.01';


sub new {
    my($class, $modulo, @arg) = @_; 
    
    my $self = { 
    	         _MODULO   => undef,
                 _KEY      => undef   
               };  
    
    bless($self, $class);
    return $self;
}




sub modulo_existe 
{

my($self,$modulo) = @_;
$self->{_MODULO} = $modulo ;


my $path = module_path("$self->{_MODULO}");


if (! -e "$path") {
  
   my $test =  LIBS::GNRL::Colores->new(); 
      $test->pinta("ROJO", "[-]The module does not exist\n") ;
      goto SHELL ;
}

return $self->{_MODULO} ;

}



sub show_opt
{
my($self,$modulo) = @_;
$self->{_MODULO} = $modulo ;

load $self->{_MODULO} ;

my $info= $self->{_MODULO}->new();



for my $arg (@{$info->{ARG}}) {
  print "[$arg->[0]]::[$arg->[1]]"."-->"."$ENV{$arg->[0]}"."\n" ;
}


}



sub in_array {  
      my ($array,$search_for) = @_;  
      my %items = map {$_ => 1} @$array;   
      my $exist = (exists($items{$search_for}))?1:0;  
      return $exist;
 }  



sub existe_parametro
{

my($self,$modulo, $key) = @_;

$self->{_MODULO} = $modulo ;
$self->{_KEY} = $key ;


load $self->{_MODULO} ;
my $info= $self->{_MODULO}->new();



my @items ;
 
for my $arg (@{$info->{ARG}}) {
      push(@items,$arg->[0]);
}



my $cmp_key = in_array(\@items, $self->{_KEY});

if($cmp_key == 0){

	my $test =  LIBS::GNRL::Colores->new(); 
       $test->pinta("ROJO", "[-]Does not exist parameter $self->{_KEY} \n");

       
       goto SHELL ;
                 }



}



sub reset_params
{

my($self,$modulo) = @_;
$self->{_MODULO} = $modulo ;

load $self->{_MODULO} ;

my $info= $self->{_MODULO}->new();


for my $arg (@{$info->{ARG}}) {

delete($ENV{$arg->[0]});

}

}


sub run 
{

my($self,$modulo) = @_;

$self->{_MODULO} = $modulo ;

load $self->{_MODULO} ;

my $exploit= $self->{_MODULO}->new();

my @cmd_modulo ;


for my $arg (@{$exploit->{ARG}}) {

if($arg->[2] == 1 ){

if(!exists($ENV{$arg->[0]})){

my $test =  LIBS::GNRL::Colores->new(); 
   $test->pinta("ROJO", "[-]Configure the parameter $arg->[0]\n");
goto SHELL ;
}

}


if($arg->[2] == 0){

if(!exists($ENV{$arg->[0]})){

$ENV{$arg->[0]} = 0;

}

}


push(@cmd_modulo, $ENV{$arg->[0]});

} 


$exploit->run(@cmd_modulo);

}



sub info
{

my($self,$modulo) = @_;
$self->{_MODULO} = $modulo ;

load $self->{_MODULO} ;

my $info= $self->{_MODULO}->new();

my @keys = (
            "Title",
            "Author",
            "Platform",
            "Type",
            "Os",
            "Date",
            "Ranking",
            "OSVDB",
            "CVE",
            "CWE",
            "Webauthor",
            "Descrition",
           );


for(my $i = 0; $i < @keys ; $i ++){

  if(exists($info->{$keys[$i]})){
       print "[$keys[$i]]-->" . $info->{$keys[$i]} ."\n" ;
      }
}

}




sub modulo_valido
{

my($self,$modulo) = @_;
$self->{_MODULO} = $modulo ;

my @data = split("::", $self->{_MODULO});


my @keys =(
           "AUX", 
           "EXPLOITS"
        );

my $cmp_key = in_array(\@keys, $data[0]);

if($cmp_key == 0){

  my $test =  LIBS::GNRL::Colores->new(); 
       $test->pinta("ROJO", "[-]Load a valid module\n");

      
       goto SHELL ;
                 }


}



1;