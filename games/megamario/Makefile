# Created by:	nemysis@gmx.ch
#
# $FreeBSD$

PORTNAME=	megamario
PORTVERSION=	1.7
CATEGORIES=	games
MASTER_SITES=	SF/mmario/Mega%20Mario%20Full%20Game/Mega%20Mario%20v${PORTVERSION}%20%28Full%20Game%2C%20high%20Quality%20music%29/
DISTNAME=	MegaMario_v${PORTVERSION}_full

MAINTAINER=	nemysis@gmx.ch
COMMENT=	Super Mario Bros 1 clone

LICENSE=	LGPL21

WRKSRC=		${WRKDIR}/${DISTNAME}

FETCH_ARGS?=	-Fpr
USE_ZIP=	yes
EXTRACT_AFTER_ARGS=	-d ${WRKSRC}
USE_GMAKE=	yes
USE_DOS2UNIX=	*.cpp *.h *.ini Makefile* *.txt *.desktop
ALL_TARGET=	${PORTNAME}
USE_SDL=	sdl image mixer ttf
USE_GL=		glu

pre-extract:
		${MKDIR} ${WRKDIR}/${DISTNAME}

PLIST_FILES=	bin/${PORTNAME} \
		share/applications/${PORTNAME}.desktop \
		share/pixmaps/${PORTNAME}.png
PLIST_DIRSTRY=	share/applications

PORTDATA=	*
PORTDOCS=	CONTROLS.txt linux.txt readme.txt

.include <bsd.port.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/share/pixmaps/megamario.png|${PORTNAME}|' \
		${WRKSRC}/${PORTNAME}.desktop
	@${REINPLACE_CMD} -e 's|slidebar.PNG|slidebar.png|' \
		${WRKSRC}/data/levels/Edit2/main ${WRKSRC}/data/levels/3_2/main
	@(cd ${WRKSRC}/help && ${MV} editor_R*.PNG editor_Roehren.png)
	@for i in `${FIND} ${WRKSRC} -name \*.JPG -or -name \*.PNG`; do \
		${MV} $$i `echo $$i | ${SED} -e 's/PNG/png/;s/JPG/jpg/'`; done

post-install:
	@(cd ${WRKSRC} && ${COPYTREE_SHARE} "help mp3music screens" ${DATADIR})
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}.png ${PREFIX}/share/pixmaps/
	${MKDIR} ${PREFIX}/share/applications
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}.desktop ${PREFIX}/share/applications/

.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
.endif

.include <bsd.port.mk>
