import 'package:flutter/material.dart';
import 'package:localstorage/DB/Local_DB.dart';
import 'package:localstorage/add_note.dart';

class ViewNote extends StatefulWidget {
  ViewNote({super.key});

  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  List<Map<String, dynamic>> listNote = [];

  LocalDB db = LocalDB();

  void reloadData() async {
    final data = await db.getData();
    listNote = data;
    // refresh
    setState(() {});
  }

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    reloadData();
    return Scaffold(
      appBar: AppBar(
        title: Text("View Note"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => add()),
              );
            },
            icon: Icon(Icons.add, size: 40),
          ),
        ],
      ),
      body: (listNote.isEmpty)
          ? Center(child: Text("Note is Empty"))
          : ListView.builder(
              itemCount: listNote.length,
              itemBuilder: (context, index) {
                final id = listNote[index]['id'];
                return ListTile(
                  leading: Text("${listNote[index]['id']}"),
                  title: Text("${listNote[index]['title']}"),
                  subtitle:
                      Text("${listNote[index]['description']}"),
                  trailing: Container(
                    width: 100,
                    height: 50,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SimpleDialog(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            Text("Edit"),
                                            TextField(
                                              controller: title,
                                              decoration: InputDecoration(
                                                border:OutlineInputBorder(),
                                                hintText:listNote[index]['title'],
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                            TextField(
                                              controller: description,
                                              decoration: InputDecoration(
                                                border:OutlineInputBorder(),
                                                hintText: listNote[index]['description'],
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:MainAxisAlignment.end,
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Cancel"),
                                                ),
                                                SizedBox(width: 10),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    db.update(id,title.text,description.text,);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Edit"),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            db.delete(id);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

