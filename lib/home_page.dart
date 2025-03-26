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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('기차 예매'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  selectStation('start', startStation, context),
                  Container(
                    width: 2,
                    height: 50,
                    color: Colors.grey[400],
                  ),
                  selectStation('end', endStation, context),
                ],
              ),
            ),
            SizedBox(height: 20,),
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
                onPressed: (){
                  if(startStation != '선택' && endStation != '선택'){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                      SeatPage(startStation: startStation,
                                endStation: endStation,),
                    ),
                  );}
                },
                child: Text('좌석 선택',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }

  Widget selectStation(String stationType, String station, BuildContext context){
    return GestureDetector(
      onTap: () async {
        String? selectedStation = await Navigator.push(context, 
          MaterialPageRoute(builder: (context) =>
            StationListPage(),
          ),
        );

        setState(() {
          station = selectedStation ?? '선택';
          if(stationType == 'start'){startStation = station;}
          if(stationType == 'end'){endStation = station;}
        });
      },
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(stationType == 'start' ? '출발역' : '도착역',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey
              ),
            ),
            Text(station,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}