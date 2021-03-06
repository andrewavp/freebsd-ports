# $FreeBSD$

PORTNAME?=	mariadb
PORTVERSION=	5.5.31
PORTREVISION?=	0
CATEGORIES=	databases ipv6
MASTER_SITES=	http://ftp.osuosl.org/pub/mariadb/${PORTNAME}-${PORTVERSION}/kvm-tarbake-jaunty-x86/ \
		http://mirrors.supportex.net/mariadb/${PORTNAME}-${PORTVERSION}/kvm-tarbake-jaunty-x86/ \
		http://mirror.aarnet.edu.au/pub/MariaDB/${PORTNAME}-${PORTVERSION}/kvm-tarbake-jaunty-x86/ \
		http://mirror2.hs-esslingen.de/pub/Mirrors/mariadb/${PORTNAME}-${PORTVERSION}/kvm-tarbake-jaunty-x86/ \
		http://gd.tuwien.ac.at/db/mariadb/${PORTNAME}-${PORTVERSION}/kvm-tarbake-jaunty-x86/ \
		http://mirrors.fe.up.pt/pub/mariadb/${PORTNAME}-${PORTVERSION}/kvm-tarbake-jaunty-x86/ \
		http://mirror.de.gsnw.de:56431/mariadb/${PORTNAME}-${PORTVERSION}/kvm-tarbake-jaunty-x86/ \
		http://mirror.layerjet.com/mariadb/${PORTNAME}-${PORTVERSION}/kvm-tarbake-jaunty-x86/ \
		http://mirror.switch.ch/mirror/mariadb/${PORTNAME}-${PORTVERSION}/kvm-tarbake-jaunty-x86/
PKGNAMESUFFIX?=	-server

MAINTAINER=	never@nevermind.kiev.ua
COMMENT?=	Multithreaded SQL database (server)

SLAVEDIRS=	databases/mariadb55-client
USES=		cmake
NO_OPTIONS_SORT=yes

OPTIONS_DEFINE+=	SSL OPENSSL PORTSSL FASTMTX
OPTIONS_DEFAULT+=	SSL

FASTMTX_DESC=	Replace mutexes with spinlocks
OPENSSL_DESC=	Use OpenSSL instead of bundled yassl
PORTSSL_DESC=	Use OpenSSL from port (requires OPENSSL to be set)

CMAKE_ARGS+=	-DINSTALL_DOCDIR="share/doc/mysql" \
		-DINSTALL_DOCREADMEDIR="share/doc/mysql" \
		-DINSTALL_INCLUDEDIR="include/mysql" \
		-DINSTALL_INFODIR="info" \
		-DINSTALL_LIBDIR="lib/mysql" \
		-DINSTALL_MANDIR="man" \
		-DINSTALL_MYSQLDATADIR="/var/db/mysql" \
		-DINSTALL_MYSQLSHAREDIR="share/mysql" \
		-DINSTALL_MYSQLTESTDIR="share/mysql/tests" \
		-DINSTALL_PLUGINDIR="lib/mysql/plugin" \
		-DINSTALL_SBINDIR="libexec" \
		-DINSTALL_SCRIPTDIR="bin" \
		-DINSTALL_SHAREDIR="share" \
		-DINSTALL_SQLBENCHDIR="share/mysql" \
		-DINSTALL_SUPPORTFILESDIR="share/mysql" \
		-DWITH_LIBEDIT=0 \
		-DWITH_LIBWRAP=1

.ifdef USE_MYSQL
.error You have `USE_MYSQL' variable defined either in environment or in make(1) arguments. Please undefine and try again.
.endif

DATADIR=	${PREFIX}/share/mysql
USE_LDCONFIG=	${PREFIX}/lib/mysql

# MySQL-Server options
.if !defined(CLIENT_ONLY)
OPTIONS_DEFINE+=	OQGRAPH PBXT MAXKEY

OQGRAPH_DESC=	Open Query Graph Computation engine
PBXT_DESC=	MVCC-based transactional engine
MAXKEY_DESC=	Change max key length from 1000 to 4000

OPTIONS_DEFAULT+=	PBXT MAXKEY
.endif

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MSSL}
.if ${PORT_OPTIONS:MOPENSSL}
USE_OPENSSL=	yes
.if empty(PORT_OPTIONS:MPORTSSL)
WITH_OPENSSL_BASE=	yes
.else
WITH_OPENSSL_PORT=	yes
.endif
CMAKE_ARGS+=	-DWITH_SSL=yes
.else
CMAKE_ARGS+=	-DWITH_SSL=bundled
.endif
.else
CMAKE_FLAGS+=	-DWITH_SSL=no
.endif
.if ${PORT_OPTIONS:MFASTMTX}
CMAKE_ARGS+=	-DWITH_FAST_MUTEXES=1
.endif

# MySQL-Server part
.if !defined(CLIENT_ONLY)
USE_MYSQL=	yes
WANT_MYSQL_VER=	55m

LATEST_LINK=	mariadb55-server

CONFLICTS_INSTALL=	mysql-server-[345].* mariadb-server-5.3.* percona-server-5.*

USE_RC_SUBR=	mysql-server

USERS=		mysql
GROUPS=		mysql

MAN1=		my_print_defaults.1 myisam_ftdump.1 myisamchk.1 myisamlog.1 myisampack.1 \
		mysql.server.1 mysql_convert_table_format.1 mysql_fix_extensions.1 \
		mysql_install_db.1 mysql_secure_installation.1 mysql_setpermission.1 \
		mysql_tzinfo_to_sql.1 mysql_upgrade.1 mysql_zap.1 mysqlbug.1 \
		mysqld_multi.1 mysqld_safe.1 mysqldumpslow.1 mysqlhotcopy.1 mysqlman.1 \
		mysqltest.1 perror.1 replace.1 resolve_stack_dump.1 resolveip.1 \
		innochecksum.1

MAN8=		mysqld.8

CMAKE_ARGS+=	-DWITH_EMBEDDED_SERVER="ON" \
		-DWITHOUT_EXAMPLE_STORAGE_ENGINE=1

post-install:
.if !defined(PACKAGE_BUILDING)
	@${CAT} ${PKGMESSAGE}
.endif

.if empty(PORT_OPTIONS:MOQGRAPH)
CMAKE_ARGS+=	-DWITHOUT_OQGRAPH_STORAGE_ENGINE=1
PLIST_SUB+=	OQGRAPH="@comment "
.else
USE_GCC?=	yes
CMAKE_ARGS+=	-DWITH_OQGRAPH_STORAGE_ENGINE=1
PLIST_SUB+=	OQGRAPH=""
LIB_DEPENDS+=	boost_system:${PORTSDIR}/devel/boost-libs
.endif
.if empty(PORT_OPTIONS:MPBXT)
CMAKE_ARGS+=	-DWITHOUT_PBXT_STORAGE_ENGINE=1
.else
CMAKE_ARGS+=	-DWITH_PBXT_STORAGE_ENGINE=1
.endif
.if ${PORT_OPTIONS:MMAXKEY}
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-include_my_compare.h
.endif
.endif

post-patch:
	@${REINPLACE_CMD} 's/*.1/${MAN1}/' ${WRKSRC}/man/CMakeLists.txt

.include <bsd.port.pre.mk>

.if ${ARCH} == "arm"
BROKEN=		Does not compile on arm
.endif

.include <bsd.port.post.mk>
