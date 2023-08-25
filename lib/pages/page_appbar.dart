import 'package:flutter/material.dart';

class pageAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('ملاحضاتي'),
      actions: [
        IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {
            // اتخذ إجراءً عند النقر على أيقونة المفضلة
          },
        ),
        IconButton(
          icon: Icon(Icons.notifications_active),
          onPressed: () {
            // اتخذ إجراءً عند النقر على أيقونة اشعتراك التطبيق
          },
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // اضافة الاكشن المطلوب عند النقر على زر البحث
          },
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            // اضافة الاكشن المطلوب عند النقر على زر الإضافة
          },
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            // اضافة الاكشن المطلوب عند النقر على زر المزيد
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
