# Created by: Ryan T. Dean <rtdean@cytherianage.net>
# $FreeBSD$

PORTNAME=	jrrd
PORTVERSION=	1.0.6
CATEGORIES=	databases java
MASTER_SITES=	SF/opennms/JRRD/stable-1.0

MAINTAINER=	venture37@geeklan.co.uk
COMMENT=	Java native interface (JNI) to RRDtool

LIB_DEPENDS=	librrd.so:${PORTSDIR}/databases/rrdtool

USE_JAVA=	yes
JAVA_VERSION=	1.6
JAVA_VENDOR=	openjdk
JAVA_BUILD=	yes
JAVA_RUN=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	JAVA_HOME=${JAVA_HOME}
USE_LDCONFIG=	yes

PLIST_FILES=	%%JAVAJARDIR%%/jrrd.jar \
		lib/libjrrd.la \
		lib/libjrrd.so

pre-everything::
	@${ECHO_MSG}	""
	@${ECHO_MSG}	"Installation settings:"
	@${ECHO_MSG}	"   Location of JDK:          ${JAVA_HOME}"
	@${ECHO_MSG}	"   Location of Java port:    ${JAVA_PORT}"
	@${ECHO_MSG}	""

.include <bsd.port.mk>
