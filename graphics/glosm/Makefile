# Created by: Dmitry Marakasov <amdmi3@FreeBSD.org>
# $FreeBSD$

PORTNAME=	glosm
PORTVERSION=	0.0.2
PORTREVISION=	2
CATEGORIES=	graphics geography
MASTER_SITES=	http://cloud.github.com/downloads/AMDmi3/glosm/ \
		http://mirror.amdmi3.ru/distfiles/

MAINTAINER=	amdmi3@FreeBSD.org
COMMENT=	3D OpenGL renderer for OpenStreetMap

LIB_DEPENDS=	png15:${PORTSDIR}/graphics/png \
		expat:${PORTSDIR}/textproc/expat2

USE_BZIP2=	yes
USES=		cmake
USE_GL=		gl
USE_SDL=	sdl

PORTDOCS=	README ChangeLog

.include <bsd.port.options.mk>

regression-test:
	cd ${BUILD_WRKSRC} && ctest

post-install:
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}/
.endfor
.endif

.include <bsd.port.mk>
