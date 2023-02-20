import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../enums/enums.dart';
import '../providers/providers.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    final FilterType selectedFilterType =
        context.read<FilterState>().filterType;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        _buildFilterButton(context, FilterType.all, selectedFilterType),
        _buildFilterButton(context, FilterType.active, selectedFilterType),
        _buildFilterButton(context, FilterType.completed, selectedFilterType),
      ],
    );
  }

  Widget _buildFilterButton(BuildContext context,
      FilterType buildTargetFilterType, FilterType selectedFilterType) {
    final Filter filter = context.read<Filter>();

    return TextButton(
      onPressed: () {
        setState(() {
          filter.changeFilter(buildTargetFilterType);
        });
      },
      child: Text(
        _getFilterName(buildTargetFilterType),
        style: TextStyle(
          color: _isCurrentFilter(buildTargetFilterType, selectedFilterType)
              ? Colors.blue
              : Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }

  bool _isCurrentFilter(FilterType filterType, FilterType selectedFilterType) =>
      filterType == selectedFilterType;

  String _getFilterName(FilterType filterType) {
    if (filterType == FilterType.all) {
      return 'All';
    }
    if (filterType == FilterType.active) {
      return 'Active';
    }
    if (filterType == FilterType.completed) {
      return 'Completed';
    }

    return '';
  }
}
