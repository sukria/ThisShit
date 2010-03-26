# PSGI application bootstraper for Dancer
use lib '/srv/this-shit.com';
use ThisShit;

use Dancer::Config 'setting';
setting apphandler  => 'PSGI';
setting environment => 'production';
Dancer::Config->load;

my $handler = sub {
    my $env = shift;
    my $request = Dancer::Request->new($env);
    Dancer->dance($request);
};
