# Ports collection makefile for:  pear-Doctrine
# Date created:			  28 September 2009
# Whom:				  Greg Larkin <glarkin@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Doctrine
PORTVERSION=	1.2.4
CATEGORIES=	databases pear
MASTER_SITES=	http://www.doctrine-project.org/downloads/ \
		LOCAL/glarkin

MAINTAINER=	glarkin@FreeBSD.org
COMMENT=	Doctrine is a PHP object relational mapper

LICENSE=	LGPL21

PORTSCOUT=	limit:^1\.2\.

OPTIONS_DEFINE=	DBLIB MYSQL ODBC PGSQL SQLITE
OPTIONS_DEFAULT=MYSQL

DBLIB_DESC=	Install PHP DBO driver for DBLIB
MYSQL_DESC=	Install PHP DBO driver for MySQL
ODBC_DESC=	Install PHP DBO driver for ODBC
PGSQL_DESC=	Install PHP DBO driver for PostgreSQL
SQLITE_DESC=	Install PHP DBO driver for SQLite

CHANNEL=	pear.doctrine-project.org
MANUAL_PACKAGE_BUILD=	attempts to contact ${CHANNEL} during installation

SUB_FILES=	pear-install
SUB_LIST+=	CHANNEL=${CHANNEL} LOCALBASE=${LOCALBASE}
PKGINSTALL=	${WRKDIR}/pear-install
LATEST_LINK=	pear-Doctrine12

.include <bsd.port.options.mk>

DEFAULT_PHP_VER=5

USE_PHP=	pdo
WANT_PHP_CLI=	yes

.if ${PORT_OPTIONS:MDBLIB}
RUN_DEPENDS+=	${PHPBASE}/lib/php/${PHP_EXT_DIR}/pdo_dblib.so:${PORTSDIR}/databases/php${PHP_VER}-pdo_dblib
.endif
.if ${PORT_OPTIONS:MMYSQL}
USE_PHP+=	pdo_mysql
.endif
.if ${PORT_OPTIONS:MODBC}
RUN_DEPENDS+=	${PHPBASE}/lib/php/${PHP_EXT_DIR}/pdo_odbc.so:${PORTSDIR}/databases/php${PHP_VER}-pdo_odbc
.endif
.if ${PORT_OPTIONS:MPGSQL}
USE_PHP+=	pdo_pgsql
.endif
.if ${PORT_OPTIONS:MSQLITE}
USE_PHP+=	pdo_sqlite
.endif

