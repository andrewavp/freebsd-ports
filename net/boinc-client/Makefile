# Created by: J.R. Oldroyd <fbsd@opal.com>
# $FreeBSD$

PORTNAME=	boinc-client
PORTVERSION=	7.0.28
PORTREVISION=	3
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	pav

MAINTAINER=	rene@FreeBSD.org
COMMENT=	Berkeley Open Infrastructure for Network Computing client

USE_XZ=		yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_DOS2UNIX=	yes
DOS2UNIX_REGEX=	.*\.(cpp|h)

USERS=		boinc
GROUPS=		boinc

BOINC_CLIENT_USER?=	boinc
BOINC_CLIENT_GROUP?=	boinc
BOINC_CLIENT_HOME?=	/var/db/boinc

PLIST_SUB=	BOINC_CLIENT_HOME="${BOINC_CLIENT_HOME}" \
		BOINC_CLIENT_USER="${BOINC_CLIENT_USER}"

SUB_FILES=	pkg-install
SUB_LIST=	BOINC_CLIENT_HOME="${BOINC_CLIENT_HOME}" \
		BOINC_CLIENT_USER="${BOINC_CLIENT_USER}" \
		BOINC_CLIENT_GROUP="${BOINC_CLIENT_GROUP}" \
		PREFIX="${PREFIX}" LOCALBASE="${LOCALBASE}"

CONFIGURE_ARGS=	--disable-server
CPPFLAGS+=	-I${LOCALBASE}/include

NO_OPTIONS_SORT=	yes
OPTIONS_DEFINE=		CLIENT MANAGER X11 LINUX USER SKINS OPTIMIZE
OPTIONS_DEFAULT=	CLIENT MANAGER X11 USER
OPTIONS_GROUP=		SCRIPT
OPTIONS_GROUP_SCRIPT=	NO_GUI_RPC NO_NET_INFO
CLIENT_DESC=		Build BOINC client
MANAGER_DESC=		Build BOINC manager GUI
X11_DESC=		Build graphics API
LINUX_DESC=		Accept Linux science applications
USER_DESC=		Create/check BOINC client user and directory
SKINS_DESC=		Install more skins for BOINC manager
OPTIMIZE_DESC=		Enable compiler optimization flags
SCRIPT_DESC=		Command line options in script
NO_GUI_RPC_DESC=	Do not allow GUI RPC, do not make socket (breaks boinc_curses)
NO_NET_INFO_DESC=	Do not send host address and name to servers

.include <bsd.port.options.mk>

.if ${ARCH} == "ia64" || ${ARCH} == "powerpc" || ${ARCH} == "sparc64"
BROKEN=		Does not install on ia64, powerpc, or sparc64
.endif

.if ${PORT_OPTIONS:MMANAGER}
PORT_OPTIONS+=	CLIENT X11
USE_XORG+=	x11
USE_WX=		2.8+
USES+=		iconv
WX_CONF_ARGS=	absolute
LIB_DEPENDS+=	libnotify.so:${PORTSDIR}/devel/libnotify \
		libsqlite3.so:${PORTSDIR}/databases/sqlite3
CONFIGURE_ARGS+=--with-sqlite3-prefix=${LOCALBASE}
. if ${OSVERSION} < 900506 || (${OSVERSION} >= 1000000 && ${OSVERSION} < 1000002)
CPPFLAGS+=	-DNO_PER_THREAD_LOCALE
. endif
PLIST_SUB+=	BOINC_MANAGER=""
SUB_LIST+=	OPTION_MANAGER="true"
.else
CONFIGURE_ARGS+=--disable-manager --with-wx-config=false --without-x
PLIST_SUB+=	BOINC_MANAGER="@comment "
SUB_LIST+=	OPTION_MANAGER=""
.endif

.if ${PORT_OPTIONS:MCLIENT}
USE_RC_SUBR=	boinc-client
LIB_DEPENDS+=	libcurl.so:${PORTSDIR}/ftp/curl
RUN_DEPENDS+=	${LOCALBASE}/share/certs/ca-root-nss.crt:${PORTSDIR}/security/ca_root_nss
PLIST_SUB+=	BOINC_CLIENT=""
SUB_LIST+=	OPTION_NO_GUI_RPC=${PORT_OPTIONS:MNO_GUI_RPC:S/^NO_GUI_RPC$/--no_gui_rpc/} \
		OPTION_NO_NET_INFO=${PORT_OPTIONS:MNO_NET_INFO:S/^NO_NET_INFO$/--suppress_net_info/}
