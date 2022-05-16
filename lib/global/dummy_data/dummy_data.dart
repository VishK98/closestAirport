final testItems = [
  'Weather Minimums',
  'Standard Terminal Arrivals',
  'Instrument Approach',
  'Weather Minimums',
  'Standard Terminal Arrivals',
  'Instrument Approach'
];


class TestData{
  final String key;
  final String value;
  TestData({required this.key, required this.value});
}
final operationData = [
  TestData(key: 'Airport Use', value: 'Open to the Public'),
  TestData(key: 'Activation Data', value: '11/1939'),
  TestData(key: 'Status', value: '0'),
  TestData(key: 'Control Tower', value: 'Yes'),
  TestData(key: 'Seg Circle', value: 'No'),
  TestData(key: 'Beacon', value: 'CG'),
  TestData(key: 'Wind Indicator', value: 'Yes'),
  TestData(key: 'A.R.T.C.', value: 'New York'),
  TestData(key: 'F.S.S', value: 'ISP'),
  TestData(key: 'NOTAMs Facility', value: 'EWRY'),
  TestData(key: 'Sectional Chart', value: 'New York'),
  TestData(key: 'Landing Fee', value: 'Y'),
  TestData(key: 'Customs', value: 'No'),
  TestData(key: 'Attendance', value: 'All/All/All'),
];

class TestData_2{
  final String key;
  final String value;
  TestData_2({required this.key, required this.value});
}
final airportData = [
  TestData_2(key: 'ASOS', value: 'Tel:973-621-2892'),
  TestData_2(key: 'CTAF/UNICOM', value: '122.950'),
  TestData_2(key: 'D-Atis', value: '115.7:ARR(973-824-4417)'),
  TestData_2(key: 'D-Atis', value: '134.825(973-824-4417)'),
  TestData_2(key: 'Newark Tower (SEC)', value: '134.05'),
];

class TestData_3{
  final String key;
  final String value;
  TestData_3({required this.key, required this.value});
}
final runwayData = [
  TestData_3(key: 'Airport Use', value: 'Open to the Public'),
  TestData_3(key: 'Activation Data', value: '11/1939'),
  TestData_3(key: 'Status', value: '0'),
  TestData_3(key: 'Control Tower', value: 'Yes'),
  TestData_3(key: 'Seg Circle', value: 'No'),
];

class TestData_4{
  final String key;
  final String value;
  TestData_4({required this.key, required this.value});
}
final runwayData_2 = [
  TestData_4(key: 'CTAF/UNICOM', value: 'Tel:973-621-2892'),
  TestData_4(key: 'ASOS', value: '122.950'),
  TestData_4(key: 'D-Atis', value: '115.7:ARR(973-824-4417)'),
  TestData_4(key: 'D-Atis', value: '134.825(973-824-4417)'),
  TestData_4(key: 'Newark Tower (SEC)', value: '134.05'),
];