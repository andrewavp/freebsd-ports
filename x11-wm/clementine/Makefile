# Created by: trevor
# $FreeBSD$

PORTNAME=	clementine
PORTVERSION=	0.0.7
PORTREVISION=	6
CATEGORIES=	x11-wm
MASTER_SITES=	SF/${PORTNAME}/Source/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Has title bars, iconizing, and styles (unstable)

RUN_DEPENDS=	xv:${PORTSDIR}/graphics/xv \
		rxvt:${PORTSDIR}/x11/rxvt

PLIST=		${WRKDIR}/pkg-plist
PKGMESSAGE=	${WRKDIR}/pkg-message
USE_GMAKE=	yes
USE_XORG=	x11
DOCS=		COPYING HISTORY LICENSE
REINPLACE_ARGS=	-i'' -E

post-patch:
	${REINPLACE_CMD} 's:^CFLAGS:IGNORE:g ; s:^DEFINES:IGNORE:g ;\
		s:/usr/X11R6:${LOCALBASE}:g' \
		${WRKSRC}/Makefile
	${REINPLACE_CMD} 's:./clementine:${PREFIX}/bin/clementine:g' \
		${WRKSRC}/windowmanager.cpp

pre-install:
	${ECHO_CMD} bin/clementine > ${PLIST}
	for i in `${LS} ${WRKSRC} | ${GREP} look-`; do \
		${ECHO_CMD} share/clementine/$$i >> ${PLIST}; \
	done
	${ECHO_CMD} share/clementine/keys >> ${PLIST}
.if !defined(NOPORTDOCS)
.for i in ${DOCS}
	${ECHO_CMD} share/doc/clementine/${i} >> ${PLIST}
.endfor
	${ECHO_CMD} @dirrm share/doc/clementine >> ${PLIST}
.endif
	${ECHO_CMD} @dirrm share/clementine >> ${PLIST}
	${ECHO_CMD} "*" > ${PKGMESSAGE}
	${ECHO_CMD} "* To customize clementine, copy the keys file to ~/keys and" >> ${PKGMESSAGE}
	${ECHO_CMD} "* copy one of the look- files to ~/look; edit them as needed." >> ${PKGMESSAGE}
	${ECHO_CMD} "*" >> ${PKGMESSAGE}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/clementine ${PREFIX}/bin
	${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/keys ${WRKSRC}/look-* ${DATADIR}
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for i in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
