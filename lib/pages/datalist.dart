import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_1/controller/datacontroller.dart';
import 'package:todo_app_1/pages/mynotes.dart';

class DataList extends StatelessWidget {
  const DataList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NoteController listData = Get.put(NoteController());
    Widget getDataList() {
      return Obx(
        () => listData.data.length == 0
            ? Center(
                child: Image.asset("assets/images/todo.png"),
              )
            : ListView.builder(
                itemCount: listData.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(listData.data[index].title!),
                    leading: Text((index + 1).toString() + "."),
                    trailing: Wrap(children: [
                      IconButton(
                          icon: const Icon(Icons.create),
                          onPressed: () => Get.to(MyNotes(index: index))),
                      IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                                title: "Delete Note",
                                middleText: listData.data[index].title!,
                                onCancel: () => Get.back(),
                                confirmTextColor: Colors.white,
                                onConfirm: () {
                                  listData.data.removeAt(index);
                                  Get.back();
                                });
                          },
                          icon: const Icon(Icons.delete))
                    ]),
                  );
                }),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Text("Todo App"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          onPressed: () {
            Get.to(MyNotes());
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: getDataList(),
        ),
      ),
    );
  }
}
