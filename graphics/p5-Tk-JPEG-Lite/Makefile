# Created by: Michael Johnson <ahze@ahze.net>
# $FreeBSD$

PORTNAME=	Tk-JPEG-Lite
PORTVERSION=	2.01500
CATEGORIES=	graphics perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:S/00$//}

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Very simplistic image viewer that loads JPEG images

BUILD_DEPENDS=	p5-Tk>=0:${PORTSDIR}/x11-toolkits/p5-Tk
LIB_DEPENDS=	libjpeg.so.11:${PORTSDIR}/graphics/jpeg
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure

MAN1=	tkjpeg-lite.1
MAN3=	Tk::JPEG::Lite.3

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|' \
		${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
