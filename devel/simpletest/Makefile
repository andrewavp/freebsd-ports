# Created by: Roman Neuhauser (<neuhauser@chello.cz>)
# $FreeBSD$

PORTNAME=	simpletest
PORTVERSION=	1.1.0
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}_${PORTVERSION:C/\.0//}
DISTNAME=	${PORTNAME:L}_${PORTVERSION}

MAINTAINER=	danilogondolfo@gmail.com
COMMENT=	Unit testing, mock objects, and web testing framework for PHP

LICENSE=	LGPL21

USE_PHP=	pcre
USE_PHP_BUILD=	yes
DEFAULT_PHP_VER=5
NO_BUILD=	yes

WRKSRC=		${WRKDIR}/${PORTNAME:L}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MDOCS}
DOCFILES=	HELP_MY_TESTS_DONT_WORK_ANYMORE README
HTMLDOCFILES=	docs/en/*
.endif

DATAFILES=	*.php extensions test LICENSE VERSION

do-install:
	${MKDIR} ${DATADIR}
	cd ${WRKSRC}/ \
	  && ${FIND} ${DATAFILES} -type d -exec ${MKDIR} ${DATADIR}/{} \; \
	  && ${FIND} ${DATAFILES} -type f -exec ${INSTALL_DATA} {} ${DATADIR}/{} \;
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
	${MKDIR} ${DOCSDIR}/html
.for file in ${DOCFILES}
	${CP} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.for file in ${HTMLDOCFILES}
	${CP} ${WRKSRC}/${file} ${DOCSDIR}/html
.endfor
.endif

post-install:
	@${FIND} -s ${DATAFILES:S,^,${WRKSRC}/,} -not -type d \
	  | ${SED} -ne 's,^${WRKSRC},${DATADIR:S,^${PREFIX}/,,},p' >> ${TMPPLIST}
	@${FIND} -s -d ${DATAFILES:S,^,${WRKSRC}/,} -type d \
	  | ${SED} -ne 's,^${WRKSRC},@dirrm ${DATADIR:S,^${PREFIX}/,,},p' >> ${TMPPLIST}
	@${ECHO_CMD} "@dirrm ${DATADIR:S,^${PREFIX}/,,}" >> ${TMPPLIST}
.if ${PORT_OPTIONS:MDOCS}
	@${FIND} -s ${DOCSDIR} -not -type d \
	  | ${SED} -ne 's,^${PREFIX}/,,p' >> ${TMPPLIST}
	@${FIND} -s -d ${DOCSDIR} -type d \
	  | ${SED} -ne 's,^${PREFIX}/,@dirrm ,p' >> ${TMPPLIST}
.endif

.include <bsd.port.mk>
