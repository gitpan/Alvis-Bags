# -*- perl -*-

#  do query processing test

use Test::More tests => 4;

if ( system("which mpca") ) {
	print STDERR "No executable mpca\n";
	exit(1);
}

if ( system("which mpdata") ) {
	print STDERR "No executable mpdata\n";
	exit(1);
}

system("mkdir -p t/dat");

if ( system("blib/script/linkRedir --gzip t/dat.links.gz t/dat/d > t/dat/d.relinks")  ) {
	ok(0);
	exit(1);
}
ok( 1 , " linkRedir ran");

if ( system("blib/script/linkTables --titletext --linktext t/dat/d.relinks t/dat/d") ) {
	ok(0);
	exit(1);
}
ok( 1 , " linkTables ran");

if ( system("blib/script/linkBags --titletext --linktext t/dat/d.relinks t/dat/d") ) {
	ok(0);
	exit(1);
}
ok( 1 , " linkBags ran");

if (  system("blib/script/linkMpca 2 t/dat/d") ) {
	ok(0);
	exit(1);
}
ok( 1 , " linkMpca ran");


system("rm -rf t/dat");
