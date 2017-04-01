#!/bin/bash 

#v1.0.6
#------------------------------------------------------------------------------
# creates the relative package as component of larger product platform
#------------------------------------------------------------------------------
doTestCreateRelative7zPackage(){
	doLog " INFO START : create-relative-7z-package.test"
	
	cat src/bash/perl-wrapper/tests/create-relative-7z-package.test.sh

	bash src/bash/perl-wrapper/perl-wrapper.sh -a create-relative-7z-package	
	doLog " INFO STOP  : create-relative-7z-package.test"
	
	
}
#eof test doCreaterelative7zPackage
