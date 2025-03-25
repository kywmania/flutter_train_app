import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  const StationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('출발역'),
      ),
      body: ListView(
        children: [
          station('수서'),
          station('동탄'),
          station('평택지제'),
          station('천안아산'),
          station('오송'),
          station('대전'),
          station('김천구미'),
          station('동대구'),
          station('경주'),
          station('울산'),
          station('부산'),
        ],
      ),
    );
  }

  Widget station(String station){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(
              color: Colors.grey.shade300,
            )),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20,),
            child: Text(
              station,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}