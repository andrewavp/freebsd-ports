# New ports collection makefile for:	zebra-server
# Date created:				14 Nov 2000
# Whom:					Dmitry Sivachenko <demon@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	zebra-server
PORTVERSION=	2.0.45
CATEGORIES=	net
MASTER_SITES=	http://ftp.indexdata.dk/pub/zebra/
DISTNAME=	idzebra-${PORTVERSION}

MAINTAINER=	ben@gibbed.org
COMMENT=	Z39.50/SR server software

LIB_DEPENDS=	expat.6:${PORTSDIR}/textproc/expat2 \
		yaz.4:${PORTSDIR}/net/yaz

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-yaz=${LOCALBASE}/bin \
		--with-tclconfig=${TCL_LIBDIR} \
		--with-iconv=${LOCALBASE} --with-expat=${LOCALBASE}

USES=		iconv
USE_LDCONFIG=	yes
USE_TCL=	yes

MAN1=		idzebra-config-2.0.1 zebraidx-2.0.1
MAN8=		zebrasrv-2.0.8
MLINKS=		idzebra-config-2.0.1 idzebra-config.1 \
		zebraidx-2.0.1 zebraidx.1 \
		zebrasrv-2.0.8 zebrasrv.8

.include <bsd.port.mk>
