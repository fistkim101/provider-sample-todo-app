import 'package:equatable/equatable.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class SearchTermState extends Equatable {
  final String? searchTerm;

  const SearchTermState({
    required this.searchTerm,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [searchTerm ?? ''];

  SearchTermState copyWith(String searchTerm) {
    return SearchTermState(searchTerm: searchTerm);
  }
}

class SearchTerm extends StateNotifier<SearchTermState> {
  SearchTerm() : super(const SearchTermState(searchTerm: ''));

  void searchTermChange(String searchTerm) {
    state = SearchTermState(searchTerm: searchTerm);
  }
}

// class SearchTerm with ChangeNotifier {
//   late SearchTermState _state;
//   final String? initialSearchTerm;
//
//   SearchTermState get state => _state;
//
//   SearchTerm({
//     this.initialSearchTerm,
//   }) {
//     _state = SearchTermState(searchTerm: initialSearchTerm);
//   }
//
//   void update(String searchTerm) {
//     _state = _state.copyWith(searchTerm);
//     notifyListeners();
//   }
// }
