/#include "tclint.h"/a\
\#include "tclxint.h"

/	    sprintf(interp->result, "%g", value.doubleValue);/c\
	    Tcl_ReturnDouble (interp, value.doubleValue);
