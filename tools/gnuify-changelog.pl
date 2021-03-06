#!/usr/bin/perl
use strict;
use warnings;

# a script to munge the output of 'git log' into something approaching the 
# style of a GNU ChangeLog.
#
# to use this, just fill in the 'hackers' hash with the usernames and 
# name/emails of the people who work on your project, go to the top level 
# of your working copy, and run:
#
# $ git log --date-order --date=short | /path/to/gnuify-changelog.pl > ChangeLog

my %hackers = (
	     "tkng"     => 'TOKUNAGA Hiroyuki <tkng@xem.jp>',

	     "yusuke"   => 'Yusuke TABATA <yusuke@w5.dion.ne.jp>',
	     "tabata.yusuke" => 'Yusuke TABATA <yusuke@w5.dion.ne.jp>',

	     "yamaken"  => 'YAMAMOTO Kengo / YamaKen <yamaken@bp.iij4u.or.jp>',
	     "yamakenz" => 'YAMAMOTO Kengo / YamaKen <yamaken@bp.iij4u.or.jp>',

	     "omote"    => 'Masahito Omote <omote@utyuuzin.net>',
	     "omote.masahito" => 'Masahito Omote <omote@utyuuzin.net>',

	     "kzk"      => 'kzk <mover@hct.zaq.ne.jp>',
	     "kazuki.ohta" => 'kzk <mover@hct.zaq.ne.jp>',

	     "makeinu"  => 'Takuro Ashie <ashie@homa.ne.jp>',
	     "takuro.ashie" => 'Takuro Ashie <ashie@homa.ne.jp>',

	     "ekato"    => 'Etsushi Kato <ek.kato@gmail.com>',
	     "ek.kato"  => 'Etsushi Kato <ek.kato@gmail.com>',

	     "yamamoto" => 'Masanari Yamamoto <h013177b@ice.nuie.nagoya-u.ac.jp>',

	     "jun0"     => 'Jun Inoue <jun.lambda@gmail.com>',
	     "jun.lambda" => 'Jun Inoue <jun.lambda@gmail.com>',

	     "nosuke"   => 'Konosuke Watanabe <sasugaanija@gmail.com>',
	     "sasugaanija" => 'Konosuke Watanabe <sasugaanija@gmail.com>',

	     "jhpark"   => 'Jae-hyeon Park <jhyeon@gmail.com>',
	     "jhyeon"   => 'Jae-hyeon Park <jhyeon@gmail.com>',

	     "deton.kih" => 'KIHARA Hideto <deton@m1.interq.or.jp>',

	     "iratqq"   => 'IWATA Ray <iwata@quasiquote.org>',
	     "iratqq\@gmail.com"   => 'IWATA Ray <iwata@quasiquote.org>',

	     "koutou"   => 'Kouhei Sutou <kou@cozmixng.org>',

	     "nogu.dev"   => 'Muneyuki Noguchi <nogu.dev@gmail.com>',
	     "nogu.dev\@gmail.com"   => 'Muneyuki Noguchi <nogu.dev@gmail.com>',
);

my $author;
while (<>) {
  next if /(^commit|^Merge)/;

  # axe windows style line endings, since we should try to be consistent, and 
  # the repos has both styles in it's log entries.
  s/\r\n$/\n/;

  if (/^Author/) {
    chomp;
    $author = (split / /)[1];
    $author = exists($hackers{$author}) ? $hackers{$author} : (split /: /)[1];
    next;
  }

  if (/^Date/) {
    chomp;
    my $date = (split / +/)[1];
    print $date . ' ' . $author . "\n";
    next;
  }
  print;
}
