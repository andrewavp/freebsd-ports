# Created by: Aaron Dalton <aaron@FreeBSD.org>
# $FreeBSD$

PORTNAME=	Math-SymbolicX-Error
PORTVERSION=	1.01
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Parser extension for dealing with numeric errors

BUILD_DEPENDS=	p5-Math-Symbolic>=0:${PORTSDIR}/math/p5-Math-Symbolic \
		p5-Math-SymbolicX-ParserExtensionFactory>=0:${PORTSDIR}/math/p5-Math-SymbolicX-ParserExtensionFactory \
		p5-Number-WithError>=0:${PORTSDIR}/math/p5-Number-WithError
RUN_DEPENDS:=	${BUILD_DEPENDS}

MAN3=	Math::SymbolicX::Error.3

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
