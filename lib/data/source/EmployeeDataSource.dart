import 'package:pulltorefresh_2/data/employeeModel.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';

class EmployeeDataSource extends DataGridSource {

  List<DataGridRow> dataGridRows = [];

  EmployeeDataSource(List<EmployeeModel> employList);


  List<DataGridRow> get rows => dataGridRows;

  // 그리드 셀의 스타일 정의
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Container(
              alignment: (dataGridCell.columnName == 'id' ||
                  dataGridCell.columnName == 'salary')
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                dataGridCell.value.toString(),
                overflow: TextOverflow.ellipsis,
              ));
        }).toList());
  }
  
  //그리드 셀의 이름을 정의하고 값을 대입
  void buildDataGridRows() {
    dataGridRows = _employees
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
      DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
      DataGridCell<String>(
          columnName: 'designation', value: dataGridRow.designation),
      DataGridCell<int>(
          columnName: 'salary', value: dataGridRow.salary),
    ]))
        .toList();
  }
  
}