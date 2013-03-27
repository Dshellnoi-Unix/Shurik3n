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
#   CLASE      :        LIBS::GNRL::Help                                                             
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              12-2-2013                             
#   ACTUALIZACION:       
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N            
####

package LIBS::GNRL::Help ;

sub new {
    my($class) = @_; 
    
    my $self = {};  
    
    bless($self, $class);
    return $self;
}


sub help
{
print "===========================\n";
print "       Help Shurik3n       \n";
print "===========================\n";
print "CLEAR----->Clean the screen\n";
print "EXIT------>Exits the program\n" ;
print "UA-------->Displays user agents\n" ;
print "LOAD------>Load a module\n" ;
print "BACK------>Unload a module \n" ;
print "INFO------>Information Module\n" ;
print "OPT------->Module Options\n" ;
print "CONF------>Configure a parameter\n" ;
print "RESET----->Reset the parameters of a module\n" ;
print "RUN------->Run a module\n";
print "SHOW------>Displays all modules\n";
print "AUX------->Displays aux modules\n";
print "EXPLOITS-->Displays all exploits\n";
print "HELP------>Help shurik3n\n";
}

1;