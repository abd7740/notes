import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databaseepath = await getDatabasesPath();
    String path = join(databaseepath, 'notedb.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 11, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {
    await db.execute("ALTER TABLE Table_mynote ADD COLUMN color TEXT");
    print('تم تحديث  البيانات بنجاح +++++ ++++ ++++++++++');
  }
//يمكن اضافة اكثر من جدول ضربة واحدة بستخدام الاتش

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
          CREATE TABLE Table_mynote (
          ID INTEGER PRIMARY KEY,
          address TEXT,
          date TEXT,
          Contents TEXT,
          comment TEXT)
        ''');
    await batch.commit();
    // await db.execute('''
    //       CREATE TABLE Table_mynote (
    //       ID INTEGER PRIMARY KEY,
    //       address TEXT,
    //       date TEXT,
    //       Contents TEXT,
    //       comment TEXT)
    //     ''');
    print('تم انشاء قاعدة البيانات بنجاح :::::');
  }

  selectDataKK(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertDataKK(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updatetDataKK(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteDataKK(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  deletemyDatabase() async {
    String databaseepath = await getDatabasesPath();
    String path = join(databaseepath, 'notedb.db');
    await deleteDatabase(path);
  }

  //----------
  select(String table) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.query(table);
    return response;
  }

  insert(String table, Map<String, Object?> values) async {
    Database? mydb = await db;
    int response = await mydb!.insert(table, values);
    return response;
  }

  updatet(String table, Map<String, Object?> values, String? mywhere) async {
    Database? mydb = await db;
    int response = await mydb!.update(table, values, where: mywhere);
    return response;
  }

  delete(String table, String? mywhere) async {
    Database? mydb = await db;
    int response = await mydb!.delete(table, where: mywhere);
    return response;
  }
}
