# New ports collection makefile for:	sarien
# Date created:		25 May 2004
# Whom:			Radim Kolar
#
# $FreeBSD$
#

PORTNAME=	sarien
PORTVERSION=	0.7.0
PORTREVISION=	3
CATEGORIES=	games
MASTER_SITES=	SF

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Sierra AGI games interpreter

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_XORG=	x11
MAKE_JOBS_UNSAFE=	yes

CFLAGS+=	-I${LOCALBASE}/include

PLIST_FILES=	bin/sarien etc/sarien.conf

post-patch:
	@${REINPLACE_CMD} -e "s,%%PREFIX%%,${PREFIX},g" ${WRKSRC}/src/filesys/unix/path.c

do-install:
	${INSTALL} ${WRKSRC}/bin/sarien ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/etc/sarien.cfg ${PREFIX}/etc/sarien.conf

.include <bsd.port.mk>
