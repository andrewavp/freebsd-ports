# Created by: Aaron Dalton <aaron@FreeBSD.org>
# $FreeBSD$

PORTNAME=	IRC-Bot-Hangman
PORTVERSION=	0.1
CATEGORIES=	irc games perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:PDENIS
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	IRC hangman bot

BUILD_DEPENDS=	p5-Bot-BasicBot>=0:${PORTSDIR}/irc/p5-Bot-BasicBot \
		p5-Games-GuessWord>=0:${PORTSDIR}/games/p5-Games-GuessWord \
		p5-Module-Find>=0:${PORTSDIR}/devel/p5-Module-Find \
		p5-Chatbot-Eliza>=0:${PORTSDIR}/misc/p5-Chatbot-Eliza \
		p5-Regexp-Common>=0:${PORTSDIR}/textproc/p5-Regexp-Common
RUN_DEPENDS:=	${BUILD_DEPENDS}

MAN3=	IRC::Bot::Hangman.3 \
	IRC::Bot::Hangman::Command.3 \
	IRC::Bot::Hangman::Command::Default.3 \
	IRC::Bot::Hangman::Command::Eliza.3 \
	IRC::Bot::Hangman::Command::Profanity.3 \
	IRC::Bot::Hangman::Response.3 \
	IRC::Bot::Hangman::Response::Default.3 \
	IRC::Bot::Hangman::Response::Profanity.3 \
	IRC::Bot::Hangman::WordList.3 \
	IRC::Bot::Hangman::WordList::Default.3 \
	IRC::Bot::Hangman::WordList::TooEasy.3

USES=		perl5
USE_PERL5=	modbuild

.include <bsd.port.mk>
