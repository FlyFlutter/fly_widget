import 'package:flutter/material.dart';
import 'package:fly_widget/fly_widget.dart';

/// Row Builder
typedef RowBuilder = DataRow? Function(int index);

///
typedef OnFilter = void Function(FilterCondition condition);

///
class FlyTable extends StatelessWidget {
  ///
  const FlyTable({
    required this.columns,
    required this.rowBuilder,
    required this.count,
    required this.onFilter,
    super.key,
    this.header,
    this.enableSearch = true,
    this.availableRowsPerPage = const [10, 20, 50],
  });

  ///
  final Widget? header;

  ///
  final bool enableSearch;

  ///
  final List<DataColumn> columns;

  ///
  final List<int> availableRowsPerPage;

  /// 数据总行数
  final int count;

  ///
  final RowBuilder rowBuilder;

  ///
  final OnFilter onFilter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: header ?? const SizedBox()),
            if (enableSearch)
              FlySearch(
                onSearch: (value) {
                  onFilter.call(FilterCondition(searchText: value));
                },
              ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: PaginatedDataTable(
            columns: columns,
            onPageChanged: (value) {
              // 兼容真分页和假分页
              // if(widget.enablePagination) {
              //   _loadPaginationData(_searchedText, value);
              // }
            },
            // rowsPerPage: _rowsPerPage,
            // availableRowsPerPage: widget.availableRowsPerPage,
            source: FlyDataTableSource(
              rowBuilder: rowBuilder,
              count: count,
            ),
          ),
        )
      ],
    );
  }
}

///
class FlyDataTableSource extends DataTableSource {
  ///
  FlyDataTableSource({
    required this.count,
    required this.rowBuilder,
  });

  ///
  final int count;

  ///
  final RowBuilder rowBuilder;

  @override
  DataRow? getRow(int index) {
    return rowBuilder.call(index);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

///
class FilterCondition {
  ///
  FilterCondition({
    this.searchText,
  });

  ///
  final String? searchText;
}
