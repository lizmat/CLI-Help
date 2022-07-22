sub default-handler($text, @, :verbose($)) {
    say $text;
}

sub EXPORT($RESOURCES, &proto, &handle = &default-handler, $long-only = "") {
    with $RESOURCES {
        my sub doit(@keys, $verbose) {
            with quietly $RESOURCES{('help',|@keys).join("/") ~ '.txt'}.open {
                handle .slurp(:close).chomp, @keys, :$verbose;
                exit;
            } 
            else {
                note("Unknown help category: @keys[]");
                exit 1;
            }
        }

        &proto.add_dispatchee: $long-only
          ?? my multi sub MAIN(*@keys, :$help!, :$verbose) {
                 doit @keys, $verbose
             }
          !! my multi sub MAIN(*@keys, :h(:$help)!, :$verbose) {
                 doit @keys, $verbose
             }
    }

    BEGIN Map.new
}

=begin pod

=head1 NAME

CLI::Help - add -h / --help parameters to your script

=head1 SYNOPSIS

=begin code :lang<raku>

proto sub MAIN(|) {*}
use CLI::Help %?RESOURCES, &MAIN;

sub handler($text, @subsections, :$verbose) {
    say "Help for foo @subsections";
    say $text;
    say "Verbose version" if $verbose;
}
use CLI::Help %?RESOURCES, &MAIN, &handler;

use CLI::Help %?RESOURCES, &MAIN, &handler, 'long-only';

=end code

=head1 DESCRIPTION

CLI::Help adds a C<multi sub> candidate to the C<&MAIN> function in
your script, that will trigger if the script is called with C<-h> or
C<--help> named arguments B<only>, and any positional arguments.

For instance, in the L<App::Rak|https://raku.land/zef:lizmat/App::Rak>
distribution, which provides a C<rak> CLI, calling C<rak --help> will
result in something like:

=begin code :lang<bash>

$ rak --help
rak - a CLI for searching strings in files and more
---------------------------------------------------
...

=end code

And calling C<rak --help --verbose>

=begin code :lang<bash>

$ rak --help --verbose
rak - a CLI for searching strings in files and more
---------------------------------------------------
...

Provided by App::Rak - 0.0.14 by Elizabeth Mattijsen,
  implemented in the Raku® Programming Language 6.d,
  running on Rakudo™ 2022.06.55, built on Moar 2022.06.2.

Suggestions / bug reports / general comments are welcome at
  https://github.com/lizmat/App-Rak

Thank you for using rak!

=end code

By specifying a true value as the 4th argument in the C<use>
statement, will cause only C<--help> to trigger the candidate.

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/CLI-Help .
Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a
L<small sponsorship|https://github.com/sponsors/lizmat/>  would mean a great
deal to me!

=head1 COPYRIGHT AND LICENSE

Copyright 2022 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
