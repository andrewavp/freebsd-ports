# Created by: Andrey Kostenko <andrey@kostenko.name>
# $FreeBSD$

PORTNAME=	Data-Section
PORTVERSION=	0.101622
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Read multiple hunks of data out of your DATA section

LICENSE=	ART10 GPLv1
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Sub-Exporter>=0.979:${PORTSDIR}/devel/p5-Sub-Exporter \
		p5-MRO-Compat>=0.09:${PORTSDIR}/devel/p5-MRO-Compat
RUN_DEPENDS=	p5-Sub-Exporter>=0.979:${PORTSDIR}/devel/p5-Sub-Exporter \
		p5-MRO-Compat>=0.09:${PORTSDIR}/devel/p5-MRO-Compat

USES=		perl5
USE_PERL5=	configure

MAN3=	Data::Section.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501400
TEST_DEPENDS+=	p5-Test-Simple>=0.96:${PORTSDIR}/devel/p5-Test-Simple
.endif

.include <bsd.port.post.mk>
