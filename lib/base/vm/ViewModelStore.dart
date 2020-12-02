import 'VMHeader.dart';


class ViewModelStore {
  Map<String, ViewModel> _map = Map();

  void put<T extends ViewModel>(String key, T viewModel) {
    ViewModel oldViewModel = _map[key];
    if (oldViewModel != null) {
      oldViewModel.onCleared();
    }
    _map[key] = viewModel;
  }

  T get<T extends ViewModel>(String key) {
    return _map[key];
  }

  void clear() {
    for (ViewModel vm in _map.values) {
      vm.onCleared();
    }
    _map.clear();
  }
}
