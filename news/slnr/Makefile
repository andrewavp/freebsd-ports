# Created by: Tim Vanderhoek <ac199@freenet.hamilton.on.ca>
# $FreeBSD$

PORTNAME=	slnr
PORTVERSION=	2.3.0
CATEGORIES=	news
MASTER_SITES=	# disappeared

MAINTAINER=	c.petrik.sosa@gmail.com
COMMENT=	Simplistic reader for SOUP (HDPF) mail and news packets

RUN_DEPENDS=	zip:${PORTSDIR}/archivers/zip

MAN1=		slnr.1

MAKEFILE=	src/Makefile

DOCFILES=	${FILESDIR}/porting.notes other/soup12.doc other/slnr.doc \
		LICENSE other/default.dot.slnrrc

do-install:
.if !defined{NOPORTDOCS}
	@${ECHO_MSG} "===>  Copying documents to ${PREFIX}/share/doc/slnr"
	@${MKDIR} ${PREFIX}/share/doc/slnr
	@cd ${WRKSRC}; \
		${INSTALL_DATA} ${DOCFILES} ${PREFIX}/share/doc/slnr
.endif
	${INSTALL_MAN} ${WRKSRC}/other/slnr.1 ${PREFIX}/man/man1/slnr.1
	${INSTALL_PROGRAM} ${WRKSRC}/slnr ${PREFIX}/bin

.include <bsd.port.mk>