FILES=		Doctrine/Access.php \
		Doctrine/Adapter/Exception.php \
		Doctrine/Adapter/Interface.php \
		Doctrine/Adapter/Mock.php \
		Doctrine/Adapter/Oracle.php \
		Doctrine/Adapter/Statement/Interface.php \
		Doctrine/Adapter/Statement/Mock.php \
		Doctrine/Adapter/Statement/Oracle.php \
		Doctrine/Adapter/Statement.php \
		Doctrine/AuditLog/Listener/Microtime.php \
		Doctrine/AuditLog/Listener.php \
		Doctrine/AuditLog.php \
		Doctrine/Builder.php \
		Doctrine/Cache/Apc.php \
		Doctrine/Cache/Array.php \
		Doctrine/Cache/Db.php \
		Doctrine/Cache/Driver.php \
		Doctrine/Cache/Exception.php \
		Doctrine/Cache/Interface.php \
		Doctrine/Cache/Memcache.php \
		Doctrine/Cache/Xcache.php \
		Doctrine/Cli/AnsiColorFormatter.php \
		Doctrine/Cli/Exception.php \
		Doctrine/Cli/Formatter.php \
		Doctrine/Cli.php \
		Doctrine/Collection/Exception.php \
		Doctrine/Collection/Iterator/Expandable.php \
		Doctrine/Collection/Iterator/Normal.php \
		Doctrine/Collection/Iterator/Offset.php \
		Doctrine/Collection/Iterator.php \
		Doctrine/Collection/Offset.php \
		Doctrine/Collection/OnDemand.php \
		Doctrine/Collection.php \
		Doctrine/Column.php \
		Doctrine/Compiler/Exception.php \
		Doctrine/Compiler.php \
		Doctrine/Configurable.php \
		Doctrine/Connection/Common.php \
		Doctrine/Connection/Db2.php \
		Doctrine/Connection/Exception.php \
		Doctrine/Connection/Mock.php \
		Doctrine/Connection/Module.php \
		Doctrine/Connection/Mssql/Exception.php \
		Doctrine/Connection/Mssql.php \
		Doctrine/Connection/Mysql/Exception.php \
		Doctrine/Connection/Mysql.php \
		Doctrine/Connection/Oracle/Exception.php \
		Doctrine/Connection/Oracle.php \
		Doctrine/Connection/Pgsql/Exception.php \
		Doctrine/Connection/Pgsql.php \
		Doctrine/Connection/Profiler/Exception.php \
		Doctrine/Connection/Profiler.php \
		Doctrine/Connection/Sqlite/Exception.php \
		Doctrine/Connection/Sqlite.php \
		Doctrine/Connection/Statement.php \
		Doctrine/Connection/UnitOfWork.php \
		Doctrine/Connection.php \
		Doctrine/Core.php \
		Doctrine/Data/Exception.php \
		Doctrine/Data/Export.php \
		Doctrine/Data/Import.php \
		Doctrine/Data.php \
		Doctrine/DataDict/Exception.php \
		Doctrine/DataDict/Mssql.php \
		Doctrine/DataDict/Mysql.php \
		Doctrine/DataDict/Oracle.php \
		Doctrine/DataDict/Pgsql.php \
		Doctrine/DataDict/Sqlite.php \
		Doctrine/DataDict.php \
		Doctrine/Event.php \
		Doctrine/EventListener/Chain.php \
		Doctrine/EventListener/Exception.php \
		Doctrine/EventListener/Interface.php \
		Doctrine/EventListener.php \
		Doctrine/Exception.php \
		Doctrine/Export/Exception.php \
		Doctrine/Export/Mssql.php \
		Doctrine/Export/Mysql.php \
		Doctrine/Export/Oracle.php \
		Doctrine/Export/Pgsql.php \
		Doctrine/Export/Reporter.php \
		Doctrine/Export/Schema.php \
		Doctrine/Export/Sqlite.php \
		Doctrine/Export.php \
		Doctrine/Expression/Driver.php \
		Doctrine/Expression/Exception.php \
		Doctrine/Expression/Mock.php \
		Doctrine/Expression/Mssql.php \
		Doctrine/Expression/Mysql.php \
		Doctrine/Expression/Oracle.php \
		Doctrine/Expression/Pgsql.php \
		Doctrine/Expression/Sqlite.php \
		Doctrine/Expression.php \
		Doctrine/File/Index.php \
		Doctrine/File.php \
		Doctrine/Formatter.php \
		Doctrine/Hook/Equal.php \
		Doctrine/Hook/Integer.php \
		Doctrine/Hook/Parser/Complex.php \
		Doctrine/Hook/Parser.php \
		Doctrine/Hook/WordLike.php \
		Doctrine/Hook.php \
		Doctrine/Hydrator/Abstract.php \
		Doctrine/Hydrator/ArrayDriver.php \
		Doctrine/Hydrator/ArrayHierarchyDriver.php \
		Doctrine/Hydrator/Exception.php \
		Doctrine/Hydrator/Graph.php \
		Doctrine/Hydrator/NoneDriver.php \
		Doctrine/Hydrator/RecordDriver.php \
		Doctrine/Hydrator/RecordHierarchyDriver.php \
		Doctrine/Hydrator/ScalarDriver.php \
		Doctrine/Hydrator/SingleScalarDriver.php \
		Doctrine/Hydrator.php \
		Doctrine/I18n/Exception.php \
		Doctrine/I18n.php \
		Doctrine/Import/Builder/Exception.php \
		Doctrine/Import/Builder.php \
		Doctrine/Import/Exception.php \
		Doctrine/Import/Mssql.php \
		Doctrine/Import/Mysql.php \
		Doctrine/Import/Oracle.php \
		Doctrine/Import/Pgsql.php \
		Doctrine/Import/Schema.php \
		Doctrine/Import/Sqlite.php \
		Doctrine/Import.php \
		Doctrine/Inflector.php \
		Doctrine/IntegrityMapper.php \
		Doctrine/Lib.php \
		Doctrine/Locator/Exception.php \
		Doctrine/Locator/Injectable.php \
		Doctrine/Locator.php \
		Doctrine/Locking/Exception.php \
		Doctrine/Locking/Manager/Pessimistic.php \
		Doctrine/Manager/Exception.php \
		Doctrine/Manager.php \
		Doctrine/Migration/Base.php \
		Doctrine/Migration/Builder.php \
		Doctrine/Migration/Diff.php \
		Doctrine/Migration/Exception.php \
		Doctrine/Migration/IrreversibleMigrationException.php \
		Doctrine/Migration/Process.php \
		Doctrine/Migration.php \
		Doctrine/Node/AdjacencyList/LevelOrderIterator.php \
		Doctrine/Node/AdjacencyList/PostOrderIterator.php \
		Doctrine/Node/AdjacencyList/PreOrderIterator.php \
		Doctrine/Node/AdjacencyList.php \
		Doctrine/Node/Exception.php \
		Doctrine/Node/Interface.php \
		Doctrine/Node/MaterializedPath/LevelOrderIterator.php \
		Doctrine/Node/MaterializedPath/PostOrderIterator.php \
		Doctrine/Node/MaterializedPath/PreOrderIterator.php \
		Doctrine/Node/MaterializedPath.php \
		Doctrine/Node/NestedSet/LevelOrderIterator.php \
		Doctrine/Node/NestedSet/PostOrderIterator.php \
		Doctrine/Node/NestedSet/PreOrderIterator.php \
		Doctrine/Node/NestedSet.php \
		Doctrine/Node.php \
		Doctrine/Null.php \
		Doctrine/Overloadable.php \
		Doctrine/Pager/Exception.php \
		Doctrine/Pager/Layout.php \
		Doctrine/Pager/Range/Jumping.php \
		Doctrine/Pager/Range/Sliding.php \
		Doctrine/Pager/Range.php \
		Doctrine/Pager.php \
		Doctrine/Parser/Exception.php \
		Doctrine/Parser/Json.php \
		Doctrine/Parser/Serialize.php \
		Doctrine/Parser/Xml.php \
		Doctrine/Parser/Yml.php \
		Doctrine/Parser/sfYaml/sfYaml.php \
		Doctrine/Parser/sfYaml/sfYamlDumper.php \
		Doctrine/Parser/sfYaml/sfYamlInline.php \
		Doctrine/Parser/sfYaml/sfYamlParser.php \
		Doctrine/Parser.php \
		Doctrine/Query/Abstract.php \
		Doctrine/Query/Check.php \
		Doctrine/Query/Condition.php \
		Doctrine/Query/Exception.php \
		Doctrine/Query/Filter/Chain.php \
		Doctrine/Query/Filter/Interface.php \
		Doctrine/Query/Filter.php \
		Doctrine/Query/Forupdate.php \
		Doctrine/Query/From.php \
		Doctrine/Query/Groupby.php \
		Doctrine/Query/Having.php \
		Doctrine/Query/JoinCondition.php \
		Doctrine/Query/Limit.php \
		Doctrine/Query/Offset.php \
		Doctrine/Query/Orderby.php \
		Doctrine/Query/Parser.php \
		Doctrine/Query/Part.php \
		Doctrine/Query/Registry/Exception.php \
		Doctrine/Query/Registry.php \
		Doctrine/Query/Select.php \
		Doctrine/Query/Set.php \
		Doctrine/Query/Tokenizer/Exception.php \
		Doctrine/Query/Tokenizer.php \
		Doctrine/Query/Where.php \
		Doctrine/Query.php \
		Doctrine/RawSql/Exception.php \
		Doctrine/RawSql.php \
		Doctrine/Record/Abstract.php \
		Doctrine/Record/Exception.php \
		Doctrine/Record/Filter/Compound.php \
		Doctrine/Record/Filter/Standard.php \
		Doctrine/Record/Filter.php \
		Doctrine/Record/Generator.php \
		Doctrine/Record/Iterator.php \
		Doctrine/Record/Listener/Chain.php \
		Doctrine/Record/Listener/Interface.php \
		Doctrine/Record/Listener.php \
		Doctrine/Record/State/Exception.php \
		Doctrine/Record/UnknownPropertyException.php \
		Doctrine/Record.php \
		Doctrine/Relation/Association/Self.php \
		Doctrine/Relation/Association.php \
		Doctrine/Relation/Exception.php \
		Doctrine/Relation/ForeignKey.php \
		Doctrine/Relation/LocalKey.php \
		Doctrine/Relation/Nest.php \
		Doctrine/Relation/Parser/Exception.php \
		Doctrine/Relation/Parser.php \
		Doctrine/Relation.php \
		Doctrine/Search/Analyzer/Exception.php \
		Doctrine/Search/Analyzer/Interface.php \
		Doctrine/Search/Analyzer/Standard.php \
		Doctrine/Search/Analyzer/Utf8.php \
		Doctrine/Search/Analyzer.php \
		Doctrine/Search/Exception.php \
		Doctrine/Search/File.php \
		Doctrine/Search/Indexer/Dir.php \
		Doctrine/Search/Indexer/Exception.php \
		Doctrine/Search/Indexer.php \
		Doctrine/Search/Listener.php \
		Doctrine/Search/Parser.php \
		Doctrine/Search/Query.php \
		Doctrine/Search/Record.php \
		Doctrine/Search.php \
		Doctrine/Sequence/Db2.php \
		Doctrine/Sequence/Exception.php \
		Doctrine/Sequence/Mssql.php \
		Doctrine/Sequence/Mysql.php \
		Doctrine/Sequence/Oracle.php \
		Doctrine/Sequence/Pgsql.php \
		Doctrine/Sequence/Sqlite.php \
		Doctrine/Sequence.php \
		Doctrine/Table/Exception.php \
		Doctrine/Table/Repository/Exception.php \
		Doctrine/Table/Repository.php \
		Doctrine/Table.php \
		Doctrine/Task/BuildAll.php \
		Doctrine/Task/BuildAllLoad.php \
		Doctrine/Task/BuildAllReload.php \
		Doctrine/Task/Compile.php \
		Doctrine/Task/CreateDb.php \
		Doctrine/Task/CreateTables.php \
		Doctrine/Task/Dql.php \
		Doctrine/Task/DropDb.php \
		Doctrine/Task/DumpData.php \
		Doctrine/Task/Exception.php \
		Doctrine/Task/GenerateMigration.php \
		Doctrine/Task/GenerateMigrationsDb.php \
		Doctrine/Task/GenerateMigrationsDiff.php \
		Doctrine/Task/GenerateMigrationsModels.php \
		Doctrine/Task/GenerateModelsDb.php \
		Doctrine/Task/GenerateModelsYaml.php \
		Doctrine/Task/GenerateSql.php \
		Doctrine/Task/GenerateYamlDb.php \
		Doctrine/Task/GenerateYamlModels.php \
		Doctrine/Task/LoadData.php \
		Doctrine/Task/Migrate.php \
		Doctrine/Task/RebuildDb.php \
		Doctrine/Task.php \
		Doctrine/Template/Geographical.php \
		Doctrine/Template/I18n.php \
		Doctrine/Template/Listener/Sluggable.php \
		Doctrine/Template/Listener/SoftDelete.php \
		Doctrine/Template/Listener/Timestampable.php \
		Doctrine/Template/NestedSet.php \
		Doctrine/Template/Searchable.php \
		Doctrine/Template/Sluggable.php \
		Doctrine/Template/SoftDelete.php \
		Doctrine/Template/Timestampable.php \
		Doctrine/Template/Versionable.php \
		Doctrine/Template.php \
		Doctrine/Transaction/Exception.php \
		Doctrine/Transaction/Mock.php \
		Doctrine/Transaction/Mssql.php \
		Doctrine/Transaction/Mysql.php \
		Doctrine/Transaction/Oracle.php \
		Doctrine/Transaction/Pgsql.php \
		Doctrine/Transaction/Sqlite.php \
		Doctrine/Transaction.php \
		Doctrine/Tree/AdjacencyList.php \
		Doctrine/Tree/Exception.php \
		Doctrine/Tree/Interface.php \
		Doctrine/Tree/MaterializedPath.php \
		Doctrine/Tree/NestedSet.php \
		Doctrine/Tree.php \
		Doctrine/Util.php \
		Doctrine/Validator/Country.php \
		Doctrine/Validator/Creditcard.php \
		Doctrine/Validator/Date.php \
		Doctrine/Validator/Driver.php \
		Doctrine/Validator/Email.php \
		Doctrine/Validator/ErrorStack.php \
		Doctrine/Validator/Exception.php \
		Doctrine/Validator/Future.php \
		Doctrine/Validator/Htmlcolor.php \
		Doctrine/Validator/Ip.php \
		Doctrine/Validator/Minlength.php \
		Doctrine/Validator/Nospace.php \
		Doctrine/Validator/Notblank.php \
		Doctrine/Validator/Notnull.php \
		Doctrine/Validator/Past.php \
		Doctrine/Validator/Range.php \
		Doctrine/Validator/Readonly.php \
		Doctrine/Validator/Regexp.php \
		Doctrine/Validator/Time.php \
		Doctrine/Validator/Timestamp.php \
		Doctrine/Validator/Unique.php \
		Doctrine/Validator/Unsigned.php \
		Doctrine/Validator/Usstate.php \
		Doctrine/Validator.php \
		Doctrine/View/Exception.php \
		Doctrine/View.php \
		Doctrine.php

.include "${PORTSDIR}/Mk/bsd.php.mk"
.include "${PORTSDIR}/devel/pear/bsd.pear.mk"
.include <bsd.port.mk>
