# Created by: kungfuftr <scott@surreytech.co.uk>
# $FreeBSD$

PORTNAME=	SOAP-Data-Builder
PORTVERSION=	1
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Wrapper simplifying SOAP::Data and SOAP::Serialiser

BUILD_DEPENDS=	p5-SOAP-Lite>=0:${PORTSDIR}/net/p5-SOAP-Lite
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure

MAN3=	SOAP::Data::Builder.3 SOAP::Data::Builder::Element.3

.include <bsd.port.mk>
