import 'package:flutter/material.dart';
import 'package:themovie_db/theme/app_button_style.dart';
//import 'package:themovie_db/widgets/main_screen/main_screen_widget.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to your account'),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

/*
Этот виджет по сути хранил ЛистВью (наш скролл)
и транслирует на экран иерархию других виджетов. 
*/
class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const myTextStyle = TextStyle(fontSize: 14, color: Colors.black);

    return Padding(
      //А это мы сделали отступы по краям для всего скролла
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: const [
          SizedBox(height: 25.0),
          Text(
            'You are automatically given an allegiance with anyone who is in the same clan as you. You can also become allies with other warriors by following each other or inviting new warriors to join.',
            style: myTextStyle,
          ),
          //SizedBox(height: 5.0),
          SomeButtons(),
          //SizedBox(height: 5.0),
          Text(
            'Чтобы посмотреть примененные стили, размеры и конечный результат верстки - в DevTools на вкладке Elements есть окно с подрубриками Styles/Computed/Layout/etc. В Computed все об выбранном элементе видно.',
            style: myTextStyle,
          ),
          SizedBox(height: 35.0),
          _FormWidget(),
        ],
      ),
    );
  }
}

/*
Это я вынес пару кноаок в отдельный виджет потому что так чище и понятнее
читать написанный код.
*/
class SomeButtons extends StatelessWidget {
  const SomeButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: AppButtonTextStyle.textStyle,
          onPressed: () {},
          child: const Text('Register'),
        ),
        const SizedBox(
          width: 40.0,
        ),
        TextButton(
          style: AppButtonTextStyle.textStyle,
          onPressed: () {},
          child: const Text('Verify Email'),
        ),
      ],
    );
  }
}

/*
Этот виджет хранит в себе следующее:
1. 
*/
class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  // ignore: avoid_init_to_null
  String? errorText = null;

  //--------------------------------------------------------------------------
  // Метод авторизации
  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
      //---------------------------------------------------
      Navigator.of(context).pushNamed('/main_screeen');
      //---------------------------------------------------
    } else {
      errorText = 'Error login or password';
    }

    setState(() {});
  }

  //--------------------------------------------------------------------------
  // Метод ресета пароля
  void _resetPassword() {
    debugPrint('reset paasword');
  }

  //--------------------------------------------------------------------------
  // Настройки стиля для текстовый полей, лучше бы их конечто перенесли.
  // Думаю потом так и сделаю.
  static const textFieldTextStyle =
      TextStyle(fontSize: 16, color: Colors.black);
  //--------------------------------------------------------------------------
  // А это стили для текстФилдов, с настройками их обводки, отступов и тд.
  static const textBorder = InputDecoration(
    border: OutlineInputBorder(),
    isCollapsed: true,
    contentPadding: EdgeInsets.all(10.0),
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
  );
  //--------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // К ранее созданной строке еррор, обращаемся чрез THIS.
    // для того что бы с ней получилось работать, особенности Dart!
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Тут мне очень понравился трюк с вложенными массивами
        // По сути это работет так - если мы поместили виджеты в ...[]
        // Тот который будет null, не показывается, но
        // Как только он обретает себя, мы его снова видим!
        if (errorText != null) ...[
          Text(
            errorText,
            style: const TextStyle(color: Colors.red, fontSize: 17),
          ),
          const SizedBox(height: 20.0),
        ],
        const Text(
          'Username:',
          style: textFieldTextStyle,
        ),
        TextField(
          controller: _loginTextController,
          decoration: textBorder,
        ),
        const SizedBox(height: 5.0),
        const Text(
          'Password:',
          style: textFieldTextStyle,
        ),
        TextField(
          controller: _passwordTextController,
          decoration: textBorder,
          obscureText: true,
        ),
        const SizedBox(height: 15.0),
        //=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- Buttons -=--==-=--=-=-=-=-=//
        Row(
          children: [
            ElevatedButton(
              style: AppButtonElevatedStyle.elevatedStyle,
              onPressed: () {
                _auth();
              },
              child: const Text('Login'),
            ),
            const SizedBox(
              width: 40.0,
            ),
            TextButton(
              style: AppButtonTextStyle.textStyle,
              onPressed: () {
                _resetPassword();
              },
              child: const Text('Reset Password'),
            ),
          ],
        ),
      ],
    );
  }
}
