# src/bash/perl-wrapper/funcs/run-perl-wrapper.func.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doRunPerlWrapper comments ...
# ---------------------------------------------------------
doRunPerlWrapper(){

	doLog "DEBUG START doRunPerlWrapper"
	
	cat doc/txt/perl-wrapper/funcs/perl/run-perl-wrapper.func.txt
	test -z "$sleep_interval" || sleep "$sleep_interval"
	# add your action implementation code here ... 
   input_file='/tmp/input-file'
	
   # Action ... !!!
	perl src/perl/perl_wrapper/script/perl_wrapper.pl --input_file $input_file
   exit_code=$?
   doLog "INFO doRunPerlWrapper exit_code $exit_code"
   test $exit_code -ne 0 && doExit $exit_code "failed to run perl_wrapper.pl"  

	doLog "DEBUG STOP  doRunPerlWrapper"
}
# eof func doRunPerlWrapper


# eof file: src/bash/perl-wrapper/funcs/run-perl-wrapper.func.sh
