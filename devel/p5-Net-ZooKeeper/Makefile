# New ports collection makefile for:	p5-Net-ZooKeeper
# Date created:		2012-08-20
# Whom:			Steven Kreuzer <skreuzer@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Net-ZooKeeper
PORTVERSION=	0.35
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	skreuzer@FreeBSD.org
COMMENT=	Perl extension for Apache ZooKeeper

BUILD_DEPENDS=	zookeeper>=3.3.5:${PORTSDIR}/devel/zookeeper
RUN_DEPENDS:=	${BUILD_DEPEND}

PERL_CONFIGURE=	yes
CONFIGURE_ARGS+=	--zookeeper-include ${PREFIX}/include/c-client-src \
			--zookeeper-include ${PREFIX}/include/zookeeper \
			--zookeeper-lib ${PREFIX}/libs

MAN3=	Net::ZooKeeper.3

.include <bsd.port.mk>
