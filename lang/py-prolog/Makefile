# Created by: Gerhard Gonter <g.gonter@ieee.org>
# $FreeBSD$

PORTNAME=	prolog
PORTVERSION=	0.1
PORTREVISION=	3
CATEGORIES=	lang python
MASTER_SITES=	SF/py${PORTNAME}/PyProlog/PyProlog-${PORTVERSION}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	PyProlog-${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A Python extension embedding SWI-Prolog

BUILD_DEPENDS=	swipl:${PORTSDIR}/lang/swi-pl
RUN_DEPENDS=	swipl:${PORTSDIR}/lang/swi-pl

USE_PYTHON=	yes
USE_PYDISTUTILS=	yes
PYDISTUTILS_PKGNAME=	PyProlog

.include <bsd.port.pre.mk>

.if ${ARCH} == "ia64" || ${ARCH} == "amd64"
BROKEN=		Does not build on ia64 or amd64 (can't link shared libraries to static)
.endif

.include <bsd.port.post.mk>
