# Created by: Michael Johnson <ahze@ahze.net>
# $FreeBSD$

PORTNAME=	faac
PORTVERSION=	1.28
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-src/${PORTNAME}-${PORTVERSION}

MAINTAINER=	multimedia@FreeBSD.org
COMMENT=	MPEG-2 and MPEG-4 AAC audio encoder

LIB_DEPENDS=	mp4v2.10:${PORTSDIR}/multimedia/mp4v2

RESTRICTED=	Distribution in binary form is prohibited

USES=		gmake
USE_BZIP2=	yes
USE_DOS2UNIX=	yes
USE_AUTOTOOLS=	aclocal autoheader automake autoconf libtool
ACLOCAL_ARGS=	-I . -I ${LOCALBASE}/share/aclocal
AUTOMAKE_ARGS=	--add-missing
CONFIGURE_ARGS=	--with-mp4v2
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
USE_LDCONFIG=	yes

MAN1=		faac.1

.include <bsd.port.pre.mk>

post-patch:
	@${ECHO_CMD} "" >> ${WRKSRC}/libfaac/psych.h
	@${REINPLACE_CMD} -e 's|<mp4\.h>|<mp4v2/mp4v2.h>|g' \
		${WRKSRC}/frontend/main.c \

pre-configure:
	@cd ${WRKSRC}; ${SETENV} ${AUTOTOOLS_ENV} ${LIBTOOLIZE} --automake

.include <bsd.port.post.mk>
