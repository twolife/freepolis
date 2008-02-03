all: res/sim

res/sim: src/sim/sim
	cp $< $@
	strip $@

src/sim/sim: tcl tk tclx sim ;

tcl:
	cd src/tcl && $(MAKE)

tk:
	cd src/tk && $(MAKE)

tclx:
	cd src/tclx && $(MAKE)

sim:
	cd src/sim && $(MAKE)

clean: 
	cd src/sim && $(MAKE) clean
	cd src/tcl && $(MAKE) clean
	cd src/tk && $(MAKE) clean
	cd src/tclx && $(MAKE) clean
	rm -f res/sim

.PHONY: clean tcl tk tclx sim
