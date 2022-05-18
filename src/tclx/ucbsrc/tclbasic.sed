/#include "tclint.h"/a\
\#include "tclxtend.h"

/(\*cmdPtr->proc)/a\
\        /*\
\         * Signal handling added for Extended Tcl.\
\         */\
\        result = Tcl_CheckForSignal (interp, result);
