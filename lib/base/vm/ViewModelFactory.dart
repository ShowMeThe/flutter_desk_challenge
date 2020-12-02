import 'VMHeader.dart';


class ViewModelFactory {
  ViewModelFactory._privateConstructor();

  static final ViewModelFactory _instance =
      ViewModelFactory._privateConstructor();

  static ViewModelFactory get instance {
    return _instance;
  }

  Map<String, ViewModelStore> _map = Map();


  T create<T extends ViewModel>(ViewModelProvider provider, T t) {
    ViewModelStore modelStore = _map[provider.hashCode.toString()];
    T viewModel;
    if (modelStore != null) {
      viewModel = modelStore.get(t.toString());

    }
    if (viewModel == null) {
      viewModel = t;
      modelStore.put(viewModel.toString(), viewModel);
    }
    return viewModel;
  }

  void put(String key, ViewModelStore store) {
    _map[key] = store;
  }

  void get(String key) => _map[key];

  void remove(String key) => _map.remove(key);
}
