# Created by: Donald Burr <dburr@FreeBSD.ORG>
# $FreeBSD$

PORTNAME=	PathTools
PORTVERSION=	3.4000
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:SMUELLER
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:C/00$//}

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Perl module for portably manipulating file specifications

USES=		perl5
USE_PERL5=	configure

MAN3=		Cwd.3 File::Spec.3 File::Spec::Cygwin.3 File::Spec::Epoc.3 \
		File::Spec::Functions.3 File::Spec::Mac.3 File::Spec::OS2.3 \
		File::Spec::Unix.3 File::Spec::VMS.3 File::Spec::Win32.3

.include <bsd.port.mk>
