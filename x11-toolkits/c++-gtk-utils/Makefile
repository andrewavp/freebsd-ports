# Created by: Pawel Pekala <pawel@FreeBSD.org>
# $FreeBSD$

PORTNAME=	c++-gtk-utils
PORTVERSION=	2.2.2
CATEGORIES=	x11-toolkits
MASTER_SITES=	SF/cxx-gtk-utils/cxx-gtk-utils/${PORTVERSION}/
DISTNAME=	c%2B%2B-gtk-utils-${PORTVERSION}

MAINTAINER=	pawel@FreeBSD.org
COMMENT=	Lightweight library for programming GTK+ programs

LICENSE=	LGPL21

GNU_CONFIGURE=	yes
USE_GCC=	4.6+
USES=		pathfix pkgconfig
USE_GNOME=	gtk20
USE_LDCONFIG=	yes

CONFIGURE_SCRIPT=	configure-gtk2
CONFIGURE_ARGS+=	--docdir=${DOCSDIR}

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
PORTDOCS=	*

OPTIONS_DEFINE=	DEBUG DOCS

DEBUG_CONFIGURE_ON=	--enable-debug

.include <bsd.port.options.mk>

post-configure:
.if ! ${PORT_OPTIONS:MDOCS}
	@${REINPLACE_CMD} '/^SUBDIRS/ s|docs|| ; /^pkgdoc_DATA/d' \
		${WRKSRC}/Makefile
.endif

.include <bsd.port.mk>
