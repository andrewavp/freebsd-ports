# Created by: torstenb@FreeBSD.org
# $FreeBSD$

PORTNAME=	rmsg
PORTVERSION=	1.64
PORTREVISION=	1
CATEGORIES=	net
MASTER_SITES=	ftp://ftp.funet.fi/pub/unix/tcpip/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Network messaging system

WRKSRC=		${WRKDIR}/rmsg
MAN1=		rmsg.1
MAN8=		rmsgd.8
PLIST_FILES=	bin/rmsg sbin/rmsgd
USE_RC_SUBR=	rmsgd

.include <bsd.port.pre.mk>

.if ${OSVERSION} > 900007
BROKEN=	Does not build after the removal of utmp(5)
.endif

.include <bsd.port.post.mk>
