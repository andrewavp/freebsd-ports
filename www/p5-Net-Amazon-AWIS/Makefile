# Created by: Gea-Suan Lin <gslin@gslin.org>
# $FreeBSD$

PORTNAME=	Net-Amazon-AWIS
PORTVERSION=	0.36
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Use the Amazon Alexa Web Information Service

BUILD_DEPENDS=	p5-IO-Prompt>=0:${PORTSDIR}/devel/p5-IO-Prompt \
		p5-Test-Exception>=0:${PORTSDIR}/devel/p5-Test-Exception
RUN_DEPENDS=	p5-Class-Accessor>=0:${PORTSDIR}/devel/p5-Class-Accessor \
		p5-DateTime-Format-Strptime>=0:${PORTSDIR}/devel/p5-DateTime-Format-Strptime \
		p5-Digest-HMAC>=0:${PORTSDIR}/security/p5-Digest-HMAC \
		p5-URI>=0:${PORTSDIR}/net/p5-URI \
		p5-XML-LibXML>=0:${PORTSDIR}/textproc/p5-XML-LibXML \
		p5-libwww>=0:${PORTSDIR}/www/p5-libwww

USES=		perl5
USE_PERL5=	configure

MAN3=		Net::Amazon::AWIS.3

.include <bsd.port.mk>
