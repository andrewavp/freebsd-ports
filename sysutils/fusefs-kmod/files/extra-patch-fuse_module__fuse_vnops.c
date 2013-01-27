--- fuse_module/fuse_vfsops.c.orig	2008-02-05 07:25:57.000000000 +0200
+++ fuse_module/fuse_vfsops.c	2011-09-08 10:27:43.000000000 +0300
@@ -224,7 +231,7 @@
 	struct cdev *fdev;
 	struct sx *slock;
 	struct fuse_data *data;
-	int mntopts = 0, __mntopts = 0, max_read_set = 0, secondary = 0;
+	uint64_t mntopts = 0, __mntopts = 0, max_read_set = 0, secondary = 0;
 	unsigned max_read = ~0;
 	struct vnode *rvp;
 	struct fuse_vnode_data *fvdat;