.else
PORT_OPTIONS:=	${PORT_OPTIONS:NUSER}
CONFIGURE_ARGS+=--disable-client
PLIST_SUB+=	BOINC_CLIENT="@comment "
.endif

.if ${PORT_OPTIONS:MNLS} && ${PORT_OPTIONS:MMANAGER}
PLIST_SUB+=	NLS=""
.else
PLIST_SUB+=	NLS="@comment "
.endif

.if ${PORT_OPTIONS:MLINUX}
CONFIGURE_ARGS+=--with-boinc-alt-platform=i686-pc-linux-gnu
USE_LINUX=	yes
.endif

.if ${PORT_OPTIONS:MSKINS}
PLIST_SUB+=	SKINS=""
.else
PLIST_SUB+=	SKINS="@comment "
.endif

.if ${PORT_OPTIONS:MUSER}
PLIST_SUB+=	USER=""
SUB_LIST+=	OPTION_USER="true"
.else
PLIST_SUB+=	USER="@comment "
SUB_LIST+=	OPTION_USER=""
.endif

.if ${PORT_OPTIONS:MOPTIMIZE}
CONFIGURE_ARGS+=--enable-optimize
.endif

.if ${PORT_OPTIONS:MX11}
USE_GL=		glut
USE_XORG+=	xmu xi
LIB_DEPENDS+=	libjpeg.so:${PORTSDIR}/graphics/jpeg
PLIST_SUB+=	X11=""
.else
PLIST_SUB+=	X11="@comment "
.endif

PORT_OPTIONS:=	${PORT_OPTIONS:O:u}

post-patch:
	@${REINPLACE_CMD} -e 's|client/scripts||' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|-lcrypto -ldl|-lcrypto|' ${WRKSRC}/configure
.if ${PORT_OPTIONS:MNLS}
	@${REINPLACE_CMD} -e 's|$$$$mydir/$$$$ldir|&/LC_MESSAGES|' ${WRKSRC}/locale/Makefile.in
.else
	@${REINPLACE_CMD} -e 's| locale||' ${WRKSRC}/Makefile.in
.endif
.if ! ${PORT_OPTIONS:MX11}
	@${REINPLACE_CMD} -e 's|@BUILD_GRAPHICS_API_TRUE@|#&|' ${WRKSRC}/api/Makefile.in
.endif

post-install:
	@PKG_PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL
.if ${PORT_OPTIONS:MMANAGER} || ${PORT_OPTIONS:MX11}
	${MKDIR} ${PREFIX}/share/boinc
.endif
.if ${PORT_OPTIONS:MMANAGER}
	${MKDIR} ${PREFIX}/share/pixmaps
. for name in 16 32 48
	${INSTALL_DATA} ${WRKSRC}/clientgui/res/boincmgr.${name}x${name}.png \
	    ${PREFIX}/share/pixmaps
. endfor
. if ${PORT_OPTIONS:MSKINS}
	${CP} -R ${WRKSRC}/clientgui/skins ${PREFIX}/share/boinc
. else
	${MKDIR} ${PREFIX}/share/boinc/skins
	${CP} -R ${WRKSRC}/clientgui/skins/Default ${PREFIX}/share/boinc/skins
. endif
.endif
. for name in config.h api/reduce.h lib/shmem.h lib/std_fixes.h
	${INSTALL_DATA} ${WRKSRC}/${name} ${PREFIX}/include/boinc
. endfor
.if ${PORT_OPTIONS:MX11}
. for name in api/boinc_gl.h api/graphics_api.h api/graphics_data.h \
	api/txf_util.h
	${INSTALL_DATA} ${WRKSRC}/${name} ${PREFIX}/include/boinc
. endfor
	${CP} -R ${WRKSRC}/api/txf ${PREFIX}/share/boinc
.endif

.include <bsd.port.mk>
