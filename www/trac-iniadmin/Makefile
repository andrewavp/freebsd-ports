# New ports collection makefile for: trac-iniadmin
# Date created:                      May 18 2007
# Whom:                              Gerrit Beine <gerrit.beine@gmx.de>
#
# $FreeBSD$
#

PORTNAME=	iniadmin
PORTVERSION=	0.2.3915
PORTREVISION=	2
CATEGORIES=	www devel python
MASTER_SITES=	http://people.freebsd.org/~mm/trac/
PKGNAMEPREFIX=	trac-
DISTNAME=	${PORTNAME}plugin-${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Edit all trac.ini option via the WebAdminPlugin

RUN_DEPENDS+=	tracd:${PORTSDIR}/www/trac

WRKSRC=		${WRKDIR}/${PORTNAME}plugin/0.11
USE_PYTHON=	2.5+
USE_PYDISTUTILS=	easy_install
PYDISTUTILS_PKGNAME=	IniAdmin
PYDISTUTILS_PKGVERSION=	${PORTVERSION:R}
PLIST_SUB+=	PORTVERSION=${PORTVERSION:R} PYTHONVERSION=${PYTHON_VER}
PYDISTUTILS_NOEGGINFO=	yes

.include <bsd.port.mk>
