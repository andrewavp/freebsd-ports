--- build.scm.orig	2009-08-04 03:35:57.000000000 +0900
+++ build.scm	2009-08-07 01:59:30.000000000 +0900
@@ -667,12 +667,13 @@
 
      (c freebsd "" "-export-dynamic" #f () ())
      (m freebsd "" "-lm" #f () ())
-     (curses freebsd "" "-lncurses" "/usr/lib/libncurses.a" () ())
+     (curses freebsd "" "-lcurses" "/usr/lib/libcurses.a" () ())
      (regex freebsd "-I/usr/include/gnu" "-lgnuregex" "" () ())
-     (editline freebsd "" "-lreadline" "" () ())
+     (editline freebsd "-I%%READLINE_DIR%%/include" "-lreadline" "-L%%READLINE_DIR%%/lib" () ())
+     (graphics freebsd "-I%%LOCALBASE%%/include -DX11" "-lX11" "-L%%LOCALBASE%%/lib" () ())
      (dlll freebsd "-DSUN_DL" "-export-dynamic" "" () ())
-     (nostart freebsd "" "-e start -dc -dp -Bstatic -lgnumalloc" #f ("pre-crt0.c") ())
-     (dump freebsd "" "/usr/lib/crt0.o" "" ("unexsunos4.c") ())
+     (nostart freebsd "" "" #f () ())
+     (dump freebsd "" "" #f ("unexeclf.c" "gmalloc.c") ())
      (curses netbsd "-I/usr/pkg/include" "-lncurses" "-Wl,-rpath -Wl,/usr/pkg/lib -L/usr/pkg/lib" () ())
      (editline netbsd "-I/usr/pkg/include" "-lreadline" "-Wl,-rpath -Wl,/usr/pkg/lib -L/usr/pkg/lib" () ())
      (graphics netbsd "-I/usr/X11R6/include -DX11" "-lX11" "-Wl,-rpath -Wl,/usr/X11R6/lib -L/usr/X11R6/lib" () ())
@@ -1630,7 +1631,7 @@
 	  parms
 ;;; gcc 3.4.2 for FreeBSD does not allow options other than default i.e. -O0 if NO -DGCC_SPARC_BUG - dai 2004-10-30
 	  ;;"cc" "-O3 -pipe -DGCC_SPARC_BUG " "-c"
-	  "cc" "-O3 -pipe " "-c"
+	  "%%CC%%" "%%CFLAGS%%" "-c"
 	  (include-spec "-I" parms)
 	  (c-includes parms)
 	  (c-flags parms)
@@ -1641,7 +1642,7 @@
     (batch:rename-file parms
 		       oname (string-append oname "~"))
     (and (batch:try-command parms
-			    "cc" "-o" oname
+			    "%%CC%%" "-o" oname
 			    (must-be-first
 			     '("-nostartfiles"
 			       "pre-crt0.o" "crt0.o"
@@ -1651,17 +1652,18 @@
 (defcommand compile-dll-c-files freebsd
   (lambda (files parms)
     (and (batch:try-chopped-command
-	  parms "cc" "-O3 -pipe " "-fPIC" "-c"
+	  parms "%%CC%%" "%%CFLAGS%%" "-fPIC" "-c"
 	  (include-spec "-I" parms)
 	  (c-includes parms)
 	  (c-flags parms)
 	  files)
 	 (let ((fnames (truncate-up-to (map c-> files) #\/)))
 	   (and (batch:try-command
-		 parms "cc" "-shared"
+		 parms "%%CC%%" "-shared"
 		 (cond
-		  ((equal? (car fnames) "edline") "-lreadline")
-		  ((equal? (car fnames) "x") "-L/usr/X11R6/lib -lSM -lICE -lXext -lX11 -lxpg4")
+		  ((equal? (car fnames) "edline") "-L%%READLINE_DIR%%/lib -lreadline")
+		  ((equal? (car fnames) "rgx") "-lgnuregex")
+		  ((equal? (car fnames) "x") "-L%%LOCALBASE%%/lib -lSM -lICE -lXext -lX11")
 		  (else ""))
 		 "-o" (string-append (car fnames) ".so")
 		 (map (lambda (fname) (string-append fname ".o")) fnames))
@@ -1674,7 +1676,7 @@
   (lambda (oname objects libs parms)
     (and (batch:try-command
 	  parms
-	  "cc" "-shared" "-o"
+	  "%%CC%%" "-shared" "-o"
 	  (string-append
 	   (car (parameter-list-ref parms 'implvic))
 	   oname ".so")
