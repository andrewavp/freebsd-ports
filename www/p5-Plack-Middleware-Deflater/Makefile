# $FreeBSD$

PORTNAME=	Plack-Middleware-Deflater
PORTVERSION=	0.11
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:KAZEBURO
PKGNAMEPREFIX=	p5-

MAINTAINER=	kuriyama@FreeBSD.org
COMMENT=	Perl extension to compress response body with Gzip or Deflate

RUN_DEPENDS=	\
	p5-Plack>0:${PORTSDIR}/www/p5-Plack
BUILD_DEPENDS:=	${RUN_DEPENDS}
TEST_DEPENDS=	\
	p5-IO-Handle-Util>0:${PORTSDIR}/devel/p5-IO-Handle-Util \
	p5-Test-TCP>0:${PORTSDIR}/devel/p5-Test-TCP

USES=	perl5
USE_PERL5=	configure

MAN3=	Plack::Middleware::Deflater.3

.include <bsd.port.mk>
