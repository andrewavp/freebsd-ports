# Created by: Holger Lamm <holger@eit.uni-kl.de>
# $FreeBSD$

PORTNAME=	etherape
PORTVERSION=	0.9.9
PORTREVISION=	2
CATEGORIES=	net-mgmt gnome
MASTER_SITES=	SF

MAINTAINER=	sylvio@FreeBSD.org
COMMENT=	A graphical network traffic visualization tool for gnome

USE_GNOME=	libglade2 libgnomeui gnomehack gnomeprefix
USE_GMAKE=	yes
INSTALLS_OMF=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

MAN1=		etherape.1

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=		NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=		NLS="@comment "
.endif

.include <bsd.port.mk>
