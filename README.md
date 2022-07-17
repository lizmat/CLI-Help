[![Actions Status](https://github.com/lizmat/CLI-Help/actions/workflows/test.yml/badge.svg)](https://github.com/lizmat/CLI-Help/actions)

NAME
====

CLI::Help - add -h / --help parameters to your script

SYNOPSIS
========

```raku
proto sub MAIN(|) {*}
use CLI::Help %?RESOURCES, &MAIN;

sub handler($text, @subsections, :$verbose) {
    say "Help for foo @subsections";
    say $text;
    say "Verbose version" if $verbose;
}
use CLI::Help %?RESOURCES, &MAIN, &handler;
```

DESCRIPTION
===========

CLI::Help adds a `multi sub` candidate to the `&MAIN` function in your script, that will trigger if the script is called with `-h` or `--help` named arguments **only**, and any positional arguments.

For instance, in the [App::Rak](https://raku.land/zef:lizmat/App::Rak) distribution, which provides a `rak` CLI, calling `rak --help` will result in something like:

```bash
$ rak --help
rak - a CLI for searching strings in files and more
---------------------------------------------------
...
```

And calling `rak --help --verbose`

```bash
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
```

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/CLI-Help . Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2022 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

