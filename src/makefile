# Makefile for Freepolis
# 
# Freepolis, Unix Version.  This game was released for the Unix platform
# in or about 1990 and has been modified for inclusion in the One Laptop
# Per Child program.  Copyright (C) 1989 - 2007 Electronic Arts Inc.
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.
# 
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.  You should have received a
# copy of the GNU General Public License along with this program.  If
# not, see <http://www.gnu.org/licenses/>.
# 
#             ADDITIONAL TERMS per GNU GPL Section 7
# 
# No trademark or publicity rights are granted.  This license does NOT
# give you any right, title or interest in the trademark SimCity or any
# other Electronic Arts trademark.  You may not distribute any
# modification of this program using the trademark SimCity or claim any
# affliation or association with Electronic Arts Inc. or its employees.
# 
# Any propagation or conveyance of this program must include this
# copyright notice and these terms.
# 
# If you convey this program (or any modifications of it) and assume
# contractual liability for the program to recipients of it, you agree
# to indemnify Electronic Arts for any liability that those contractual
# assumptions impose on Electronic Arts.
# 
# You may not misrepresent the origins of this program; modified
# versions of the program must be marked as such and not identified as
# the original program.
# 
# This disclaimer supplements the one included in the General Public
# License.  TO THE FULLEST EXTENT PERMISSIBLE UNDER APPLICABLE LAW, THIS
# PROGRAM IS PROVIDED TO YOU "AS IS," WITH ALL FAULTS, WITHOUT WARRANTY
# OF ANY KIND, AND YOUR USE IS AT YOUR SOLE RISK.  THE ENTIRE RISK OF
# SATISFACTORY QUALITY AND PERFORMANCE RESIDES WITH YOU.  ELECTRONIC ARTS
# DISCLAIMS ANY AND ALL EXPRESS, IMPLIED OR STATUTORY WARRANTIES,
# INCLUDING IMPLIED WARRANTIES OF MERCHANTABILITY, SATISFACTORY QUALITY,
# FITNESS FOR A PARTICULAR PURPOSE, NONINFRINGEMENT OF THIRD PARTY
# RIGHTS, AND WARRANTIES (IF ANY) ARISING FROM A COURSE OF DEALING,
# USAGE, OR TRADE PRACTICE.  ELECTRONIC ARTS DOES NOT WARRANT AGAINST
# INTERFERENCE WITH YOUR ENJOYMENT OF THE PROGRAM; THAT THE PROGRAM WILL
# MEET YOUR REQUIREMENTS; THAT OPERATION OF THE PROGRAM WILL BE
# UNINTERRUPTED OR ERROR-FREE, OR THAT THE PROGRAM WILL BE COMPATIBLE
# WITH THIRD PARTY SOFTWARE OR THAT ANY ERRORS IN THE PROGRAM WILL BE
# CORRECTED.  NO ORAL OR WRITTEN ADVICE PROVIDED BY ELECTRONIC ARTS OR
# ANY AUTHORIZED REPRESENTATIVE SHALL CREATE A WARRANTY.  SOME
# JURISDICTIONS DO NOT ALLOW THE EXCLUSION OF OR LIMITATIONS ON IMPLIED
# WARRANTIES OR THE LIMITATIONS ON THE APPLICABLE STATUTORY RIGHTS OF A
# CONSUMER, SO SOME OR ALL OF THE ABOVE EXCLUSIONS AND LIMITATIONS MAY
# NOT APPLY TO YOU.

RES = ../res

TARFILES = \
	freepolis-activity/Freepolis \
	freepolis-activity/README \
	freepolis-activity/COPYING \
	freepolis-activity/cities \
	freepolis-activity/images \
	freepolis-activity/res \
	freepolis-activity/manual \
	freepolis-activity/activity \
	freepolis-activity/__init__.py \
	freepolis-activity/freepolisactivity.py \
	freepolis-activity/Freepolis.png

all:
	cd tcl ; $(MAKE) all
	cd tk ; $(MAKE) all
	cd tclx ; $(MAKE) all
	cd sim ; $(MAKE) all

clean:
	rm -f Freepolis.tgz
	(cd $(RES) ; touch junk~ ; rm -f sim *~)
	(cd .. ; touch junk~ ; rm -f *~)
	touch junk~ ; rm -f *~
	rm -rf BUILDIT
	cd tcl ; $(MAKE) clean
	cd tk ; $(MAKE) clean
	cd tclx ; $(MAKE) clean
	cd sim ; $(MAKE) clean

install: all
	(cd $(RES) ; rm -f sim)
	cp sim/sim $(RES)/sim ; strip $(RES)/sim

tar:
	touch $(RES)/junk~ ../images/junk~
	rm -f ../../freepolis-activity.tgz $(RES)/*~ ../images/*~
	(cd ../.. ; tar cfvz freepolis-activity.tgz $(TARFILES)) 

xo:  install
	touch $(RES)/junk~ ../images/junk~
	rm -f ../../freepolis.xo $(RES)/*~ ../images/*~
	rm -rf BUILDIT
	mkdir BUILDIT
	tar cf - -C ../.. $(TARFILES) | (cd BUILDIT; tar xf -)
	mv BUILDIT/freepolis-activity BUILDIT/freepolis.activity
	(cd BUILDIT; zip -r ../../../freepolis.xo freepolis.activity)
	rm -rf BUILDIT

#
# To cut a release:
# Edit activity/activity.info and increment the version number.
# In what follows, replace "3" with the latest version number
#   vi activity/activity.info
#   git commit activity/activity.info
# Now make the source tar file:
#   git-archive --format=tar --prefix=freepolis-activity-3/ HEAD >../freepolis-activity-3-src.tar
#   gzip -9 ../freepolis-activity-3-src.tar
#   chmod a-w ../freepolis-activity-3-src.tar.gz
# Now make the binary:
#   (cd src; make xo)
#   mv ../freepolis.xo ../freepolis-3.xo
#   chmod a-w ../freepolis-3.xo 
# You're done.  Publish them.
#
