import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class SearchTermState extends Equatable {
  final String searchTerm;

  const SearchTermState({
    required this.searchTerm,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [searchTerm];

  SearchTermState copyWith(String searchTerm) {
    return SearchTermState(searchTerm: searchTerm);
  }
}

class SearchTerm with ChangeNotifier {
  late SearchTermState _state;
  final String initialSearchTerm;

  SearchTermState get state => _state;

  SearchTerm({
    required this.initialSearchTerm,
  }) {
    _state = SearchTermState(searchTerm: initialSearchTerm);
  }

  void update(String searchTerm) {
    _state = _state.copyWith(searchTerm);
    notifyListeners();
  }
}
