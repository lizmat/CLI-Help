NAME
====

CLI::Help - add -h / --help parameters to your script

SYNOPSIS
========

```raku
proto sub MAIN(|) {*}
use CLI::Help %?RESOURCES, &MAIN;
```

DESCRIPTION
===========

CLI::Help adds a `multi sub` candidate to the `&MAIN` function in your script, that will trigger if the script is called with `-h` or `--help` named arguments **only**, and any positional arguments.

For instance, in the [App::Rak](https://raku.land/zef:lizmat/App::Rak) distribution, which provides a `rak` CLI, calling `rak --help` will result in something like:

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/CLI-Help . Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2022 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

