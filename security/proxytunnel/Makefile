# Created by: Hammurabi Mendes <hmendes@brturbo.com>
# $FreeBSD$

PORTNAME=	proxytunnel
PORTVERSION=	1.9.0
CATEGORIES=	security
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}%20source%20tarballs/${PORTNAME}%20${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ehaupt@FreeBSD.org
COMMENT=	Connects stdin and stdout to an origin server through an HTTPS proxy

USES=		pkgconfig gmake

ALL_TARGET=	${PORTNAME}

MAN1=		proxytunnel.1
PLIST_FILES=	bin/proxytunnel

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/${MAN1} ${MANPREFIX}/man/man1

.include <bsd.port.mk>
