# New ports collection makefile for:	p5-IPC-Cache
# Date created:				April 03 2001
# Whom:	      				vanilla
#
# $FreeBSD$
#

PORTNAME=	IPC-Cache
PORTVERSION=	0.02
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Persist data across processes via shared memory

BUILD_DEPENDS=	p5-IPC-ShareLite>=0:${PORTSDIR}/devel/p5-IPC-ShareLite
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure

MAN3=		IPC::Cache.3

.include <bsd.port.mk>
