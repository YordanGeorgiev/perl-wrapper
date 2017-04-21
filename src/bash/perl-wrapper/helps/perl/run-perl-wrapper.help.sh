# src/bash/perl-wrapper/funcs/run-perl-wrapper.help.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doHelpRunPerlWrapper comments ...
# ---------------------------------------------------------
doHelpRunPerlWrapper(){

	doLog "DEBUG START doHelpRunPerlWrapper"
	
	cat doc/txt/perl-wrapper/helps/perl/run-perl-wrapper.help.txt
	test -z "$sleep_interval" || sleep "$sleep_interval"
	# add your action implementation code here ... 

	doLog "DEBUG STOP  doHelpRunPerlWrapper"
}
# eof func doHelpRunPerlWrapper


# eof file: src/bash/perl-wrapper/funcs/run-perl-wrapper.help.sh
