import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 设置覆盖的平台，避免出现异常。
// 查看 https://flutter.dev/desktop#target-platform-override 获取更多信息。
void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

// 主函数
void main() {
  _enablePlatformOverrideForDesktop();
  runApp(MyApp());
}

// 主窗口类，继承 StatelessWidget
class MyApp extends StatelessWidget {
  // 这个部件是应用程序的根节点。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iTools', // 名字
      debugShowCheckedModeBanner: false, // 关闭debug标签
      theme: ThemeData(
        // 这个是你应用程序的主题。
        //
        // 尝试通过 "flutter run" 运行你的应用。你会看到应用有一个蓝色的工具条。
        // 不要关闭应用，尝试通过改变 primarySwatch 的值为 Colors.green ，
        // 然后调用 “热更新” (在你执行“flutter run”的控制窗口按下“r”或者在一个Flutter IDE中将保存改为“hot reload”)。
        // 注意：计数器没有重置为零，应用也没有重启。
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'iTools'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // 这个是应用的主页。它是有状态的，这意味着它有一个状态对象（下边定义的），
  // 其中包含影响外观的字段。

  // 这是一个定义状态的类。
  // 它包含父组件（本示例中的标题）提供的值（本例中的APP小部件），并被构建状态的方法使用。
  // 部件子类中的字段总被标记为“final”

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // 这个对 setState 的调用告诉框架当前状态改变，这将导致它重新运行构建方法，以便显示更新后的值。
      // 如果我们不通过 setState()直接修改 _counter 的值，然而框架的构建方法不会被调用，因此不会发生任何事情。
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 这个方法在每次调用 setState 时都会重新执行，例如上面的 _incrementCounter 方法。
    // 
    // Flutter框架在优化后，可以快速的重新运行构建方法，因此你可以在需要更新的时候随意构建，而不必单独改为小部件的实例。
    return Scaffold(
      appBar: AppBar(
        // 这里，我们从由App.build方法创建的MyHomePage对象中获取值，并使用它设置我们appbar的标题。
        title: Text(widget.title),
      ),
      body: Center(
        // Center 是一个布局部件。它接受一个单独的子元素，并将其放置在父元素的中间。
        child: Column(
          // Column 也是一个布局部件。
          // 它是一个子类列表垂直排列。
          // 默认，它的宽度适应子节点大小，高度和父节点一样高。
          //
          // 调用“debug painting”（控制台中按“p“，Android Studio中Flutter的”Toggle Debug Paint“，
          // 或者是VS Code中的"Toggle Debug Paint"命令）查看部件的线框
          //
          // Column 有各种属性来控制它的大小和定位子节点。
          // 这里我们使用的是mainAxisAlignment居中垂直的子节点；主轴是垂直线，因为Column是垂直的（横轴是水平的）。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '你已经点击按钮的次数:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
