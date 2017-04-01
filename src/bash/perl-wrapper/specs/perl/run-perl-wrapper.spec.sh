# src/bash/perl-wrapper/funcs/run-perl-wrapper.spec.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doSpecRunPerlWrapper comments ...
# ---------------------------------------------------------
doSpecRunPerlWrapper(){

	doLog "DEBUG START doSpecRunPerlWrapper"
	
	cat doc/txt/perl-wrapper/specs/perl/run-perl-wrapper.spec.txt
	test -z "$sleep_interval" || sleep "$sleep_interval"
	# add your action implementation code here ... 

	doLog "DEBUG STOP  doSpecRunPerlWrapper"
}
# eof func doSpecRunPerlWrapper


# eof file: src/bash/perl-wrapper/funcs/run-perl-wrapper.spec.sh
