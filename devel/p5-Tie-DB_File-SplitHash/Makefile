# Created by: clsung@dragon2.net
# $FreeBSD$

PORTNAME=	Tie-DB_File-SplitHash
PORTVERSION=	1.05
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Wrapper around the DB_File Berkeley database system

BUILD_DEPENDS=	p5-Digest-SHA1>=0:${PORTSDIR}/security/p5-Digest-SHA1
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	modbuild

MAN3=		Tie::DB_File::SplitHash.3

.include <bsd.port.mk>
