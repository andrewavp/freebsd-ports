# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $FreeBSD$

PORTNAME=	Net-HTTPS-NB
PORTVERSION=	0.13
CATEGORIES=	net www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Non-blocking HTTPS client

LICENSE=	ART10 GPLv1
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-IO-Socket-SSL>=0.98:${PORTSDIR}/security/p5-IO-Socket-SSL \
		p5-Net-HTTP>=0:${PORTSDIR}/net/p5-Net-HTTP
RUN_DEPENDS:=	${BUILD_DEPENDS}

USE_PERL5=	configure
USES=		perl5

MAN3=		Net::HTTPS::NB.3

.include <bsd.port.mk>
