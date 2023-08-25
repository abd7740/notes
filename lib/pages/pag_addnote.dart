import 'package:flutter/material.dart';
import 'package:note/SqlDb.dart';
import 'package:note/pages/page_home.dart';

class Addnotes extends StatefulWidget {
  const Addnotes({super.key});

  @override
  State<Addnotes> createState() => _AddnotesState();
}

class _AddnotesState extends State<Addnotes> {
  sqlDb sqldbthes = sqlDb();

  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController address = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController Contents = TextEditingController();
  TextEditingController comment = TextEditingController();
  TextEditingController color = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Notes"),
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
                      //int r = await sqldbthes.insertDataKK('''
                      //INSERT INTO Table_mynote (address, date, Contents, comment)
                      // VALUES
                      //('${address.text}','${date.text}','${Contents.text}','${comment.text}');
                      //  ''');
                      int r = await sqldbthes.insert("Table_mynote", {
                        "address": address.text,
                        "date": date.text,
                        "Contents": Contents.text,
                        "comment": comment.text,
                      });
                      if (r > 0) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => PageHome()),
                            (route) => false);
                      }
                    },
                    child: Text("اضافة"),
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
