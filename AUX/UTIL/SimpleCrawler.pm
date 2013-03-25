package AUX::UTIL::SimpleCrawler ;
use strict;
use Google::Search ;
use vars qw($VERSION @ISA);
@ISA = qw(); 
$VERSION = '0.01';


sub new {
    my($class) = @_;
    
     my $self =  ( { Title        => "SimpleCrawler 1.0",
                    Author        => "Dshellnoi Unix",
                    Platform      => "NULL",
                    Type          => "AUX",
                    Date          => "26.03.2013", 
                    Ranking       => "Normal",
                    Webauthor     => "http://templesec.org", 
                    Descrition    =>qq[Module to query google],
                    ARG           => [
                                      ["QUERY"   ,"Set the query"   ,1]
                                      ],
                  


                 });
     

    bless($self, $class);
    return $self;
}


sub run
{

my($self,@data) = @_;

my $search = Google::Search->Web( query => "$data[0]" );
    while ( my $result = $search->next ) {
        print $result->rank, " ", $result->uri, "\n";
    }

}

1;