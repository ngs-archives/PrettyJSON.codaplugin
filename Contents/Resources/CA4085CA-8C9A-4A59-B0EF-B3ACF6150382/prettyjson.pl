#!/usr/bin/perl -w

use strict;
use warnings;
use FindBin;
use lib "$FindBin::RealBin/lib";
use JSON qw(from_json to_json);


print to_json(from_json(join('', <STDIN>), {allow_nonref=>1}), {pretty=>1})


