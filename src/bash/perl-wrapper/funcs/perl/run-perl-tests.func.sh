# src/bash/perl-wrapper/funcs/run-perl-tests.func.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doRunPerlTests comments ...
# ---------------------------------------------------------
doRunPerlTests(){
	
	doLog "DEBUG START : doRunPerlTests"

	doLog "INFO Component testing Initiator.pm with TestInitiator "
	perl src/perl/perl_wrapper/t/TestInitiator.pm
	test -z "$sleep_iterval" || sleep $sleep_iterval
	
	doLog "INFO Component testing Logger.pm with TestLogger "
	perl src/perl/perl_wrapper/t/TestLogger.pl
	test -z "$sleep_iterval" || sleep $sleep_iterval
	
	doLog "INFO Component testing Logger.pm with TestLogger "
	perl src/perl/perl_wrapper/t/TestFileIOController.pl
	test -z "$sleep_iterval" || sleep $sleep_iterval
	doLog "INFO STOP  : doRunPerlTests"
}
# eof func doRunPerlTests


# eof file: src/bash/perl-wrapper/funcs/run-perl-tests.func.sh
