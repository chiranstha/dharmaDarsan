import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../Models/MantraModel.dart';
import '../config.dart';
import '../dio.dart';

class MantraRepository {
  Future<List<MantraModel>> getMantra() async {
    const url = "/api/services/app/Android/GetAllMantra";
try{
    final response = await Api().get(
      MyConfig.appUrl + url,
    );
  
      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"];

      return data.map((data) => MantraModel.fromJson(data)).toList();
 
  }
  catch(e){
      return [];
  }
  }
}

final mantraProvider = Provider<MantraRepository>((ref) => MantraRepository());

final mantradataProvider = FutureProvider<List<MantraModel>>((ref) async {
  final mantra = ref.watch(mantraProvider);
  final mantraData = await mantra.getMantra();
  return mantraData;
});
