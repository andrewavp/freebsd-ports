# Created by: Wen Heping <wen@FreeBSD.org>
# $FreeBSD$

PORTNAME=	App-CLI-Extension
PORTVERSION=	1.42.1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:HOLLY
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:R}${PORTVERSION:E}

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Extension for App::CLI extension module

BUILD_DEPENDS=	p5-App-CLI>=0.313:${PORTSDIR}/devel/p5-App-CLI \
		p5-Class-Accessor-Grouped>=0.10000:${PORTSDIR}/devel/p5-Class-Accessor-Grouped \
		p5-Error>=0.17000:${PORTSDIR}/lang/p5-Error \
		p5-MRO-Compat>=0.11:${PORTSDIR}/devel/p5-MRO-Compat \
		p5-UNIVERSAL-require>=0.13:${PORTSDIR}/devel/p5-UNIVERSAL-require
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure

MAN3=		App::CLI::Extension.3 \
		App::CLI::Extension::Component::Config.3 \
		App::CLI::Extension::Component::ErrorHandler.3 \
		App::CLI::Extension::Component::InstallCallback.3 \
		App::CLI::Extension::Component::OriginalArgv.3 \
		App::CLI::Extension::Component::RunCommand.3 \
		App::CLI::Extension::Component::Stash.3 \
		App::CLI::Extension::Exception.3 \
		App::CLI::README.3

.include <bsd.port.mk>
