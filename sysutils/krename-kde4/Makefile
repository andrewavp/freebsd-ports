# $FreeBSD$

PORTNAME=	krename
PORTVERSION=	4.0.9
PORTREVISION=	3
CATEGORIES=	sysutils kde
MASTER_SITES=	SF/${PORTNAME}/KDE4%20${PORTNAME}-stable/${PORTVERSION}

MAINTAINER=	makc@FreeBSD.org
COMMENT=	Very powerful batch file renamer for KDE

LIB_DEPENDS=	tag.1:${PORTSDIR}/audio/taglib \
		exiv2.12:${PORTSDIR}/graphics/exiv2 \
		podofo.0:${PORTSDIR}/graphics/podofo

LATEST_LINK=	${PORTNAME}-kde4

USE_BZIP2=	yes
USES=		cmake:outsource
USE_KDE4=	kdeprefix kdelibs automoc4
USE_QT4=	qmake_build moc_build rcc_build uic_build

post-patch:
	${REINPLACE_CMD} 's,FREETYPE_INCLUDE_DIR,FREETYPE_INCLUDE_DIR_freetype2,' \
		${WRKSRC}/src/CMakeLists.txt

.include <bsd.port.mk>
