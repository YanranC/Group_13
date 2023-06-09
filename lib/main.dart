import 'dart:ffi';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

int merit = 0;

class _MyHomePageState extends State<MyHomePage> {
  String backgroundImage = 'web/assets/temple.png';

void changeBackgroundImage() {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('确认充值'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('是否确定充值68元更换西天极乐世界背景装饰？'),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.network(
                'https://raw.githubusercontent.com/LittlePrince404/my_dataserver/main/YunfengVCode.png',
                width: 300,
                height: 300,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                backgroundImage = 'web/assets/pureland.png';
              });
              Navigator.of(context).pop();
            },
            child: Text('是'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('否'),
          ),
        ],
      );
    },
  );
}


  void incrementMerit() {
    setState(() {
      merit += 1;
    });
  }

  void updateMerit(int newMerit) {
    setState(() {
      merit = newMerit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '日行一善，日积一德；功满三千，德满八百',
          style: TextStyle(
            fontFamily: 'STXingkai',
            fontSize: 35.0,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 100,
              child: Text(
                '功德: $merit',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 22),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 83, 131, 219),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Center(
                            child: Text(
                              '首充6元\n更换佛祖皮肤',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 231, 61, 61),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondPage()),
                        );
                      },
                      child: Text('去更换！'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Center(
                            child: Text(
                              '充值999元\n获得神仙保佑',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ThirdPage()),
                        );
                      },
                      child: Text('去获取！'),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Center(
                            child: Text(
                              '邀请五名好友注册\n免费领取十八金身罗汉，功德×1.25',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FourthPage(onMeritUpdate: updateMerit)),
                        );
                      },
                      child: Text('去邀请！'),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Center(
                            child: Text(
                              '充值68元更换\n西天极乐世界背景装饰',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        changeBackgroundImage(); // 更换背景图像
                      },
                      child: Text('去更换！'),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Center(
                            child: Text(
                              '一元求姻缘\n速速点我',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FifthPage()),
                        );
                      },
                      child: Text('去求缘！'),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 93, 182, 93),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Center(
                            child: Text(
                              '今日特价\n期末周大学生专享考试加分福利！',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 245, 239, 239),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SixthPage()),
                        );
                      },
                      child: Text('去加分！'),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                incrementMerit(); // 点击增加功德
              },
              child: Image.asset(
                'web/assets/R.png',
                width: 200,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool _isCompleted = false;

  void _handleButtonPressed() {
    setState(() {
      _isCompleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('仅需6元，为佛祖更换皮肤！'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('web/assets/vCode.png'),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _isCompleted
                      ? Image.asset('web/assets/buddha1.png')
                      : Image.asset('web/assets/buddha2.png'),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleButtonPressed,
              child: Text('我已完成充值'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  bool _isCompleted = false;

  void _handleButtonPressed() {
    setState(() {
      _isCompleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('充值999元，获得神仙保佑！'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '充值999元，获得神仙保佑！',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(
                      '您已被神仙全方面保佑！',
                      style: TextStyle(fontSize: 24),
                    ),
                  );
                },
              );
            },
            child: Text('充值'),
          ),
        ],
      ),
    );
  }
}

class FourthPage extends StatefulWidget {
  @override
  final ValueSetter<int> onMeritUpdate; // 新增一个 ValueSetter 属性

  FourthPage({required this.onMeritUpdate}); // 接收 onMeritUpdate 参数

  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {

  void updateMerit() {
    if (_allFriendsSelected) {
      int newMerit = (merit * 1.25).round();
      widget.onMeritUpdate(newMerit); // 调用 onMeritUpdate 方法，将新的 merit 值回传给主界面
    }
  }

  bool _friend1Selected = false;
  bool _friend2Selected = false;
  bool _friend3Selected = false;
  bool _friend4Selected = false;
  bool _friend5Selected = false;

  bool get _allFriendsSelected =>
      _friend1Selected &&
      _friend2Selected &&
      _friend3Selected &&
      _friend4Selected &&
      _friend5Selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('邀请五名好友注册免费领取十八金身罗汉，功德×1.25！'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '点击以下好友按钮即可邀请，成功邀请五名好友可免费领取十八金身罗汉，功德×1.25！',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FriendButton(
                isSelected: _friend1Selected,
                onPressed: () {
                  setState(() {
                    _friend1Selected = !_friend1Selected;
                  });
                  updateMerit();
                },
                friendName: '好友1',
              ),
              SizedBox(width: 10),
              FriendButton(
                isSelected: _friend2Selected,
                onPressed: () {
                  setState(() {
                    _friend2Selected = !_friend2Selected;
                  });
                  updateMerit();
                },
                friendName: '好友2',
              ),
              SizedBox(width: 10),
              FriendButton(
                isSelected: _friend3Selected,
                onPressed: () {
                  setState(() {
                    _friend3Selected = !_friend3Selected;
                  });
                  updateMerit();
                },
                friendName: '好友3',
              ),
              SizedBox(width: 10),
              FriendButton(
                isSelected: _friend4Selected,
                onPressed: () {
                  setState(() {
                    _friend4Selected = !_friend4Selected;
                  });
                  updateMerit();
                },
                friendName: '好友4',
              ),
              SizedBox(width: 10),
              FriendButton(
                isSelected: _friend5Selected,
                onPressed: () {
                  setState(() {
                    _friend5Selected = !_friend5Selected;
                  });
                  updateMerit();
                },
                friendName: '好友5',
              ),
            ],
          ),
          SizedBox(height: 20),
          if (_allFriendsSelected)
            Column(
              children: [
                Text(
                  '恭喜您成功邀请5位好友，获得十八金身罗汉，功德×1.25！',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'web/assets/eighteenarhats.png',
                  width: 800,
                  height: 500,
                ),
                Text(
                  '功德: $merit',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class FriendButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onPressed;
  final String friendName;

  const FriendButton({
    required this.isSelected,
    required this.onPressed,
    required this.friendName,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(friendName),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (isSelected) {
              return Colors.green;
            }
            return Colors.grey; // Use default button color
          },
        ),
      ),
    );
  }
}

class FifthPage extends StatefulWidget {
  @override
  _FifthPageState createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  final _controller = TextEditingController();
  String _displayText = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('一元求姻缘'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image.asset(
                'web/assets/yinyuan.webp',
                width: 300,
                height: 300,
              ),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: '施主，请输入您的姓名...',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    String name = _controller.text.trim();
                    if (name.isNotEmpty) {
                      _displayText = '$name，恭喜您获得了一份价值一元的红娘服务，请等待爱情来敲门！';
                    } else {
                      _displayText = '施主您真的叫这个名字吗';
                    }
                  });
                },
                child: Text('挂红绳'),
              ),
            ),
            SizedBox(height: 16),
            Text(
              _displayText,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class SixthPage extends StatefulWidget {
  @override
  _SixthPageState createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('web/assets/test.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '您已加 $_counter 分',
                style: TextStyle(
                  color: Color.fromARGB(255, 244, 5, 5),
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Text('点击涨分'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
