# src/bash/perl-wrapper/funcs/run-perl-tests.test.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doTestRunPerlTests comments ...
# ---------------------------------------------------------
doTestRunPerlTests(){

	doLog "DEBUG START doTestRunPerlTests"
	
	cat doc/txt/perl-wrapper/tests/perl/run-perl-tests.test.txt
	test -z "$sleep_interval" || sleep "$sleep_interval"
	# add your action implementation code here ... 
	
	bash src/bash/perl-wrapper/perl-wrapper.sh -a run-perl-tests
	
	doLog "DEBUG STOP  doTestRunPerlTests"
}
# eof func doTestRunPerlTests


# eof file: src/bash/perl-wrapper/funcs/run-perl-tests.test.sh
