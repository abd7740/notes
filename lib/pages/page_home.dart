import 'package:flutter/material.dart';
import 'package:note/pages/pag_bottomNavigationBar.dart';
import 'package:note/pages/pag_editnotes.dart';
import 'package:note/pages/page_appbar.dart';
import 'package:note/pages/page_drawer.dart';
import 'package:note/sqldb.dart';

class PageHome extends StatefulWidget {
  PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  SqlDb sqldb = SqlDb();
  bool isLoading = true;
  List<Map<String, dynamic>> notes = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<void> readData() async {
    List<Map<String, dynamic>> response = await sqldb.select('Table_mynote');
    setState(() {
      notes = response;
      isLoading = false;
    });
  }

  void deleteNote(int id) async {
    int result =
        await sqldb.deleteDataKK("DELETE FROM Table_mynote WHERE ID = $id");
    if (result > 0) {
      setState(() {
        notes.removeWhere((element) => element['ID'] == id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pageAppbar(),
      drawer: pageDrawer(),
      bottomNavigationBar: pageBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("addnotes");
        },
        child: Icon(Icons.add),
        tooltip: "إضافة ملاحظة",
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                await readData();
              },
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return Dismissible(
                    key: Key(note['ID'].toString()),
                    onDismissed: (direction) {
                      deleteNote(note['ID']);
                    },
                    background: Container(
                      color: Colors.red,
                      child: Icon(Icons.delete, color: Colors.white),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20.0),
                    ),
                    child: Card(
                      elevation: 2.0,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditNotes(
                                address: note['address'],
                                Contents: note['Contents'],
                                date: note['date'],
                                comment: note['comment'],
                                color: note['color'],
                                id: note['ID'],
                              ),
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        title: Text(note['address'],
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(note['Contents']),
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text(note['comment'],
                              style: TextStyle(color: Colors.white)),
                        ),
                        trailing: Icon(Icons.edit, color: Colors.blue),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
