# src/bash/perl-wrapper/funcs/run-perl-wrapper.test.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doTestRunPerlWrapper comments ...
# ---------------------------------------------------------
doTestRunPerlWrapper(){

	doLog "DEBUG START doTestRunPerlWrapper"
	
	cat doc/txt/perl-wrapper/tests/perl/run-perl-wrapper.test.txt
	test -z "$sleep_interval" || sleep "$sleep_interval"

	# Action !!!	
	bash src/bash/perl-wrapper/perl-wrapper.sh -a run-perl-wrapper
   exit_code=$?
	doLog " run-perl-wrapper.test-1 exit_code: $exit_code "

   test -z "$sleep_interval" || sleep "$sleep_interval"
   test $exit_code -ne 0 && return

	doLog "DEBUG STOP  doTestRunPerlWrapper"

}
# eof func doTestRunPerlWrapper


# eof file: src/bash/perl-wrapper/funcs/run-perl-wrapper.test.sh
