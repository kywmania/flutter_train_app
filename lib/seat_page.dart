import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  const SeatPage({super.key, required this.startStation, required this.endStation});

  final String startStation;
  final String endStation;

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  final int seatNum = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
      ),
      body: Column(
        children: [
          route(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                selectedSeat(Colors.purple),
                SizedBox(width: 20,),
                selectedSeat(Colors.grey.shade300),
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
                        SizedBox(width: 50, height: 50,),
                        for(int i=1; i<=seatNum; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                            child: Container(
                              alignment: Alignment.center,
                              width: 50, height: 50,
                              child: Text('$i',
                                style: TextStyle(
                                  fontSize: 18
                                ),
                              ),
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
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: Center(
                  child: Text('예매 하기',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget route(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(widget.startStation,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          Icon(Icons.arrow_circle_right_outlined, size: 40,),
          Text(widget.endStation,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
        ],
    );
  }

  Widget selectedSeat(Color color){
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8)
          ),
        ),
        SizedBox(width: 4,),
        Text('선택됨'),
      ],
    );
  }

  Widget seat(String col) {
  return Column(
    children: [
      Container(
        alignment: Alignment.bottomCenter,
        width: 50, height: 50,
        child: Text(col,
          style: TextStyle(
            fontSize: 18,
          ),
        )
      ),
      Column(
        children: List.generate(
          seatNum,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
            child: Container(
              width: 50, height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
}
