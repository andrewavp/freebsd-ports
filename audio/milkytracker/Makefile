# Created by: Emanuel Haupt <ehaupt@FreeBSD.org>
# $FreeBSD$

PORTNAME=	milkytracker
PORTVERSION=	0.90.85
PORTREVISION=	3
CATEGORIES=	audio
MASTER_SITES=	http://www.milkytracker.org/files/ \
		CRITICAL/${PORTNAME}/${PORTVERSION}/${PORTREVISION}

MAINTAINER=	ehaupt@FreeBSD.org
COMMENT=	Music creation tool inspired by Fast Tracker 2

LICENSE=	GPLv3

NOT_FOR_ARCH=	powerpc

LIB_DEPENDS+=	jack:${PORTSDIR}/audio/jack \
		zzip:${PORTSDIR}/devel/zziplib

USES=		pkgconfig
GNU_CONFIGURE=	yes
USE_SDL=	sdl

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

CONFIGURE_ARGS+=	--disable-alsatest --without-alsa

PORTDOCS=	FAQ.html MilkyTracker.html ChangeLog.html
ICONS=		carton.ico carton.png

OPTIONS_DEFINE=	DOCS

.include <bsd.port.options.mk>

post-install:
.for f in ${ICONS}
	${INSTALL_DATA} ${WRKSRC}/resources/pictures/${f} \
		${PREFIX}/share/pixmaps/${f:C/carton/milkytracker/}
.endfor
	${MKDIR} ${DESKTOPDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}.desktop ${DESKTOPDIR}

.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/docs/${f} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
