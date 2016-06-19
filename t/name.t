use strict;
use warnings;

use Test2::Bundle::Extended;
use Test2::Plugin::NoWarnings;

use Params::CheckCompiler qw( validation_for );

{
    my $sub = validation_for(
        name   => 'Check for X',
        params => { foo => 1 },
    );

    my $e = dies { $sub->() };
    like(
        $e->trace->as_string,
        qr/main::Check for X/,
        'got expected sub name in stack trace',
    );
}

done_testing();
