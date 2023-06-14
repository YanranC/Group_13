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
            SizedBox(height: 20),
            Center(
              child: Image.asset(
                'web/assets/vCode.png',
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('日行一善，日积一德；功满三千，德满八百'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
                child: Text('首充6元更换佛祖皮肤'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdPage()),
                  );
                },
                child: Text('充值999元获得神仙保佑'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  changeBackgroundImage(); // 更换背景图像
                },
                child: Text('充值68元更换西天极乐世界背景装饰'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForthPage()),
                  );
                },
                child: Text('邀请五名好友注册免费领取十八金身罗汉，功德×1.25'),
              ),
            ],
          ),
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

class ForthPage extends StatefulWidget {
  @override
  _ForthPageState createState() => _ForthPageState();
}

class _ForthPageState extends State<ForthPage> {
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
                },
                friendName: '好友1',
              ),
              SizedBox(width: 10), // 添加按钮之间的间距
              FriendButton(
                isSelected: _friend2Selected,
                onPressed: () {
                  setState(() {
                    _friend2Selected = !_friend2Selected;
                  });
                },
                friendName: '好友2',
              ),
              SizedBox(width: 10), // 添加按钮之间的间距
              FriendButton(
                isSelected: _friend3Selected,
                onPressed: () {
                  setState(() {
                    _friend3Selected = !_friend3Selected;
                  });
                },
                friendName: '好友3',
              ),
              SizedBox(width: 10), // 添加按钮之间的间距
              FriendButton(
                isSelected: _friend4Selected,
                onPressed: () {
                  setState(() {
                    _friend4Selected = !_friend4Selected;
                  });
                },
                friendName: '好友4',
              ),
              SizedBox(width: 10), // 添加按钮之间的间距
              FriendButton(
                isSelected: _friend5Selected,
                onPressed: () {
                  setState(() {
                    _friend5Selected = !_friend5Selected;
                  });
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
