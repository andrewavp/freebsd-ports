# Created by: Dmitry Marakasov <amdmi3@amdmi3.ru>
# $FreeBSD$

PORTNAME=	glpng
PORTVERSION=	1.45
PORTREVISION=	5
CATEGORIES=	graphics
MASTER_SITES=	http://www.wyatt100.freeserve.co.uk/ \
		http://mirror.amdmi3.ru/distfiles/
DISTNAME=	glpng

MAINTAINER=	amdmi3@FreeBSD.org
COMMENT=	Library to easily load PNG files as an OpenGL textures

LIB_DEPENDS=	png15:${PORTSDIR}/graphics/png

USE_GL=		gl
USE_ZIP=	yes
USE_LDCONFIG=	yes
USE_DOS2UNIX=	glpng.c

AR?=		/usr/bin/ar

WRKSRC=		${WRKDIR}/src

do-build:
	${CC} ${CFLAGS} -fPIC -I${LOCALBASE}/include -I${WRKDIR}/include -c -o ${WRKSRC}/libglpng.o ${WRKSRC}/glpng.c
	${CC} ${CFLAGS} -fPIC -L${LOCALBASE}/lib -shared -lGL -lpng -lz -lm -o ${WRKSRC}/libglpng.so.1 ${WRKSRC}/libglpng.o
	${AR} cqs ${WRKSRC}/libglpng.a ${WRKSRC}/libglpng.o

do-install:
	${INSTALL_DATA} ${WRKSRC}/libglpng.so.1 ${PREFIX}/lib
	${INSTALL_DATA} ${WRKSRC}/libglpng.a ${PREFIX}/lib
	${LN} -sf libglpng.so.1 ${PREFIX}/lib/libglpng.so
	${MKDIR} ${PREFIX}/include/GL/
	${INSTALL_DATA} ${WRKDIR}/include/GL/glpng.h ${PREFIX}/include/GL/

.include <bsd.port.mk>
