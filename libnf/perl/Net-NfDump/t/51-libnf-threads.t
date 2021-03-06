
use Test::More;

plan tests => 15;

#open(STDOUT, ">&STDERR");


system("mkdir t/testdir 2>/dev/null");

for (my $i = 0; $i < 1000; $i++) {
	system("libnf/examples/lnf_ex01_writer -f t/testdir/$i -r 10 -n 300");
}

# get result wiyh single thread 
system("./libnf/bin/nfdumpp -R t/testdir -T 1 -A srcip -O bytes > t/threads-reference.txt 2>t/err");


for (my $i = 1; $i < 16; $i++) {

	system("./libnf/bin/nfdumpp -R t/testdir -T $i -A srcip -O bytes > t/threads-res-$i.txt 2>t/err");

	system("diff t/threads-reference.txt t/threads-res-$i.txt");

	if ($? != 0) {
		diag("\nInvalid result for $i threads\n");
	}

    ok( $? == 0 );
}


