# Created by: Sergey Skvortsov <skv@protey.ru>
# $FreeBSD$

PORTNAME=	MooseX-ClassAttribute
PORTVERSION=	0.27
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DROLSKY
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Declare class attributes Moose-style

LICENSE=	ART20

BUILD_DEPENDS=	p5-Moose>=2:${PORTSDIR}/devel/p5-Moose \
		p5-namespace-autoclean>=0.11:${PORTSDIR}/devel/p5-namespace-autoclean \
		p5-namespace-clean>=0.20:${PORTSDIR}/devel/p5-namespace-clean
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-MooseX-AttributeHelpers>=0:${PORTSDIR}/devel/p5-MooseX-AttributeHelpers \
		p5-MooseX-Role-Parameterized>=0:${PORTSDIR}/devel/p5-MooseX-Role-Parameterized \
		p5-MooseX-Role-Strict>=0:${PORTSDIR}/devel/p5-MooseX-Role-Strict \
		p5-Test-Requires>=0:${PORTSDIR}/devel/p5-Test-Requires \
		p5-Test-Fatal>=0:${PORTSDIR}/devel/p5-Test-Fatal

USES=		perl5
USE_PERL5=	configure

MAN3=		MooseX::ClassAttribute.3 \
		MooseX::ClassAttribute::Meta::Role::Attribute.3 \
		MooseX::ClassAttribute::Trait::Application.3 \
		MooseX::ClassAttribute::Trait::Application::ToClass.3 \
		MooseX::ClassAttribute::Trait::Application::ToRole.3 \
		MooseX::ClassAttribute::Trait::Attribute.3 \
		MooseX::ClassAttribute::Trait::Class.3 \
		MooseX::ClassAttribute::Trait::Mixin::HasClassAttributes.3 \
		MooseX::ClassAttribute::Trait::Role.3 \
		MooseX::ClassAttribute::Trait::Role::Composite.3

.include <bsd.port.mk>
