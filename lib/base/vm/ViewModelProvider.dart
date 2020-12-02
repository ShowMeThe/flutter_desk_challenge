import 'VMHeader.dart';

abstract class ViewModelProvider<S extends ViewModel, T extends StatefulWidget> extends State<T>{


  S createViewModel();

  S viewModel;

  ViewModelStore _viewModelStore;

   ViewModelStore getViewModelStore(){
     if(_viewModelStore == null){
       _viewModelStore = ViewModelStore();
       ViewModelFactory.instance.put(hashCode.toString(), _viewModelStore);
     }
     return _viewModelStore;
  }

  @override
  void dispose() {
    if(viewModel!=null){
      viewModel.onCleared();
    }
    _viewModelStore.clear();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if(_viewModelStore == null){
      _viewModelStore = getViewModelStore();
    }
    viewModel = ViewModelFactory.instance.create(this,createViewModel());
  }




}