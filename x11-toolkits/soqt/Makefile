# New ports collection makefile for:	SoQt
# Date created:				10 March 2003
# Whom:					roland.jesse@gmx.net
#
# $FreeBSD$
#

PORTNAME=	SoQt
PORTVERSION=	1.5.0
PORTREVISION=	2
CATEGORIES=	x11-toolkits
MASTER_SITES=	http://ftp.coin3d.org/coin/src/all/ \
		ftp://ftp.coin3d.org/pub/coin/src/all/
DIST_SUBDIR=	KDE

MAINTAINER=	cristianorolim@hotmail.com
COMMENT=	Qt4 toolkit library for Coin

LIB_DEPENDS=	Coin.61:${PORTSDIR}/graphics/Coin

USE_AUTOTOOLS=	libtool
USES=	pathfix
USE_QT4=	corelib opengl moc_build
USE_GMAKE=	yes
CPPFLAGS+=	-I${QT_INCDIR} -I${QT_INCDIR}/Qt -I${LOCALBASE}/include
LDFLAGS+=	-L${QT_LIBDIR} -L${LOCALBASE}/lib

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	QTDIR="${QT_PREFIX}"

CONFIGURE_ARGS=	--with-pthread=yes --with-coin=${LOCALBASE} \
		--with-qt=${QT_LIBDIR}
USE_LDCONFIG=	yes

MAN1=		soqt-config.1

post-install:
	@${TOUCH} ${PREFIX}/include/Inventor/Qt/engines/.keep_me

.include <bsd.port.mk>
