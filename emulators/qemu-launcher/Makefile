# $FreeBSD$

PORTNAME=	qemu-launcher
PORTVERSION=	1.7.4
PORTREVISION=	6
CATEGORIES=	emulators
MASTER_SITES=	http://download.gna.org/qemulaunch/1.7.x/
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A GTK front-end to Qemu

RUN_DEPENDS=	p5-Gtk2>=0:${PORTSDIR}/x11-toolkits/p5-Gtk2 \
		p5-Glade2>=0:${PORTSDIR}/x11-toolkits/p5-Glade2 \
		p5-Locale-gettext>=0:${PORTSDIR}/devel/p5-Locale-gettext

WRKSRC=	${WRKDIR}/${PORTNAME}-${PORTVERSION}
NO_BUILD=	yes
USE_GNOME=	gtk20
INSTALLS_ICONS=	yes
USES=		gettext perl5

MAN1=	qemu-launcher.1

post-patch:
	@${REINPLACE_CMD} -e 's,/usr,${PREFIX},g' ${WRKSRC}/qemu-launcher.pl
	@${REINPLACE_CMD} -e 's,/usr/local,${PREFIX},g' ${WRKSRC}/Makefile

.include <bsd.port.mk>
