# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $FreeBSD$

PORTNAME=	MouseX-Foreign
PORTVERSION=	0.007
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Extends non-Mouse classes as well as Mouse classes

BUILD_DEPENDS=	p5-Any-Moose>=0.15:${PORTSDIR}/devel/p5-Any-Moose \
		p5-Mouse>=0.77:${PORTSDIR}/devel/p5-Mouse
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-Test-Exception>=0:${PORTSDIR}/devel/p5-Test-Exception \
		p5-Test-Requires>=0:${PORTSDIR}/devel/p5-Test-Requires

USE_PERL5=	configure
USES=		perl5

MAN3=		MouseX::Foreign.3 \
		MouseX::Foreign::Meta::Role::Class.3 \
		MouseX::Foreign::Meta::Role::Method::Constructor.3 \
		MouseX::Foreign::Meta::Role::Method::Destructor.3 \
		MouseX::NonMoose.3

.include <bsd.port.mk>
