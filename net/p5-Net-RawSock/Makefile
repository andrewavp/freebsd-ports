# $FreeBSD$

PORTNAME=	Net-RawSock
PORTVERSION=	1.0
CATEGORIES=	net perl5
MASTER_SITES=	http://www.hsc.fr/ressources/outils/rawsock/download/
PKGNAMEPREFIX=	p5-

MAINTAINER=	ecu@200ok.org
COMMENT=	Net::RawSock provides a base function to send raw IP packets from Perl

USES=		perl5
USE_PERL5=	configure patch

MAN3=		Net::RawSock.3
DOCSDIR=	${PREFIX}/share/doc/${PKGNAMEPREFIX}${PORTNAME}

post-patch:
	${PERL} -pi -e 's/^our\s+([\$$\@\%]\w+)/use vars qw($$1);$$1/;' \
		-e '$$_="" if /use warnings/;' \
		${WRKSRC}/RawSock.pm

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for f in README demo.pl
	@${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
