# Created by: Zenoss <zenoss@experts-exchange.com>
# $FreeBSD$

PORTNAME=	ApacheMonitor
PORTVERSION=	2.1.2
CATEGORIES=	net-mgmt www
MASTER_SITES=   http://dev.zenoss.org/trac/changeset/26203/tags/zenoss-3.1.0/zenpacks/
DISTFILES=	${ZPACKPREFIX}${PORTNAME}?old_path=%2F\&format=zip

MAINTAINER=	zenoss@experts-exchange.com
COMMENT=	Provides performance monitoring of the Apache HTTP Server

PLIST_FILES=	zenoss/ZenPack/${ZPACK}
PLIST_DIRS=	zenoss/ZenPack
USES=		zenoss

BROKEN=	fails to fetch

USE_ZIP=	yes
ZPACKGROUP=	core
WRKSRC=		${WRKDIR}/tags/zenoss-3.1.0/zenpacks/${ZPACKPREFIX}${PORTNAME}/

.include <bsd.port.mk>
