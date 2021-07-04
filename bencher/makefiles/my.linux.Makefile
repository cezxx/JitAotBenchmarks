# The Computer Language Benchmarks Game
# $Id: my.linux.Makefile,v 1.2 2016/11/29 22:09:41 igouy-guest Exp $

# ASSUME each program will build in a clean empty tmpdir
# ASSUME there's a symlink to the program source in tmpdir
# ASSUME there's a symlink to the Include directory in tmpdir
# ASSUME there are symlinks to helper files in tmpdir
# ASSUME no responsibility for removing temporary files from tmpdir

# TYPICAL actions include an initial mv to give the expected extension 

# ASSUME environment variables for compilers and interpreters are set in the header


COPTS := -O3 -fomit-frame-pointer



############################################################
# ACTIONS for specific language implementations
############################################################

########################################
# graalvm
########################################

%.graalvm_native_run: %.graalvm_native
	-ls
	-mv $< $(TEST).java
	-$(GRAALVM_JDKC) -d . $(TEST).java
	-$(GRAALVM_NATIVE) $(TEST)

########################################
# java
########################################

%.java_run: %.java
	-ls
	-mv $< $(TEST).java
	-$(JDKC) -d . $(TEST).java


%.javaxint_run: %.javaxint
	-mv $< $(TEST).java
	-$(JDKC) -d . $(TEST).java


########################################
# gcc
########################################

%.c: %.gcc 
	-@mv $< $@

%.gcc_run: %.c 
	-$(GCC) -pipe -Wall $(COPTS) $(GCCOPTS) $< -o $@


########################################
# gpp
########################################

%.c++: %.gpp 
	-@mv $< $@

%.gpp_run: %.c++
	-$(GXX) -c -pipe $(COPTS) $(GXXOPTS) $< -o $<.o &&  \
        $(GXX) $<.o -o $@ $(GXXLDOPTS) 


