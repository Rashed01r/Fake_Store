import 'package:bloc1/data/models.dart';
import 'package:bloc1/data/webService.dart';

class Repository {
  final WebService webService;

  Repository({required this.webService});

  Future<List<Producte>> getDataModels() async {
    final models = await webService.getDataModels();
    return models!.map((producte) => Producte.fromJson(producte)).toList();
  }
}
