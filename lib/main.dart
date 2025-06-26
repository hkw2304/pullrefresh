import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:pulltorefresh_2/data/employeeModel.dart';
import 'package:pulltorefresh_2/data/source/base/employeeDataBase.dart';

import 'data/source/EmployeeDataSource.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


/*
  Key를 주는 이유
  플러터에서는 기본적으로 요소를 재사용하도록 설계가 되어있어 같은 키값이면 동일한 요소를 사용한다는 것
*/

// final GlobalKey<SfDataGridState> key = GlobalKey<SfDataGridState>();

class _MyAppState extends State<MyApp> {

  List<EmployeeModel> employList = <EmployeeModel>[];

  final EmployeeDataBase _employeeDataBase = EmployeeDataBase();
  final EmployeeDataSource employeeDataSource = EmployeeDataSource(employList);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    employList = _employeeDataBase.getEmployeeData();
    print('employList  master >> ${employList}');
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
