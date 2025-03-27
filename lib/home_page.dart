import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat_page.dart';
import 'package:flutter_train_app/station_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  if (startStation != '선택' && endStation != '선택') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => SeatPage(
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

  Widget selectStation(String stationType, BuildContext context) {
    final String station = stationType == 'start' ? startStation : endStation;
    return GestureDetector(
      onTap: () async {
        //print('${stationType == "start"} endstation: $endStation startstation: $startStation');
        selectedStation = await Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => StationListPage(
                  selectedStation:
                      stationType == 'start' ? endStation : startStation,
                ),
          ),
        );
        //print('selectedStation: $selectedStation');
        if (selectedStation == null) {
          return;
        }
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
