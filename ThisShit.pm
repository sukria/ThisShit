package ThisShit;
use Dancer ':syntax';
use Template;

# http://$noun.$verb.this-shit.com
get '/' => sub {
    my $host = request->host;
    $host =~ s/this-shit.com.*$//;

    my @words = split(/\./, $host);
    my $verb = pop @words;
    my $noun = join(' ', @words);

    my $item = config->{shits}{$noun}{$verb};
    my $title = "$noun $verb this shit.";

    if (not defined $item) {
        return template('home' => { title => $title, phrase => $title});
    }

    if (ref($item) && ref($item) eq 'HASH') {
        return template($item->{view}, { title => $title});
    }

    template 'home' => { title => $title, phrase => $item};
};

true;
