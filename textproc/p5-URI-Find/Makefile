# Created by: Pete Fritchman <petef@databits.net>
# $FreeBSD$

PORTNAME=	URI-Find
PORTVERSION=	20111103
CATEGORIES=	textproc net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Perl module to find URIs in arbitrary text

BUILD_DEPENDS=	p5-URI>=1:${PORTSDIR}/net/p5-URI
RUN_DEPENDS=	p5-URI>=1:${PORTSDIR}/net/p5-URI

USES=		perl5
USE_PERL5=	modbuild

MAN1=		urifind.1
MAN3=		URI::Find.3 \
		URI::Find::Schemeless.3

.include <bsd.port.mk>
