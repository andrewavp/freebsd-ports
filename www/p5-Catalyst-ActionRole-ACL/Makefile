# Created by: Steve Wills <swills@FreeBSD.org>
# $FreeBSD$

PORTNAME=	Catalyst-ActionRole-ACL
PORTVERSION=	0.07
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:BOBTFISH
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	User role-based authorization action class

LICENSE=	ART10 GPLv1
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Catalyst-Controller-ActionRole>=0:${PORTSDIR}/www/p5-Catalyst-Controller-ActionRole \
		p5-Catalyst-Runtime>=5.90013:${PORTSDIR}/www/p5-Catalyst-Runtime \
		p5-Moose>=0:${PORTSDIR}/devel/p5-Moose \
		p5-namespace-autoclean>=0:${PORTSDIR}/devel/p5-namespace-autoclean
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure

MAN3=		Catalyst::Action::Role::ACL.3 \
		Catalyst::ActionRole::ACL.3

.include <bsd.port.mk>
