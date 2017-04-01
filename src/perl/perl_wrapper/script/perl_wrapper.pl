#!/usr/bin/env perl

use strict;
use warnings;

   $|++;

use Data::Printer ; 

require Exporter ;
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ( 'all' => [ qw() ] );
our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );
our @EXPORT = qw() ;
our $AUTOLOAD =();

use utf8 ;
use Carp ;
use Cwd qw ( abs_path ) ;
use Getopt::Long;


BEGIN {
	use Cwd qw (abs_path) ;
	my $my_inc_path = Cwd::abs_path( $0 );

	$my_inc_path =~ m/^(.*)(\\|\/)(.*?)(\\|\/)(.*)/;
	$my_inc_path = $1;
	
	# debug ok print "\$my_inc_path $my_inc_path \n" ; 

	unless (grep {$_ eq "$my_inc_path"} @INC) {
		push ( @INC , "$my_inc_path" );
		$ENV{'PERL5LIB'} .= "$my_inc_path" ;
	}

	unless (grep {$_ eq "$my_inc_path/lib" } @INC) {
		push ( @INC , "$my_inc_path/lib" );
		$ENV{'PERL5LIB'} .= ":$my_inc_path/lib" ;
	}
}

# use own modules ...
use PerlWrapper::App::Utils::Initiator ; 
use PerlWrapper::App::Utils::Configurator ; 
use PerlWrapper::App::Utils::Logger ; 
use PerlWrapper::App::Utils::ETL::PerlWrapper ; 
use PerlWrapper::App::Utils::IO::FileHandler ; 
use PerlWrapper::App::Utils::ETL::PerlWrapper ; 
use PerlWrapper::App::Model::DbHandlerFactory ; 
use PerlWrapper::App::Model::MariaDbHandler ; 

my $module_trace                 = 0 ; 
my $md_file 							= '' ; 
my $rdbms_type 						= 'mariadb' ; #todo: parametrize to 
my $input_file                   = '' ; 
my $objInitiator                 = {} ; 
my $appConfig                    = {} ; 
my $objLogger                    = {} ; 
my $objFileHandler               = {} ; 
my $msg                          = q{} ; 
my $objConfigurator              = {} ; 



#
# the main entry point of the application
#
sub main {

	print " perl_wrapper.pl START MAIN \n " ; 
   doInitialize();	

   GetOptions(	
      'input_file=s' => \$input_file
   );
   $objLogger->doLogInfoMsg ( "input_file: $input_file" ) ; 

	my $objPerlWrapper 	   = 'PerlWrapper::App::Utils::ETL::PerlWrapper'->new ( \$appConfig ) ; 
	my ( $ret , $msg , $str_input_file ) 
                     	   = $objPerlWrapper->doReadIssueFile ( $input_file ) ; 
   doExit ( $ret , $msg ) if $ret != 0 ;  

	# my $objDbHandlerFactory = 'PerlWrapper::App::Model::DbHandlerFactory'->new( \$appConfig );
	# my $objDbHandler 			= $objDbHandlerFactory->doInstantiate ( "$rdbms_type" );

	$objLogger->doLogInfoMsg ( "$msg") ; 
	$objLogger->doLogInfoMsg ( "STOP  MAIN") ; 

   exit ( $ret );
}
#eof sub main


sub doInitialize {

	$objInitiator 		= 'PerlWrapper::App::Utils::Initiator'->new();
	$appConfig 			= $objInitiator->get('AppConfig') ; 
	p ( $appConfig  ) if $module_trace == 1 ; 
	$objConfigurator 	= 
		'PerlWrapper::App::Utils::Configurator'->new( $objInitiator->{'ConfFile'} , \$appConfig ) ; 
	$objLogger 			= 'PerlWrapper::App::Utils::Logger'->new( \$appConfig ) ;

		
	$objLogger->doLogInfoMsg ( "START MAIN") ; 
	$objLogger->doLogInfoMsg ( "START LOGGING SETTINGS ") ; 
	p ( $appConfig  ) ; 
	$objLogger->doLogInfoMsg ( "STOP  LOGGING SETTINGS ") ; 

}


sub doExit {
   my $exit_code = shift ; 
   my $exit_msg  = shift ; 


   if ( $exit_code == 0 ) {
      $objLogger->doLogInfoMsg ( $msg ) ;       
   } else {

      $objLogger->doLogErrorMsg ( $msg ) ;       
      $objLogger->doLogFatalMsg ( $msg ) ;       
   }

   exit ( $exit_code ) ; 
}

# Action !!!
main () ; 

