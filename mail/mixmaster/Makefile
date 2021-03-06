# Created by: Meyer Wolfsheim
# $FreeBSD$

PORTNAME=	mixmaster
PORTVERSION=	2.9.1
PORTREVISION=	2
CATEGORIES=	mail security
MASTER_SITES=	SF/${PORTNAME}/Mixmaster/${PORTVERSION} \
		ftp://ftp.erisiandiscord.de/pub/misc/
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		mixmaster-update.pl.gz allpingers.txt.gz
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	cs@FreeBSD.org
COMMENT=	A cryptographically secure anonymous remailer

LIB_DEPENDS=	pcre:${PORTSDIR}/devel/pcre

USES=		ncurses
USE_PERL5=	yes
USE_OPENSSL=	yes
.if !exists(/usr/include/openssl/idea.h)
WITH_OPENSSL_PORT=	yes
.endif

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}/Src

CFLAGS+=	-DGLOBALMIXCONF="\"${SYSCONFDIR}/mixmaster/client.cfg\"" -DHOMEMIXDIR="\".Mix\""
MAKE_ARGS=	CC=${CC}

MAN1=		mixmaster.1
WRKDIST=	${WRKDIR}/${PORTNAME}-${PORTVERSION}
MIXMASTER_FILES=	${WRKDIST}/conf/* ${WRKDIST}/README ${WRKDIR}/allpingers.txt
MIXMASTER_SCRIPTS=	${WRKDIR}/mixmaster-update.pl

.include <bsd.port.pre.mk>

post-patch:
	${CP} ${FILESDIR}/Makefile.in ${WRKSRC}/Makefile
	@${RM} ${WRKSRC}/../conf/mix.cfg.orig

pre-install:
	${GZCAT} ${DISTDIR}/mixmaster-update.pl.gz >${WRKDIR}/mixmaster-update.pl
	${GZCAT} ${DISTDIR}/allpingers.txt.gz >${WRKDIR}/allpingers.txt
	${REINPLACE_CMD} -e "s,/etc,${SYSCONFDIR},g" ${WRKDIR}/mixmaster-update.pl
	${MKDIR} ${PREFIX}/share/examples/mixmaster

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/mix ${PREFIX}/bin/mixmaster
	${INSTALL_SCRIPT} ${MIXMASTER_SCRIPTS} ${PREFIX}/bin/mixmaster-update.pl
	${INSTALL_DATA} ${MIXMASTER_FILES} ${PREFIX}/share/examples/mixmaster
	${INSTALL_MAN} ${WRKDIST}/mix.1 ${PREFIX}/man/man1/mixmaster.1

.include <bsd.port.post.mk>
