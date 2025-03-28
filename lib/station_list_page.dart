import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  const StationListPage({super.key, this.selectedStation = ''});

  final String selectedStation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: Text('출발역')),
      body: ListView(
        children: [
          station('수서', context),
          station('동탄', context),
          station('평택지제', context),
          station('천안아산', context),
          station('오송', context),
          station('대전', context),
          station('김천구미', context),
          station('동대구', context),
          station('경주', context),
          station('울산', context),
          station('부산', context),
        ],
      ),
    );
  }

  // 역 리스트 목록 UI
  Widget station(String station, BuildContext context) {
    // 역이 이미 선택돼 있다면 출력하지 않음
    if (station == selectedStation) {
      return SizedBox();
    }
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, station);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 50,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                station,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
