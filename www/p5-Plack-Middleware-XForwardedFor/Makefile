# Created by: Gea-Suan Lin <gslin@gslin.org>
# $FreeBSD$

PORTNAME=	Plack-Middleware-XForwardedFor
PORTVERSION=	0.103060
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	gslin@gslin.org
COMMENT=	Plack middleware to handle X-Forwarded-For headers

BUILD_DEPENDS=	p5-Net-Netmask>=1.9015:${PORTSDIR}/net-mgmt/p5-Net-Netmask \
		p5-Plack>=0.9913:${PORTSDIR}/www/p5-Plack \
		p5-Regexp-Common>=2010010201:${PORTSDIR}/textproc/p5-Regexp-Common
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Plack::Middleware::XForwardedFor.3

.include <bsd.port.mk>
