# Created by: Ralf van Dooren <r.vdooren@snow.nl>
# $FreeBSD$

PORTNAME=	rsnapshot
PORTVERSION=	1.3.1
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	http://www.rsnapshot.org/downloads/

MAINTAINER=	r.vdooren@snow.nl
COMMENT=	Filesystem snapshot utility based on rsync(1)

BUILD_DEPENDS=	rsync:${PORTSDIR}/net/rsync
RUN_DEPENDS=	rsync:${PORTSDIR}/net/rsync \
		p5-Lchown>=0:${PORTSDIR}/sysutils/p5-Lchown

USES=		shebangfix
USE_PERL5=	yes
GNU_CONFIGURE=	yes
SHEBANG_FILES=	rsnapshot-program.pl

MAN1=		rsnapshot.1 rsnapshot-diff.1
PORTDOCS=	AUTHORS ChangeLog README TODO

post-patch:
	${REINPLACE_CMD} -e 's,/usr/bin/pod2man,pod2man,' ${WRKSRC}/Makefile.in

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
