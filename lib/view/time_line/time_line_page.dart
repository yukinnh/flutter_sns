import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sns_application/model/account.dart';
import 'package:sns_application/model/post.dart';

class TimeLinePage extends StatefulWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  @override
  State<TimeLinePage> createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  Account myAccount = Account(
    id: '1',
    name: 'Flutterラボ',
    selfIntroduction: 'こんばんは',
    userId: 'flutter_labo',
    imagePath:
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQAAAADFCAMAAACM/tznAAAAilBMVEX///9HxfsAVp4Atfg6wvuG1/yD1fwASZgzwfvC0uNJxvsAsvgAU50AUZyP2fx+1PsAt/io4f3r+f6d3vwPX6Pu9PkAW6ELpucATY4AQ3zl7fR40fy/6f2T2/ys4v3D6v0AoOTX4esFPnYASYgIn9wFOW0FM2QAUJMFLloEJk4Al9ITWZYARJbM2ugQzp+MAAAB5klEQVR4nO3aX0/aYBiH4dqi6xwOUZEx59xmFd2f7//1puKEwtuFA9KGPtd1RsLBc/8CJBCyDAAAAAAAAAAAAAAAAICdGx81uPrS9WmtOC8P0sqPXZ/Wisb+wXXXp7VCv379qf7on3/6I9CvX79+/fr169cfq3+sX79+/fr169ev/7X/sOvTWqFfv379Ufu/6tevX7/+//VfHzYY7fnf5Lbsvxo0KEddXb4bW/c3Pe2oq8t34yZ4f5aN0mn1sIYn9aG/IW7b/j1//y8k8kL1JwKD9W8khutfiwzYX8us9x+UxxH6VxZY6/9QDJIL9K3/bYGN/iK5QP/6Xxeoh730pxboY//LAsn+zQX62f+0QJnuX1+gr/1ZNl59cLzsry/Q3/6aWv/qAjH7lwtE7f+3QNz+xQKR+58XiN1fFPv+++eWzhryi+Lb965va8fZabp/OjwJvcB0mIdeYJo/CbzAdJ6HXmB6m+eBFzitZp/ytwU+d31bO1YXqH7czvPAC1R3yxfA8wLDYAtU96svgHgLVA93s/oAsRaoHu9rb4DFAnmYBX4+zubr+aEW+HWSyI+0wOTCAhawQNMClxaYdH1bOyxggcll+AUu3qX9jvLtePK+yZ+uTwMAAAAAAAAAAAAAAAAAYD/8BU9NKVsaHD77AAAAAElFTkSuQmCC',
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
  );

  List<Post> postList = [
    Post(
      id: '1',
      content: '初めまして',
      postAccountId: '1',
      createdTime: DateTime.now(),
    ),
    Post(
      id: '2',
      content: '初めまして2回目',
      postAccountId: '1',
      createdTime: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'タイムライン',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 2,
      ),
      body: ListView.builder(
        itemCount: postList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: index == 0
                  ? Border(
                      top: BorderSide(color: Colors.grey, width: 0),
                      bottom: BorderSide(color: Colors.grey, width: 0),
                    )
                  : Border(bottom: BorderSide(color: Colors.grey, width: 0)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  foregroundImage: NetworkImage(myAccount.imagePath),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  myAccount.name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '@${myAccount.userId}',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Text(DateFormat('M/d/yy')
                                .format(postList[index].createdTime!)),
                          ],
                        ),
                        Text(postList[index].content)
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
