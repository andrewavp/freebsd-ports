# Created by: ache@FreeBSD.org
# $FreeBSD$

PORTNAME=	adcomplain
PORTVERSION=	3.52
CATEGORIES=	mail news
MASTER_SITES=	http://www.rdrop.com/users/billmc/
DISTNAME=	${PORTNAME}.pl
EXTRACT_SUFX=	.uu

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Complain about inappropriate commercial use (f.e. SPAM) of usenet/e-mail

USES=		perl5

EXTRACT_CMD=	/usr/bin/uudecode
EXTRACT_BEFORE_ARGS=	<
EXTRACT_AFTER_ARGS=	# empty
NO_WRKSUBDIR=	yes
NO_BUILD=	yes
PLIST_FILES=	bin/adcomplain

post-patch:
	cd ${WRKSRC}; \
	${CP} adcomplain.pl adcomplain.pl.old; \
	${SED} 's=%PERL5%=${PERL}=' < adcomplain.pl.old > adcomplain.pl

do-install:
	cd ${WRKSRC}; \
	${INSTALL_SCRIPT} adcomplain.pl ${PREFIX}/bin/adcomplain

.include <bsd.port.mk>
