# Created by: trevor
# $FreeBSD$

PORTNAME=	p0f
PORTVERSION=	3.06b
CATEGORIES=	net-mgmt security
MASTER_SITES=	http://lcamtuf.coredump.cx/p0f3/releases/ \
		http://fossies.org/unix/privat/
EXTRACT_SUFX=	.tgz

MAINTAINER=	fbsd-ports@opsec.eu
COMMENT=	Passive OS fingerprinting tool

LICENSE=	LGPL21

PLIST_FILES=	bin/p0f bin/p0f-client bin/p0f-sendsyn \
		bin/p0f-sendsyn6 etc/p0f.fp
PORTDOCS=	ChangeLog README TODO existential-notes.txt \
		extra-sigs.txt

MAKE_ARGS+=	CC="${CC}" CFLAGS="${CFLAGS}"

.include <bsd.port.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|/etc|${PREFIX}/etc|g' ${WRKSRC}/README
	@${REINPLACE_CMD} -e 's|p0f.fp|${PREFIX}/etc/p0f.fp|g' ${WRKSRC}/config.h

do-install:
.for ii in p0f tools/p0f-client tools/p0f-sendsyn tools/p0f-sendsyn6
	${INSTALL_PROGRAM} ${WRKSRC}/${ii} ${PREFIX}/bin
.endfor
	${INSTALL_DATA} ${WRKSRC}/p0f.fp ${PREFIX}/etc/

.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
.for ii in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/docs/${ii} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
