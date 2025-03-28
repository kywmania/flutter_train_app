# 🚆 Flutter Train Ticket Booking App

## 📌 프로젝트 소개
Flutter로 개발된 기차 예매 애플리케이션입니다. 사용자는 출발역과 도착역을 선택한 후, 좌석을 선택하여 예매할 수 있습니다.

## 🛠 기술 스택
- Flutter 3.x
- Dart
- Material Design
- Cupertino Design

## 📂 프로젝트 구조
```
/lib
│── main.dart              # 앱 실행 엔트리 포인트
│── home_page.dart         # 메인 화면 (출발역, 도착역 선택)
│── station_list_page.dart # 역 선택 화면
│── seat_page.dart         # 좌석 선택 화면
```

## 📜 주요 기능
### 1. 출발역 및 도착역 선택
- 사용자는 `HomePage`에서 출발역과 도착역을 선택할 수 있습니다.
- 선택된 역은 `StationListPage`에서 리스트로 표시되며, 출발역과 도착역이 동일한 경우 선택할 수 없습니다.

### 2. 좌석 선택
- `SeatPage`에서 사용자는 좌석을 선택할 수 있습니다.
- 선택된 좌석은 리스트에 저장되며, 예매 버튼 클릭 시 확인 창이 표시됩니다.

## 🏃‍♂️ 실행 방법
```sh
flutter pub get
flutter run
```
