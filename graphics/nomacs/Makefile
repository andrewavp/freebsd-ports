# $FreeBSD$

PORTNAME=	nomacs
PORTVERSION=	1.4.0
CATEGORIES=	graphics
MASTER_SITES=	SF/nomacs/nomacs-${PORTVERSION}/
DISTNAME=	${PORTNAME}-${PORTVERSION}-source

MAINTAINER=	bsd@tuxproject.de
COMMENT=	Small, fast and free image viewer

LICENSE=	GPLv3

LIB_DEPENDS=	exiv2:${PORTSDIR}/graphics/exiv2 \
		sysinfo:${PORTSDIR}/devel/libsysinfo

USE_BZIP2=	yes
USES=		cmake desktop-file-utils pkgconfig
USE_QT4=	gui network linguist_build moc_build \
		qmake_build rcc_build uic_build
LDFLAGS+=	-lsysinfo -lkvm
WRKTOP=		${WRKDIR}
WRKSUBDIR=	${DISTNAME:S,-source,,}
WRKSRC=		${WRKTOP}/${WRKSUBDIR}
MAN1=		nomacs.1

OPTIONS_DEFINE=	RAW TIFF
OPTIONS_DEFAULT=	RAW TIFF
RAW_DESC=	RAW images support
TIFF_DESC=	Support multi-page TIFF images

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MRAW}
LIB_DEPENDS+=	raw:${PORTSDIR}/graphics/libraw \
	opencv_legacy:${PORTSDIR}/graphics/opencv
.else
CMAKE_ARGS+=	-DENABLE_RAW=0
.endif

.if ${PORT_OPTIONS:MTIFF}
LIB_DEPENDS+=	tiff:${PORTSDIR}/graphics/tiff
.else
CMAKE_ARGS+=	-DENABLE_TIFF=0
.endif

post-extract:
	@${REINPLACE_CMD} -e 's|share/man/man1|man/man1|' ${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
