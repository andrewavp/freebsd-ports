# Created by: Danny Pansters <danny@ricin.com>
# $FreeBSD$

PORTNAME=	qscintilla2
PORTVERSION=	${QSCI2_VERSION}
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITES_QSCI2}
DISTNAME=	${QSCI2_DISTNAME}

MAINTAINER=	kde@FreeBSD.org
COMMENT=	Qt4 port of the Scintilla C++ editor class

USE_QT4=	qmake_build moc_build gui xml designer
HAS_CONFIGURE=	yes
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

BUILD_WRKSRC=		${WRKSRC}/Qt4Qt5
INSTALL_WRKSRC=		${BUILD_WRKSRC}

QMAKE_ARGS=	-unix PREFIX=${PREFIX}

PORTDOCS=	*
PORTEXAMPLES=	*

.include "${.CURDIR}/../py-qt4/bsd.pyqt.mk"
.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MNLS}
PLIST_SUB+=	NLS=""
.else
PLIST_SUB+=	NLS="@comment "
.endif

post-patch:
	cd ${BUILD_WRKSRC} && ${REINPLACE_CMD} -e \
		's|$$$$\[QT_INSTALL_HEADERS\]|${PREFIX}/${QT_INCDIR_REL}|; \
		s|$$$$\[QT_INSTALL_LIBS\]|${PREFIX}/${QT_LIBDIR_REL}|; \
		s|$$$$\[QT_INSTALL_TRANSLATIONS\]|${PREFIX}/share/qt4/translations|; \
		s|$$$$\[QT_INSTALL_DATA\]|${PREFIX}/share/qt4|' \
		qscintilla.pro

.if empty(PORT_OPTIONS:MNLS)
	cd ${BUILD_WRKSRC} && ${REINPLACE_CMD} -e \
		's|trans qsci|qsci|' qscintilla.pro
.endif

do-configure:
	cd ${BUILD_WRKSRC} && ${SETENV} ${CONFIGURE_ENV} \
		${QMAKE} ${QMAKEFLAGS} ${QMAKE_ARGS} qscintilla.pro

post-install:
.if ${PORT_OPTIONS:MDOCS}
	cd ${WRKSRC} &&\
		${MKDIR} ${DOCSDIR}/html ${DOCSDIR}/Scintilla &&\
		${INSTALL_DATA} NEWS README ${DOCSDIR} &&\
		${INSTALL_DATA} doc/html-Qt4Qt5/* ${DOCSDIR}/html &&\
		${INSTALL_DATA} doc/Scintilla/* ${DOCSDIR}/Scintilla
.endif
.if ${PORT_OPTIONS:MEXAMPLES}
	cd ${WRKSRC}/example-Qt4Qt5 &&\
		${MKDIR} ${EXAMPLESDIR}/images &&\
		${INSTALL_DATA} *.* ${EXAMPLESDIR} &&\
		${INSTALL_DATA} images/* ${EXAMPLESDIR}/images
.endif
.include <bsd.port.mk>
