# New ports collection makefile for:	Math-Series
# Date created:				15 May 2006
# Whom:					Aaron Dalton <aaron@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Math-Series
PORTVERSION=	1.01
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Perl extension dealing with mathematic series

BUILD_DEPENDS=	p5-Math-Symbolic>=0:${PORTSDIR}/math/p5-Math-Symbolic \
		p5-Math-Sequence>=0:${PORTSDIR}/math/p5-Math-Sequence
RUN_DEPENDS:=	${BUILD_DEPENDS}

MAN3=	Math::Series.3

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
