# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $FreeBSD$

PORTNAME=	Google-ProtocolBuffers
PORTVERSION=	0.08
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Simple interface to Google Protocol Buffers

BUILD_DEPENDS=	p5-Class-Accessor>=0:${PORTSDIR}/devel/p5-Class-Accessor \
		p5-Math-BigInt>=0:${PORTSDIR}/math/p5-Math-BigInt \
		p5-Parse-RecDescent>=1.94:${PORTSDIR}/devel/p5-Parse-RecDescent
RUN_DEPENDS:=	${BUILD_DEPENDS}

USE_PERL5=	configure
USES=		perl5

MAN3=		Google::ProtocolBuffers.3

.include <bsd.port.mk>
