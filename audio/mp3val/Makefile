# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@sunpoet.net>
# $FreeBSD$

PORTNAME=	mp3val
PORTVERSION=	0.1.8
CATEGORIES=	audio
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}%20${PORTVERSION}
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Program for MPEG audio stream validation

ALL_TARGET=	mp3val
MAKEFILE=	${WRKSRC}/Makefile.linux
USES=		gmake

PLIST_FILES=	bin/mp3val

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/mp3val ${PREFIX}/bin/

.include <bsd.port.mk>
