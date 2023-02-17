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
    final Filter selectedFilter = context.read<Filter>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        _buildFilterButton(FilterType.all, selectedFilter),
        _buildFilterButton(FilterType.active, selectedFilter),
        _buildFilterButton(FilterType.completed, selectedFilter),
      ],
    );
  }

  Widget _buildFilterButton(FilterType filterType, Filter filter) {
    final FilterType currentFilterType = filter.state.filterType;

    return TextButton(
      onPressed: () {
        setState(() {
          filter.update(filterType);
        });
      },
      child: Text(
        _getFilterName(filterType),
        style: TextStyle(
          color: _isCurrentFilter(filterType, currentFilterType)
              ? Colors.blue
              : Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }

  bool _isCurrentFilter(FilterType filterType, FilterType currentFilterType) =>
      filterType == currentFilterType;

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
