# Created by: Nick Sayer <nsayer@FreeBSD.ORG>
# $FreeBSD$

PORTNAME=	GDBM
PORTVERSION=	1.14
PORTREVISION=	2
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN/../../src
PKGNAMEPREFIX=	p5-
DISTNAME=	perl-5.14.2
DIST_SUBDIR=	perl

MAINTAINER=	perl@FreeBSD.org
COMMENT=	GNU Data Base Manager (gdbm) interface

LIB_DEPENDS=	gdbm.4:${PORTSDIR}/databases/gdbm

EXTRACT_AFTER_ARGS=	${DISTNAME}/ext/GDBM_File ${DISTNAME}/t/lib

CFLAGS+=	-I${LOCALBASE}/include
USES=		perl5
USE_PERL5=	configure
USE_BZIP2=	yes
WRKSRC=		${WRKDIR}/${DISTNAME}/ext/GDBM_File

MAN3=		GDBM_File.3

.include <bsd.port.mk>
