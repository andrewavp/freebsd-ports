# Created by: futatuki
# $FreeBSD$

PORTNAME?=	cdrdao
PORTVERSION=	1.2.3
PORTREVISION?=	4
CATEGORIES=	sysutils audio
MASTER_SITES=	SF
MASTER_SITE_SUBDIR=	cdrdao/cdrdao/${PORTVERSION}
DISTNAME=	cdrdao-${PORTVERSION}

MAINTAINER=	marius@FreeBSD.org
COMMENT?=	Record CD-R[W]s in disk-at-once mode

USE_BZIP2=	yes
USES=		gmake
GNU_CONFIGURE=	yes

MP3OGG_LIB_DEPENDS=	ao.4:${PORTSDIR}/audio/libao \
			mad.2:${PORTSDIR}/audio/libmad \
			vorbis.4:${PORTSDIR}/audio/libvorbis

.if ${PORTNAME} == "gcdmaster"
USES+=			pkgconfig
USE_GNOME=		gnomehier
GCONF_SCHEMAS=		gcdmaster.schemas
LIB_DEPENDS+=		${MP3OGG_LIB_DEPENDS} \
			gnomeuimm-2.6.1:${PORTSDIR}/x11-toolkits/libgnomeuimm26
RUN_DEPENDS+=		${LOCALBASE}/bin/cdrdao:${PORTSDIR}/sysutils/cdrdao \
			${LOCALBASE}/share/mime/packages/freedesktop.org.xml:${PORTSDIR}/misc/shared-mime-info
MAN1=			gcdmaster.1
CONFIGURE_ARGS+=	--with-lame=no
.else
MAN1=			cdrdao.1 cue2toc.1 toc2cddb.1 toc2cue.1
CONFIGURE_ARGS+=	--with-xdao=no
.if defined(WITH_TOC2MP3)
LIB_DEPENDS+=		mp3lame.0:${PORTSDIR}/audio/lame
CONFIGURE_ARGS+=	--with-lame-include=${LOCALBASE}/include \
			--with-lame-lib=${LOCALBASE}/lib
PLIST_SUB+=		TOC2MP3=""
.else
CONFIGURE_ARGS+=	--with-lame=no
PLIST_SUB+=		TOC2MP3="@comment "
.endif
.if !defined(WITHOUT_MP3OGG)
USES+=			pkgconfig
LIB_DEPENDS+=		${MP3OGG_LIB_DEPENDS}
CONFIGURE_ENV+=		AO_CFLAGS=-I${LOCALBASE}/include \
			AO_LIBS="-L${LOCALBASE}/lib -lao" \
			MAD_CFLAGS=-I${LOCALBASE}/include \
			MAD_LIBS="-L${LOCALBASE}/lib -lmad" \
			VORBISFILE_CFLAGS=-I${LOCALBASE}/include \
			VORBISFILE_LIBS="-L${LOCALBASE}/lib -lvorbisfile"
.else
CONFIGURE_ARGS+=	--with-mp3-support=no --with-ogg-support=no
.endif
.endif

CONFIGURE_ARGS+=	--without-pcctsbin --without-pcctsinc \
			--with-posix-threads=no --with-scglib
MAKE_ENV=		CCOM=cc LANG=C
SCSILIBTARGET=		${ARCH:S/powerpc64/powerpc/}-freebsd-cc

.include <bsd.port.pre.mk>

pre-everything::
.if ${PORTNAME} != "gcdmaster" && \
	(!defined(WITH_TOC2MP3) || !defined(WITHOUT_MP3OGG))
	@${ECHO_MSG} ""
	@${ECHO_MSG} "You may use the following build option(s):"
	@${ECHO_MSG} ""
.if !defined(WITH_TOC2MP3)
	@${ECHO_MSG} "WITH_TOC2MP3=yes	builds with toc2mp3 (requires audio/lame)"
.endif
.if !defined(WITHOUT_MP3OGG)
	@${ECHO_MSG} "WITHOUT_MP3OGG=yes	builds without support for decoding MP3 and Ogg Vorbis"
	@${ECHO_MSG} "			files (not required unless using sysutils/gcdmaster;"
	@${ECHO_MSG} "			disabling saves a couple of dependencies)"
.endif
	@${ECHO_MSG} ""
.endif

post-extract:
.if ${SCSILIBTARGET} != "i386-freebsd-cc"
	@${LN} -sf ${WRKSRC}/scsilib/RULES/i386-freebsd-cc.rul \
		${WRKSRC}/scsilib/RULES/${SCSILIBTARGET}.rul
.endif

post-patch:
.for i in 45libdeflt 45libedc 45libfile 45libhfs_iso 45libparanoia 45libunls \
	45librscg 55cdda2wav 55cdrecord 55cmd 55mkisofs 55mkisofs!@!diag \
	55readcd 55scgcheck 55scgskeleton 55rscsi 85man
	@${RM} ${WRKSRC}/scsilib/TARGETS/${i}
