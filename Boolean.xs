#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
 
MODULE = Sub::Boolean               PACKAGE = Sub::Boolean

void truthy (...)
CODE:
	XSRETURN_YES;

void falsey (...)
CODE:
	XSRETURN_NO;

void undef (...)
CODE:
	XSRETURN_UNDEF;

void empty (...)
CODE:
	XSRETURN_EMPTY;

void make_true (name)
	char *name
CODE:
	newXS(name, XS_Sub__Boolean_truthy, __FILE__);

void make_false (name)
	char *name
CODE:
	newXS(name, XS_Sub__Boolean_falsey, __FILE__);

void make_undef (name)
	char *name
CODE:
	newXS(name, XS_Sub__Boolean_undef, __FILE__);

void make_empty (name)
	char *name
CODE:
	newXS(name, XS_Sub__Boolean_empty, __FILE__);
