import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  selectStation('출발역', '선택'),
                  Container(
                    width: 2,
                    height: 50,
                    color: Colors.grey[400],
                  ),
                  selectStation('도착역', '선택'),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: (){},
                child: Text('좌석 선택',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
  
  Widget selectStation(String route, String station){
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(route,
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
    );
  }
}