import 'package:flutter/material.dart';
import 'package:skillbox_fb_test/firebase_utls/analytics.dart';
import 'package:skillbox_fb_test/screens/user_card.dart';

/// Главный экран приложения
/// Функционал:
///
/// Главный экран
/// Аппбар
///   - Название приложения
///   - Кнопка разлогина текущего пользователя
/// Тело
///   - Карточка с краткой инфой пользоватея
///   - Список всех зарегистрированных пользователей
///
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("main screen"),
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {}),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return UserCard();
        },
        separatorBuilder: (context, index) {
          return Container(
            height: 1.4,
            color: Colors.grey[300],
          );
        },
        itemCount: 10,
      ),
    );
  }
}
