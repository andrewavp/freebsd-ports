# Created by: dom@happygiraffe.net
# $FreeBSD$

PORTNAME=	cthumb
PORTVERSION=	4.2
PORTREVISION=	4
CATEGORIES=	graphics www
MASTER_SITES=	SF

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Themeable web picture album generator

RUN_DEPENDS=	${LOCALBASE}/bin/pnmscale:${PORTSDIR}/graphics/netpbm \
		${LOCALBASE}/bin/djpeg:${PORTSDIR}/graphics/jpeg \
		${LOCALBASE}/bin/jhead:${PORTSDIR}/graphics/jhead \
		p5-HTML-Parser>=0:${PORTSDIR}/www/p5-HTML-Parser \
		p5-URI>=0:${PORTSDIR}/net/p5-URI

USES=		perl5
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-themedir=${DATADIR}

MAN1=		cthumb.1

PORTDOCS=	ChangeLog INSTALL README TO-DO VERSION cthumbrc.sample

THEMES=		blue-steel.theme \
		classic-clips.theme \
		classic.theme \
		crosshair.theme \
		film.theme \
		flaps.theme \
		float-medium.theme \
		float-more.theme \
		float-thick.theme \
		float.theme \
		ithumb.theme \
		neat-round.theme \
		neat-square.theme \
		oak.theme \
		postcard.theme \
		shiny-tube.theme \
		simpleframe.theme \
		slides-big.theme \
		slides-clean.theme \
		slides-huge.theme \
		slides-small.theme \
		spotlight.theme \
		tv-large.theme \
		tv.theme

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/cthumb ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/cthumb.1 ${PREFIX}/man/man1
	${MKDIR} ${DATADIR}
.for theme in ${THEMES}
	${MKDIR} ${DATADIR}/${theme}
	${INSTALL_DATA} ${WRKSRC}/themes/${theme}/* ${DATADIR}/${theme}
.endfor
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for doc in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${doc} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
