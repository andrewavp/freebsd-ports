# Created by: David Yeske <dyeske@gmail.com>
# $FreeBSD$

PORTNAME=	spiralsynthmodular
PORTVERSION=	0.2.2a
PORTREVISION=	7
CATEGORIES=	audio
MASTER_SITES=	SF/spiralmodular/spiralmodular/${PORTVERSION}%20%28Latest%20Version%29
DISTNAME=	spiralmodular-${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Object-oriented modular softsynth/sequencer/sampler

BUILD_DEPENDS=	${LOCALBASE}/include/ladspa.h:${PORTSDIR}/audio/ladspa \
		jackd:${PORTSDIR}/audio/jack
LIB_DEPENDS=	fltk:${PORTSDIR}/x11-toolkits/fltk \
		sndfile:${PORTSDIR}/audio/libsndfile

USE_XORG=	x11
GNU_CONFIGURE=	yes

CONFIGURE_ENV=	FLTK_CONFIG="${FLTK_CONFIG}" \
		LIBS="${LIBS} -L${LOCALBASE}/lib ${PTHREAD_LIBS}"
CPPFLAGS+=	-I${LOCALBASE}/include

WRKSRC=	${WRKDIR}/spiralmodular-0.2.2

OPTIONS_DEFINE=	OPTIMIZED_CFLAGS

.include <bsd.port.pre.mk>

.if ${PORT_OPTIONS:MOPTIMIZED_CFLAGS}
CFLAGS+=	-O3 -ffast-math
.endif

.if ${ARCH} == "ia64"
BROKEN=		Does not compile on ia64
.endif

post-patch:
	@${REINPLACE_CMD} -E -e 's@(-O3|-ffast-math)@@g; \
		s|-Wall||; \
		s|CFLAGS="-pipe|CFLAGS="\$$\{CFLAGS\} ${PTHREAD_CFLAGS}|; \
		s|CXXFLAGS="-pipe|CXXFLAGS="\$$\{CXXFLAGS\} ${PTHREAD_CFLAGS}|; \
		s|^SpiralSound/Plugins/MidiPlugin/Makefile||; \
		s|MidiPlugin||' \
			${CONFIGURE_WRKSRC}/${CONFIGURE_SCRIPT}

	@${REINPLACE_CMD} -e 's|-I/usr/X11R6/include|-I${LOCALBASE}/include|' \
		${WRKSRC}/SpiralSound/Plugins/LADSPAPlugin/Makefile.in

	@${REINPLACE_CMD} -e 's|O_SYNC|O_FSYNC|' \
		${WRKSRC}/SpiralSound/Midi.C

	@${REINPLACE_CMD} -e \
		's|True|true|; s|False|false|' \
		${WRKSRC}/SpiralSound/Plugins/MatrixPlugin/MatrixPlugin.C

	@${REINPLACE_CMD} -e \
		's|JackPort::||' \
		${WRKSRC}/SpiralSound/Plugins/JackPlugin/JackPlugin.h

	@${REINPLACE_CMD} -e \
		's|CVGUI::||' \
		${WRKSRC}/SpiralSound/Plugins/ControllerPlugin/ControllerPluginGUI.h

	@${REINPLACE_CMD} -e \
		's|Sample::||' \
		${WRKSRC}/SpiralSound/Sample.h

	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} ${REINPLACE_CMD} -E -e \
		's|-ldl||; \
		s|-lrt||; \
		s|g\+\+|$$(CXX)|; \
		/^CC[[:space:]]*=.+$$/d; \
		/^CXX[[:space:]]*=.+$$/d; \
		s,@FLTK_(C|CXX)FLAGS@,-I${LOCALBASE}/include,; \
		s|-lpthread|${PTHREAD_LIBS}|g'

	@${FIND} ${WRKSRC} -type f -name "*.C" -o -name "*.cpp" -o -name "*.h" | ${XARGS} \
	   ${REINPLACE_CMD} -e '/^#include <FL/s|.h>$$|.H>|; /^#include "FL/s|.h"$$|.H"|; \
	   s|fl_file_chooser.H|Fl_File_Chooser.H|g'

.include <bsd.port.post.mk>
