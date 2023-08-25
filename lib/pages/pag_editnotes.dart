import 'package:flutter/material.dart';
import 'package:note/pages/page_home.dart';
import 'package:note/SqlDb.dart';

class EditNotes extends StatefulWidget {
  final id;
  final address;
  final date;
  final Contents;
  final comment;
  final color;

  EditNotes({
    Key? key,
    this.address,
    this.date,
    this.Contents,
    this.comment,
    this.color,
    this.id,
  }) : super(key: key);

  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  sqlDb sqlDbthes = sqlDb();

  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController address = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController Contents = TextEditingController();
  TextEditingController comment = TextEditingController();
  TextEditingController color = TextEditingController();

  @override
  void initState() {
    address.text = widget.address ?? '';
    date.text = widget.date ?? '';
    Contents.text = widget.Contents ?? '';
    comment.text = widget.comment ?? '';
    color.text = widget.color ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Notes"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(children: [
          Form(
              key: formstate,
              child: Column(
                children: [
                  TextFormField(
                    controller: address,
                    decoration: InputDecoration(hintText: "عنوان الملاحظة"),
                  ),
                  TextFormField(
                    controller: date,
                    decoration: InputDecoration(hintText: "تاريخ "),
                  ),
                  TextFormField(
                    controller: Contents,
                    decoration:
                        InputDecoration(hintText: "ادخل هما المحتوى ملاحضاتك"),
                  ),
                  TextFormField(
                    controller: comment,
                    decoration: InputDecoration(hintText: "ملاحظة"),
                  ),
                  TextFormField(
                    controller: color,
                    decoration: InputDecoration(hintText: "الون "),
                  ),
                  Container(height: 20),
                  MaterialButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () async {
                      int r = await sqlDbthes.updatetDataKK('''  
                      UPDATE Table_mynote
                            SET 
                       address = '${address.text}',
                       date = '${date.text}',
                       Contents = '${Contents.text}',
                       comment = '${comment.text}'
                       WHERE ID = '${widget.id}' ;
                       ''');
                      if (r > 0) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => PageHome()),
                            (route) => false);
                      }
                    },
                    child: Text("تعديل"),
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
