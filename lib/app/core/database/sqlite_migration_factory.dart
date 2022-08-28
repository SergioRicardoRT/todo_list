import 'package:todo_list_provider/app/core/database/migrations/migration_V2.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration_v1.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration_v3.dart';

import 'migrations/migration.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigration() => [
        MigrationV1(),
        MigrationV2(),
        MigrationV3(),
      ];

  List<Migration> getUpgradeMigration(int version) {
    final migrations = <Migration>[];

    // atual 3
    // version 1
    if (version == 1) {
      migrations.add(MigrationV2());
      migrations.add(MigrationV3());
    }
    // versao 2
    if (version == 2) {
      migrations.add(MigrationV3());
    }
    return migrations;
  }
}
