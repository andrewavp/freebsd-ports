# Created by: Kris Moore <kris@pcbsd.org>
# $FreeBSD$

PORTNAME=	qtcreator
DISTVERSION=	2.6.1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_QT:S/$/:qtcreator/} \
		${MASTER_SITE_QT}
MASTER_SITE_SUBDIR=	official_releases/qtcreator/${DISTVERSION:R}/${DISTVERSION}/:qtcreator \
			official_releases/qt/${QT4_VERSION:R}/${QT4_VERSION}
DISTNAME=	qt-creator-${DISTVERSION}-src
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:qtcreator \
		${QT_DISTNAME}.tar.gz
DIST_SUBDIR=	KDE

MAINTAINER=	kde@FreeBSD.org
COMMENT=	C++ and QML IDE for Qt development

LIB_DEPENDS=	Imath:${PORTSDIR}/graphics/ilmbase \
		IlmImf:${PORTSDIR}/graphics/OpenEXR \
		jasper:${PORTSDIR}/graphics/jasper \
		jpeg:${PORTSDIR}/graphics/jpeg

USE_QT4=	qmake_build moc_build rcc_build uic_build \
		linguist_build assistant_run qt3support \
		dbus designer gui help-tools_build network script \
		sql svg xml webkit qdoc3_build
HAS_CONFIGURE=	yes
MAKE_ENV+=	INSTALL_ROOT=${PREFIX}
MAKE_JOBS_UNSAFE=	yes
ALL_TARGET=	all docs
INSTALL_TARGET=	install install_docs
USE_LDCONFIG=	${PREFIX}/lib/${PORTNAME}

QMAKE_ARGS=	-recursive CONFIG+="configure" ${QMAKE_PRO}
QMAKE_PRO=	${WRKSRC}/${PORTNAME}.pro

# Build Qt Quick Designer (requires update on every Qt update).
QT_DISTNAME=	qt-everywhere-opensource-src-${QT4_VERSION}
DO_NOT_EXTRACT=	config.profiles config.tests demos doc examples lib \
		mkspecs tools translations
.for dne in ${DO_NOT_EXTRACT}
EXTRACT_AFTER_ARGS+=	--exclude '${QT_DISTNAME}/${dne}'
.endfor
QMAKE_ARGS+=	QT_PRIVATE_HEADERS="${WRKDIR}/${QT_DISTNAME}/include"

CONFIGURE_WRKSRC=	${WRKDIR}/build
BUILD_WRKSRC=		${CONFIGURE_WRKSRC}
INSTALL_WRKSRC=		${CONFIGURE_WRKSRC}

DESKTOP_ENTRIES=	"Qt Creator" "${COMMENT}" "QtProject-qtcreator" \
			"${PREFIX}/bin/${PORTNAME}" "Development;Qt;" true

post-patch:
	${REINPLACE_CMD} -e 's|lrelease|lrelease-qt4|' \
		${WRKSRC}/share/qtcreator/translations/translations.pro
	${REINPLACE_CMD} -e 's|lupdate|lupdate-qt4|' \
		${WRKSRC}/share/qtcreator/translations/translations.pro
	${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|' \
		${WRKSRC}/src/plugins/android/androidsettingswidget.cpp

do-configure:
	${MKDIR} ${CONFIGURE_WRKSRC}
	cd ${CONFIGURE_WRKSRC} && ${SETENV} ${CONFIGURE_ENV} \
		${QMAKE} ${QMAKEFLAGS} ${QMAKE_ARGS}

.include <bsd.port.mk>
