
$FreeBSD: /tmp/pcvs/ports/lang/rscheme/files/patch-..__handc__runtime__smemory.c,v 1.1 2006-04-20 21:32:20 anray Exp $

--- ../handc/runtime/smemory.c	Sat May 21 05:10:48 2005
+++ ../handc/runtime/smemory.c	Fri Feb 10 14:41:56 2006
@@ -481,7 +481,7 @@
       e = b->elements;
       for (i=0; i<n; i++, e++)
 	{
-          fprintf( stderr, "  [%u]  from {%08lx} SLOT(%u)  ; a %s\n",
+          fprintf( stderr, "  [%u]  from {%08lx} SLOT(%lu)  ; a %s\n",
                    j,
                    e->item,
                    e->offset / SLOT(1),
