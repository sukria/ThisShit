# PSGI application bootstraper for Dancer
use lib '/srv/this-shit.com';
use ThisShit;

use Dancer;
set apphandler  => 'PSGI';
set environment => 'production';

Dancer::Config->load;

my $handler = sub {
    my $env = shift;
    my $request = Dancer::Request->new($env);
    Dancer->dance($request);
};
