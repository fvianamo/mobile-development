import 'package:contacts_app/domain/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContactHelper{

  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;

  ContactHelper.internal();

  Database _db;

  Future<Database> get db async{
    if (_db == null)
      _db = await initDB();
    return _db;
  }

  Future<Database> initDB() async{
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "contacts.db");

    return await openDatabase(path, version: 1,
      onCreate: (Database db, int newerVersion) async {
        await db.execute(
          "CREATE TABLE ${Contact.contactTable}("
              "${Contact.idColumn} INTEGER PRIMARY KEY,"
              "${Contact.nameColumn} TEXT,"
              "${Contact.phoneColumn} TEXT,"
              "${Contact.emailColumn} TEXT,"
              "${Contact.imgColumn} TEXT)");
      });
  }

  Future<Contact> saveContact(Contact c) async{
    Database dbContact = await db;

    c.id = await dbContact.insert(Contact.contactTable, c.toMap());

    return c;
  }
}