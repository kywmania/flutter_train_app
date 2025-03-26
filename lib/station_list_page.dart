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

  Widget station(String station, BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Column(
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
      ),
    );
  }
}