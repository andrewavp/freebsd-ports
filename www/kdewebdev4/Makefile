# Created by: Martin Wilke <miwi@FreeBSD.org>
# $FreeBSD$

PORTNAME=	kdewebdev
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	www kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
DIST_SUBDIR=	KDE/${PORTVERSION}

MAINTAINER=	kde@FreeBSD.org
COMMENT=	Comprehensive html/website development environment

LIB_DEPENDS=	tidy-0.99.0:${PORTSDIR}/www/tidy-lib \
		boost_thread:${PORTSDIR}/devel/boost-libs

LATEST_LINK=	${PORTNAME}4

USE_XZ=		yes
USE_GNOME=	libxml2 libxslt
USE_KDE4=	kdelibs pimlibs kdeprefix kdehier automoc4
USES=		cmake:outsource
USE_QT4=	dbus porting_build \
		qmake_build moc_build rcc_build uic_build uic3_build
USE_LDCONFIG=	yes

.include <bsd.port.mk>
