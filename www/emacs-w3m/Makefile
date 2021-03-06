# Created by: MANTANI Nobutaka <nobutaka@nobutaka.com>
# $FreeBSD$

PORTNAME=	emacs-w3m
PORTVERSION=	1.4.471.b.${SNAPDATE}
PORTREVISION=	5
CATEGORIES=	www elisp
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	nobutaka
PKGNAMESUFFIX=	-${EMACS_PORT_NAME}
DISTNAME=	${PORTNAME}-1.4.471-${SNAPDATE}

MAINTAINER=	nobutaka@FreeBSD.org
COMMENT?=	Simple front-end to w3m for emacs

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/COPYING

USE_BZIP2=	yes
USE_EMACS=	yes

SNAPDATE=	20120306

CONFIGURE_ARGS?=	--with-emacs=${EMACS_CMD} \
			--with-lispdir=${PREFIX}/${LISPDIR} \
			--with-icondir=${PREFIX}/${ICONDIR}
LISPDIR?=	${EMACS_VERSION_SITE_LISPDIR}/w3m
ICONDIR?=	${EMACS_LIBDIR_WITH_VER}/etc/w3m/icons
ETCDIR?=	${EMACS_LIBDIR_WITH_VER}/etc/w3m

INFO=		emacs-w3m-ja emacs-w3m

USE_AUTOTOOLS=	autoconf213
ALL_TARGET=	default

PLIST_SUB+=	LISPDIR=${LISPDIR} \
		ICONDIR=${ICONDIR} \
		ETCDIR=${ETCDIR} \
		SHIMBUN=${SHIMBUN}

DOCS=		README
DOCS_JA=	README.ja

DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}
DOCSDIR_JA=	${PREFIX}/share/doc/ja/${PORTNAME}

OPTIONS_DEFINE=	DOCS OCTET_VIEWER SHIMBUN
OPTIONS_DEFAULT=	DOCS OCTET_VIEWER SHIMBUN

OCTET_VIEWER_DESC=	Octet stream viewer support
SHIMBUN_DESC=	Build and/or install Shimbun

.include <bsd.port.options.mk>

.if !${PORT_OPTIONS:MSHIMBUN}
EXTRA_PATCHES+=	${PATCHDIR}/extra-patch-Makefile.in
SHIMBUN=	"@comment "
.else
SHIMBUN=	""
.endif

.include <bsd.port.pre.mk>

.if ${EMACS_NAME} == "emacs" && ${EMACS_VER:C/\..*//} >= 23
FLIM_PORT=	${PORTSDIR}/editors/flim
SEMI_PORT=	${PORTSDIR}/editors/semi
INSTALL_TARGET=	install install-icons
PLIST_SUB+=	EMACS23=""
.else
PLIST_SUB+=	EMACS23="@comment "
.endif

.if ${EMACS_PORT_NAME} == "emacs22"
INSTALL_TARGET=	install install-icons
.endif

.if ${EMACS_NAME} == "emacs" && ${EMACS_VER:C/\..*//} < 22
MULE_UCS_PORT=	${PORTSDIR}/converters/mule-ucs
INSTALL_TARGET=	install install-icons
.endif

FLIM_TRUNK=	1.14
FLIM_COOKIE=	${LOCALBASE}/share/flim/flim-${EMACS_PORT_NAME}-${FLIM_TRUNK}.FreeBSD-packages
FLIM_PORT?=	${PORTSDIR}/editors/flim-${EMACS_PORT_NAME}

SEMI_TRUNK=	1.14
SEMI_COOKIE=	${LOCALBASE}/share/semi/semi-${EMACS_PORT_NAME}-${FLIM_TRUNK}.FreeBSD-packages
SEMI_PORT?=	${PORTSDIR}/editors/semi-${EMACS_PORT_NAME}

MULE_UCS_PORT?=	${PORTSDIR}/converters/mule-ucs-${EMACS_PORT_NAME}
MULE_UCS_ELISP_FILE=	${LOCALBASE}/${EMACS_VERSION_SITE_LISPDIR}/mule-ucs/un-define.el

BUILD_DEPENDS+=	w3m:${PORTSDIR}/www/w3m
RUN_DEPENDS+=	w3m:${PORTSDIR}/www/w3m
.if ${PORT_OPTIONS:MSHIMBUN}
BUILD_DEPENDS+=	${FLIM_COOKIE}:${FLIM_PORT}
RUN_DEPENDS+=	${FLIM_COOKIE}:${FLIM_PORT}
.endif
.if ${PORT_OPTIONS:MOCTET_VIEWER}
RUN_DEPENDS+=	${SEMI_COOKIE}:${SEMI_PORT} \
		wvHtml:${PORTSDIR}/textproc/wv \
		xlhtml:${PORTSDIR}/textproc/xlhtml
.if ${EMACS_NAME} == "emacs" && ${EMACS_VER:C/\..*//} < 22
RUN_DEPENDS+=	${MULE_UCS_ELISP_FILE}:${MULE_UCS_PORT}
.endif
.endif

post-extract:
.if defined(EMACS_PACKAGESDIR)
	@${CP} ${FILESDIR}/_pkg.el ${WRKSRC}
.endif

post-install:
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
	${MKDIR} ${DOCSDIR_JA}
.for i in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.for i in ${DOCS_JA}
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR_JA}
.endfor
.endif
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
