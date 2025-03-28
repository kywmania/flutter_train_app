import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  const SeatPage({
    super.key,
    required this.startStation,
    required this.endStation,
  });

  final String startStation;
  final String endStation;

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  final int seatNum = 20; // 좌석 행의 개수
  // 좌석마다 false로 초기화
  late List<List<bool>> selectedSeat = List.generate(
    4,
    (row) => List.generate(seatNum, (col) => false),
  );
  // 선택한 좌석들을 저장하는 공간
  List<List<String>> selectedSeatList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('좌석 선택')),
      body: Column(
        children: [
          route(),
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                exSeat(Colors.purple),
                SizedBox(width: 20),
                exSeat(Theme.of(context).unselectedWidgetColor),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    seat('A'),
                    seat('B'),
                    Column(
                      children: [
                        SizedBox(width: 50, height: 50),
                        for (int i = 1; i <= seatNum; i++)
                          Padding(
                            // 좌석 UI에 행 번호 추가
                            padding: const EdgeInsets.symmetric(
                              horizontal: 2,
                              vertical: 4,
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              child: Text('$i', style: TextStyle(fontSize: 18)),
                            ),
                          ),
                      ],
                    ),
                    seat('C'),
                    seat('D'),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
            child: ElevatedButton(
              onPressed: () {
                for (int i = 0; i < selectedSeat.length; i++) {
                  for (int j = 0; j < selectedSeat[i].length; j++) {
                    if (selectedSeat[i][j] == true) {
                      setState(() {
                        //선택한 좌석 리스트에 [A, 1] 형태로 저장
                        selectedSeatList.add([
                          String.fromCharCode(i + 65),
                          '${j + 1}',
                        ]);
                      });
                    }
                  }
                }
                showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('예매 하시겠습니까?'),
                      // 선택한 좌석 목록 출력
                      content: Text('좌석 : $selectedSeatList'),
                      actions: [
                        CupertinoDialogAction(
                          child: Text(
                            '취소',
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          ),
                          onPressed: () {
                            // 선택한 좌석 목록 초기화
                            selectedSeatList.clear();
                            Navigator.pop(context);
                          },
                        ),
                        CupertinoDialogAction(
                          child: Text(
                            '확인',
                            style: TextStyle(fontSize: 18, color: Colors.blue),
                          ),
                          onPressed: () {
                            // 선택한 좌석 목록 초기화 => 나중에 기능이 추가된다면 초기화 하지 않고 데이터를 가공할 예정
                            selectedSeatList.clear();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: Center(
                  child: Text(
                    '예매 하기',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 경로를 보여주는 UI
  Widget route() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          widget.startStation,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        Icon(Icons.arrow_circle_right_outlined, size: 40),
        Text(
          widget.endStation,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
      ],
    );
  }

  // 선택한 좌석 예시를 보여주는 UI
  Widget exSeat(Color color) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(width: 4),
        Text('선택됨'),
      ],
    );
  }

  // 좌석 UI
  Widget seat(String col) {
    int i = col.codeUnitAt(0) - 65;

    return Column(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          width: 50,
          height: 50,
          child: Text(col, style: TextStyle(fontSize: 18)),
        ),
        Column(
          children: List.generate(
            seatNum,
            (j) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    //단일 좌석만 선택 가능하도록 변경 => 현재 여러 좌석을 예매할 수 있도록 변경
                    /*selectedSeat = List.generate(
                      4,
                      (row) => List.generate(seatNum, (col) => false),
                    );*/
                    selectedSeat[i][j] = !selectedSeat[i][j];
                  });
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color:
                        selectedSeat[i][j]
                            ? Colors.purple
                            : Theme.of(context).unselectedWidgetColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
