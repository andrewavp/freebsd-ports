# New ports collection makefile for:	checkdns
# Date created:				9 May 2005
# Whom:					Ozkan KIRIK <ozkan@enderunix.org>
#
# $FreeBSD$
#

PORTNAME=	checkdns
PORTVERSION=	0.5
PORTREVISION=	1
CATEGORIES=	dns
MASTER_SITES=	http://www.enderunix.org/checkdns/ \
		http://www.trunix.org/projeler/checkdns/

MAINTAINER=	m.tsatsenko@gmail.com
COMMENT=	A domain name server analysis and reporting tool


SUB_FILES=	pkg-message

PORTDOCS=	AUTHORS COPYING ChangeLog INSTALL README THANKS TODO

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|g' ${WRKSRC}/main.c \
		${WRKSRC}/INSTALL ${WRKSRC}/README ${WRKSRC}/checkdns.conf-dist
	@${REINPLACE_CMD} -e 's|CC = gcc|CC = ${CC} -include string.h|' ${WRKSRC}/Makefile

post-install:
	@if [ ! -f ${PREFIX}/etc/checkdns.conf ]; then \
		${CP} -p ${PREFIX}/etc/checkdns.conf-dist ${PREFIX}/etc/checkdns.conf ; \
	fi

.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_MAN} ${WRKSRC}/$f ${DOCSDIR}
.endfor
.endif

	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
