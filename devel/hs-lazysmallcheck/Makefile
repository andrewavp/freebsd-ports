# $FreeBSD$

PORTNAME=	lazysmallcheck
PORTVERSION=	0.6
PORTREVISION=	5
CATEGORIES=	devel haskell

MAINTAINER=	haskell@FreeBSD.org
COMMENT=	Library for demand-driven testing of Haskell programs

LICENSE=	BSD

INSTALL_PORTEXAMPLES=	cd ${WRKSRC}/examples && ${COPYTREE_SHARE} \* ${EXAMPLESDIR}

.include "${.CURDIR}/../../lang/ghc/bsd.cabal.mk"
.include <bsd.port.mk>
