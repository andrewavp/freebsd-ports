# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $FreeBSD$

PORTNAME=	AnyEvent-BDB
PORTVERSION=	1.1
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Truly asynchronous Berkeley DB access

BUILD_DEPENDS=	p5-AnyEvent>=3.81:${PORTSDIR}/devel/p5-AnyEvent \
		p5-BDB>=1.5:${PORTSDIR}/databases/p5-BDB
RUN_DEPENDS:=	${BUILD_DEPENDS}

USE_PERL5=	configure
USES=		perl5

MAN3=		AnyEvent::BDB.3

.include <bsd.port.mk>
