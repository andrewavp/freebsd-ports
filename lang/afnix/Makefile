# Created by: Ying-Chieh Liao <ijliao@FreeBSD.org>
# $FreeBSD$

PORTNAME=	afnix
PORTVERSION=	2.3.1
CATEGORIES=	lang
MASTER_SITES=	http://www.afnix.org/ftp/ \
		ftp://ftp.stack.nl/pub/users/johans/afnix/
DISTNAME=	${PORTNAME}-src-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	johans@FreeBSD.org
COMMENT=	A multi-threaded functional programming language

USE_GMAKE=	yes
USE_LDCONFIG=	yes
HAS_CONFIGURE=	yes
CONFIGURE_SCRIPT=	cnf/bin/afnix-setup
CONFIGURE_ARGS=		-o --prefix "${PREFIX}" --altdir "${PREFIX}" \
			--shrdir "${PREFIX}/share" --compiler freebsd
MAKE_ENV=	PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"

PORTDOCS=	*
PLIST_SUB=	PORTVER=${PORTVERSION:R}

MAN1=	afnix::adp.1 afnix::axp.1 axc.1 axd.1 axi.1 axl.1
MAN3=	afnix::csm.3 afnix::gfx.3 afnix::itu.3 afnix::mth.3 afnix::net.3 \
	afnix::nwg.3 afnix::sec.3 afnix::sio.3 afnix::sps.3 afnix::sys.3 \
	afnix::txt.3 afnix::wax.3 afnix::xml.3 afnix::xpe.3
MAN7=	afnix::guide.7 afnix::license.7 afnix::notes.7 afnix::reference.7

.include <bsd.port.pre.mk>

.if ${ARCH} == "powerpc"
BROKEN=		Does not configure on powerpc
.endif

post-extract:
	@cd ${WRKSRC}/cnf/mak && ${CP} -f afnix-gcc-4.mak afnix-freebsd.mak

post-patch:
	@${REINPLACE_CMD} -e 's|$$(CP)|$$(BSD_INSTALL_PROGRAM)|' \
		${WRKSRC}/src/*/*/exe/Makefile
	@${REINPLACE_CMD} -e '/\.rtf/d' ${WRKSRC}/etc/Makefile
	@${REINPLACE_CMD} -e '/^MANDIR/s/SHRDIR/MANPREFIX/' \
		${WRKSRC}/cnf/mak/afnix-defs.mak
	@${REINPLACE_CMD} -e '/uname -r/s/\\\./[.-]/' \
		${WRKSRC}/cnf/bin/afnix-guess

post-build:
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${GMAKE} doc
	@cd ${WRKSRC}/prj && ${SETENV} ${MAKE_ENV} ${GMAKE} doc

post-install:
.if ! ${PORT_OPTIONS:MDOCS}
. for i in ${MAN1} ${MAN3} ${MAN7}
	${INSTALL_MAN} ${WRKSRC}/bld/${PORTNAME}-doc-${PORTVERSION}/man/$i \
		${MANPREFIX}/man/man${i:E}/
. endfor
.else
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${GMAKE} publish
.endif

.include <bsd.port.post.mk>
