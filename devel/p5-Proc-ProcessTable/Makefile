# Created by: Michael Johnson <ahze@ahze.net>
# $FreeBSD$

PORTNAME=	Proc-ProcessTable
PORTVERSION=	0.48
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:JWB
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Perl interface to the unix process table

USES=		perl5
USE_PERL5=	configure

MAN3=		Proc::ProcessTable::Process.3 \
		Proc::Killall.3 \
		Proc::ProcessTable.3 \
		Proc::Killfam.3
PORTDOCS=	README README.freebsd-kvm README.freebsd-procfs

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for i in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
