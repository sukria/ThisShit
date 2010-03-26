package ThisShit;
use Dancer ':syntax';

# http://$noun.$verb.this-shit.com
get '/' => sub {
    my $host = request->host;
    my ($noun, $verb) = split(/\./, $host);
    debug "Host is : $host";
    debug "noun, verb: $noun, $verb";

    my $phrase = config->{shits}{$noun}{$verb};
    return $phrase if defined $phrase;


    return "$noun $verb this shit.";
};

true;
