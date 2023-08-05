import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_1/controller/datacontroller.dart';
import 'package:todo_app_1/models/data.dart';

class MyNotes extends StatelessWidget {
  int? index;

  MyNotes({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NoteController listdata = Get.find();
    String text = "";
    text = index == null ? "" : listdata.data[index!].title!;
    TextEditingController textEditingController =
        TextEditingController(text: text);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:
              index == null ? const Text('Create a new Notes') : const Text('Update Note'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextField(
                  autofocus: true,
                  textCapitalization: TextCapitalization.sentences,
                  controller: textEditingController,
                  decoration: InputDecoration(
                      hintText: "create a New Note",
                      labelText: "My Notes",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.green))),
                  style: const TextStyle(fontSize: 20),
                  maxLines: 10,
                  keyboardType: TextInputType.text,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.red),
                    )),
                ElevatedButton(
                  onPressed: () {
                    if (index == null) {
                      listdata.data
                          .add(DataModel(title: textEditingController.text));
                    } else {
                      var updatedata = listdata.data[index!];
                      updatedata.title = textEditingController.text;
                      listdata.data[index!] = updatedata;
                    }
                    Get.back();
                  },
                  child: index == null ? const Text("Add") : const Text("update"),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
