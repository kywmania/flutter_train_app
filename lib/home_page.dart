import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat_page.dart';
import 'package:flutter_train_app/station_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 출발역과 도착역을 나타내는 변수 (초기값: '선택')
  String startStation = '선택';
  String endStation = '선택';
  String? selectedStation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: Text('기차 예매')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 출발역과 도착역을 선택하는 UI
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  selectStation('start', context),
                  Container(width: 2, height: 50, color: Colors.grey[400]),
                  selectStation('end', context),
                ],
              ),
            ),
            SizedBox(height: 20),
            // 좌석 선택 버튼
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // 출발역과 도착역이 선택된 경우에만 좌석 선택 화면으로 이동
                  if (startStation != '선택' && endStation != '선택') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SeatPage(
                          startStation: startStation,
                          endStation: endStation,
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  '좌석 선택',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  // 출발역 및 도착역 선택 위젯
  Widget selectStation(String stationType, BuildContext context) {
    final String station = stationType == 'start' ? startStation : endStation;
    return GestureDetector(
      onTap: () async {
        // 역 선택 페이지로 이동하여 선택된 역을 받아옴
        selectedStation = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StationListPage(
              selectedStation: stationType == 'start' ? endStation : startStation,
            ),
          ),
        );
        
        if (selectedStation == null) {
          return;
        }

        // 선택된 역을 상태에 반영
        setState(() {
          if (stationType == 'start') {
            startStation = selectedStation!;
          }
          if (stationType == 'end') {
            endStation = selectedStation!;
          }
        });
      },
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              stationType == 'start' ? '출발역' : '도착역',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              station,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