.endfor
.for i in include/schily.h libschily/fexec.c
	@${REINPLACE_CMD} -e 's|fexecve|js_fexecve|g' ${WRKSRC}/scsilib/${i}
.endfor
.if ${PORTNAME} == "gcdmaster"
	@${REINPLACE_CMD} -E -e 's|(^SUBDIRS.+) utils|\1|' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -E -e 's|(^gladedir.+=).+|\1 ${DATADIR}|' \
		${WRKSRC}/xdao/Makefile.in
	@${REINPLACE_CMD} -E -e \
		's|(SET_CDRDAO_PATH.+path=)(cdrdao)|\1${LOCALBASE}\/bin\/\2|g' \
		${WRKSRC}/xdao/Settings.cc
	@${REINPLACE_CMD} -E -e \
		's|(icon-filename=).+(gcdmaster-doc.png)|\1${LOCALBASE}\/share\/pixmaps\/document-icons\/\2|g' \
		${WRKSRC}/xdao/gcdmaster.keys
	@${REINPLACE_CMD} -e 's|connect(SigC::slot|connect(sigc::ptr_fun|g' \
		${WRKSRC}/xdao/xcdrdao.cc
.else
.for i in cdrdao.man main.cc
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g' ${WRKSRC}/dao/${i}
.endfor
	@${REINPLACE_CMD} -E -e 's|(^CDRDAO_DATA_DIR.+=).+|\1 ${DATADIR}|' \
		${WRKSRC}/dao/Makefile.in
.for i in toc2cddb.1 toc2cue.1
	@${REINPLACE_CMD} -e 's|1\.2\.2|${PORTVERSION}|g' ${WRKSRC}/utils/${i}
.endfor
.endif

do-install:
.if ${PORTNAME} == "gcdmaster"
	@${INSTALL_PROGRAM} ${WRKSRC}/xdao/gcdmaster ${PREFIX}/bin
	@${INSTALL_MAN} ${WRKSRC}/xdao/gcdmaster.man \
		${PREFIX}/man/man1/gcdmaster.1
	@${INSTALL_DATA} ${WRKSRC}/xdao/gcdmaster-doc.png \
		${LOCALBASE}/share/pixmaps/document-icons
	@${INSTALL_DATA} ${WRKSRC}/xdao/gcdmaster.applications \
		${LOCALBASE}/share/application-registry
	@${INSTALL_DATA} ${WRKSRC}/xdao/gcdmaster.desktop \
		${LOCALBASE}/share/applications
	@${INSTALL_DATA} ${WRKSRC}/xdao/gcdmaster.keys \
		${LOCALBASE}/share/mime-info
	@${INSTALL_DATA} ${WRKSRC}/xdao/gcdmaster.mime \
		${LOCALBASE}/share/mime-info
	@${INSTALL_DATA} ${WRKSRC}/xdao/gcdmaster.png \
		${LOCALBASE}/share/pixmaps
	@${INSTALL_DATA} ${WRKSRC}/xdao/gcdmaster.schemas \
		${LOCALBASE}/etc/gconf/schemas
	@${INSTALL_DATA} ${WRKSRC}/xdao/gcdmaster.xml \
		${LOCALBASE}/share/mime/packages
	@${MKDIR} ${DATADIR}
	@${INSTALL_DATA} ${WRKSRC}/xdao/glade/Preferences.glade ${DATADIR}
	@${INSTALL_DATA} ${WRKSRC}/xdao/glade/ProjectChooser.glade ${DATADIR}
.else
	@${INSTALL_PROGRAM} ${WRKSRC}/dao/cdrdao ${PREFIX}/bin
	@${INSTALL_MAN} ${WRKSRC}/dao/cdrdao.man ${PREFIX}/man/man1/cdrdao.1
	@${INSTALL_PROGRAM} ${WRKSRC}/utils/cue2toc ${PREFIX}/bin
	@${INSTALL_MAN} ${WRKSRC}/utils/cue2toc.1 ${PREFIX}/man/man1
	@${INSTALL_PROGRAM} ${WRKSRC}/utils/toc2cddb ${PREFIX}/bin
	@${INSTALL_MAN} ${WRKSRC}/utils/toc2cddb.1 ${PREFIX}/man/man1
	@${INSTALL_PROGRAM} ${WRKSRC}/utils/toc2cue ${PREFIX}/bin
	@${INSTALL_MAN} ${WRKSRC}/utils/toc2cue.1 ${PREFIX}/man/man1
	@${MKDIR} ${DATADIR}
	@${INSTALL_DATA} ${WRKSRC}/dao/cdrdao.drivers ${DATADIR}/drivers
.if defined(WITH_TOC2MP3)
	@${INSTALL_PROGRAM} ${WRKSRC}/utils/toc2mp3 ${PREFIX}/bin
.endif
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for i in CREDITS ChangeLog README README.PlexDAE
	@${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif
.endif

.include <bsd.port.post.mk>
