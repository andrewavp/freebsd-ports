# Created by: Alan Eldridge <alane@FreeBSD.org>
# $FreeBSD$

PORTNAME=	firefox
DISTVERSION=	17.0.8
PORTEPOCH=	1
CATEGORIES=	www ipv6
MASTER_SITES=	MOZILLA/${PORTNAME}/releases/${DISTVERSION}esr/source
DISTNAME=	${PORTNAME}-${DISTVERSION}esr.source
PKGNAMESUFFIX=	-esr

MAINTAINER=	gecko@FreeBSD.org
COMMENT=	Web browser based on the browser portion of Mozilla

BUILD_DEPENDS=	nspr>=4.9.2:${PORTSDIR}/devel/nspr \
		nss>=3.13.6_1:${PORTSDIR}/security/nss \
		sqlite3>=3.7.13:${PORTSDIR}/databases/sqlite3 \
		${PYTHON_PKGNAMEPREFIX}sqlite3>0:${PORTSDIR}/databases/py-sqlite3 \
		cairo>=1.10.2_1,1:${PORTSDIR}/graphics/cairo \
		unzip:${PORTSDIR}/archivers/unzip

USE_AUTOTOOLS=	autoconf213:env
USE_PYTHON_BUILD=-2.7
LATEST_LINK=	firefox-esr
USE_GECKO=	gecko
CONFLICTS=	firefox-2[0-35-9].* firefox-1[1-689].*
MOZ_PKGCONFIG_FILES=	# empty
USE_MOZILLA=	# empty
MOZILLA_NAME=	Firefox

WANT_GNOME=	yes
USE_QT4=	# empty
QT_NONSTANDARD=	yes
ALL_TARGET=	default
GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GL=		gl
NO_MOZPKGINSTALL=yes

FIREFOX_ICON=		${MOZILLA}.png
FIREFOX_ICON_SRC=	${PREFIX}/lib/${MOZILLA}/chrome/icons/default/default48.png
MOZ_OPTIONS=	--program-transform-name='s/firefox/${MOZILLA}/' \
		--enable-application=browser \
		--enable-official-branding

.include "${.CURDIR}/../../www/firefox/Makefile.options"
.include <bsd.port.pre.mk>

WRKSRC:=	${WRKDIR}/mozilla-esr17

post-extract:
	@${SED} -e 's|@FIREFOX_ICON@|${FIREFOX_ICON}|' -e 's|@MOZILLA@|${MOZILLA}|' \
		-e 's|@MOZILLA_NAME@|${MOZILLA_NAME}|' \
		<${FILESDIR}/firefox.desktop.in >${WRKDIR}/${MOZILLA}.desktop

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		${WRKSRC}/browser/app/nsBrowserApp.cpp

pre-configure:
	(cd ${WRKSRC} && ${AUTOCONF})
	(cd ${WRKSRC}/js/src/ && ${AUTOCONF})

port-pre-install:
	${ECHO_CMD} 'share/applications/${MOZILLA}.desktop' >> ${PLISTF}
	${ECHO_CMD} "@dirrmtry share/applications" >> ${PLISTD}
	${ECHO_CMD} 'share/pixmaps/${FIREFOX_ICON}' >> ${PLISTF}

post-install:
	${MKDIR} ${PREFIX}/share/applications ${PREFIX}/share/pixmaps
	${INSTALL_DATA} ${WRKDIR}/${MOZILLA}.desktop ${PREFIX}/share/applications/
	${MKDIR} ${PREFIX}/lib/${MOZILLA}/chrome/icons/default
	${LN} -sf ${FIREFOX_ICON_SRC} ${PREFIX}/share/pixmaps/${FIREFOX_ICON}
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
