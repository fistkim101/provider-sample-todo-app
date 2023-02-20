import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

import '../enums/enums.dart';

class FilterState extends Equatable {
  final FilterType filterType;

  const FilterState({
    required this.filterType,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [filterType];

  FilterState copyWith(FilterType filterType) {
    return FilterState(filterType: filterType);
  }
}

class Filter extends StateNotifier<FilterState> {
  Filter() : super(const FilterState(filterType: FilterType.all));

  void changeFilter(FilterType filterType) {
    state = FilterState(filterType: filterType);
  }
}

// class Filter with ChangeNotifier {
//   late FilterState _state;
//   final FilterType initialFilterType;
//
//   FilterState get state => _state;
//
//   Filter({required this.initialFilterType}) {
//     _state = FilterState(filterType: initialFilterType);
//   }
//
//   void update(FilterType filterType) {
//     _state = _state.copyWith(filterType);
//     notifyListeners();
//   }
// }
