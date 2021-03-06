# Created by: trevor
# $FreeBSD$

PORTNAME=	openbox
PORTVERSION=	3.5.0
PORTREVISION=	3
CATEGORIES=	x11-wm
MASTER_SITES=	http://openbox.org/dist/openbox/

MAINTAINER=	novel@FreeBSD.org
COMMENT=	Small, fast, standards compliant, extensible window manager

LICENSE=	GPLv2

GNU_CONFIGURE=	yes
USES=		gmake pkgconfig
USE_GNOME=	glib20 libxml2 gnomehack ltverhack
USE_XORG=	xft
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CFLAGS+="-I${LOCALBASE}/include" \
		LDFLAGS+="-L${LOCALBASE}/lib"
MAN1=		openbox.1 openbox-session.1 obxprop.1 \
		openbox-gnome-session.1 openbox-kde-session.1

PLIST_SUB=	VERSION=${PORTVERSION:C/.[0-9]+\$//}

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.if !defined(WITHOUT_IMLIB)
USE_EFL=	imlib2
.else
CONFIGURE_ARGS+=	--disable-imlib2
.endif

.if !defined(WITHOUT_PANGO)
USE_GNOME+=	pango
.else
CONFIGURE_ARGS+=	--disable-pango
.endif

.if !defined(WITHOUT_STARTUP_NOTIFICATION)
LIB_DEPENDS+=	startup-notification-1.0:${PORTSDIR}/x11/startup-notification
.else
CONFIGURE_ARGS+=	--disable-startup-notification
.endif

post-configure:
	@${CHMOD} +x ${WRKSRC}/install-sh

.include <bsd.port.mk>
