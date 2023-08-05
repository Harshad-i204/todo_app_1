import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_1/models/data.dart';

class NoteController extends GetxController {
  var data = <DataModel>[].obs;

  void add(DataModel n) {
    data.add(n);
  }
  @override
  void onInit() {
    List storedNotes =[];
    if(GetStorage().read<List>('data')!=null) {
      storedNotes = GetStorage().read<List>('data') as List;
    }
    if (storedNotes == null) {
      data = storedNotes.map((e) => DataModel.fromJson(e)).toList().obs;
    }
    ever(data, (_) {
      GetStorage().write('notes', data.toList());
    });
    super.onInit();
  }
}