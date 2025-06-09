import 'package:path/path.dart';
import 'package:shopping_app_solid_architecture/data/models/product_model.dart';
import 'package:sqflite/sqflite.dart';

class ProductLocalDb {
  static Database? _db;

  Future<Database> get db async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'products.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
CREATE TABLE products(
id INTEGER PRIMARY KEY,
title TEXT,
price REAL
)
''');
      },
    );
  }

  Future<void> insertProducts(List<ProductModel> products) async {
    final database = await db;
    for (var product in products) {
      await database.insert(
        'products',
        product.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<ProductModel>> getProducts() async {
    final database = await db;
    final List<Map<String, dynamic>> maps = await database.query('products');
    return List.generate(maps.length, (i) {
      return ProductModel.fromJson(maps[i]);
    });
  }
}
