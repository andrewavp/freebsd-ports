# Created by: Hendrik Scholz <hendrik@scholz.net>
# $FreeBSD$

PORTNAME=	fbdesk
PORTVERSION=	1.4.1
PORTREVISION=	5
CATEGORIES=	x11
MASTER_SITES=	http://fluxbox.sourceforge.net/download/ \
		GENTOO/distfiles

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A Fluxbox utility to create and manage icons on the desktop

LICENSE=	MIT

LIB_DEPENDS=	png15:${PORTSDIR}/graphics/png

OPTIONS_DEFINE=	IMLIB2 DOCS
OPTIONS_DEFAULT=	IMLIB2

USE_XORG=	xext xft xpm xrender
USES=		pkgconfig
WANT_EFL=	yes
GNU_CONFIGURE=	yes

PORTDOCS=	ChangeLog INSTALL README
PLIST_FILES=	bin/fbdesk

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MIMLIB2}
USE_EFL+=	imlib2
.else
CONFIGURE_ARGS+=	--disable-imlib2
.endif

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
.for file in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
