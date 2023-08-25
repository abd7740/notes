import 'package:flutter/material.dart';

class pageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 36, // تحديد حجم الدائرة
                  backgroundImage: AssetImage(
                      'images/your_image.png'), // استبدل 'your_image.png' بمسار الصورة الخاصة بك
                ),
                SizedBox(height: 16),
                Text(
                  'اهلا ! تطبيق ملاحظاتي',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('القائمة الرئيسية'),
            onTap: () {
              // اتخذ إجراءً عند النقر على القائمة الرئيسية
              Navigator.pop(context); // إغلاق القائمة الجانبية
              // تنفيذ السلوك المطلوب للقائمة الرئيسية
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('الإعدادات'),
            onTap: () {
              // اتخذ إجراءً عند النقر على الإعدادات
              Navigator.pop(context); // إغلاق القائمة الجانبية
              // تنفيذ السلوك المطلوب للإعدادات
            },
          ),
          ListTile(
            leading: Icon(Icons.backup),
            title: Text('نسخ احتياطي'),
            onTap: () {
              // اتخذ إجراءً عند النقر على نسخ احتياطي
              Navigator.pop(context); // إغلاق القائمة الجانبية
              // تنفيذ السلوك المطلوب لنسخ الاحتياطي
            },
          ),
          ListTile(
            leading: Icon(Icons.restore),
            title: Text('استعادة النسخ الاحتياطي'),
            onTap: () {
              // اتخذ إجراءً عند النقر على استعادة النسخ الاحتياطي
              Navigator.pop(context); // إغلاق القائمة الجانبية
              // تنفيذ السلوك المطلوب لاستعادة النسخ الاحتياطي
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('حول البرنامج'),
            onTap: () {
              // اتخذ إجراءً عند النقر على حول البرنامج
              Navigator.pop(context); // إغلاق القائمة الجانبية
              // تنفيذ السلوك المطلوب لحول البرنامج
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('مشاركة التطبيق'),
            onTap: () {
              // اتخذ إجراءً عند النقر على مشاركة التطبيق
              Navigator.pop(context); // إغلاق القائمة الجانبية
              // تنفيذ السلوك المطلوب لمشاركة التطبيق
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('خروج'),
            onTap: () {
              // اتخذ إجراءً عند النقر على خروج
              Navigator.pop(context); // إغلاق القائمة الجانبية
              // تنفيذ السلوك المطلوب للخروج
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('من نحن'),
            onTap: () {
              // اتخذ إجراءً عند النقر على "من نحن"
              Navigator.pop(context); // إغلاق القائمة الجانبية
              // تنفيذ السلوك المطلوب لـ "من نحن"
            },
          ),
        ],
      ),
    );
  }
}
