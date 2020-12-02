
import 'VMHeader.dart';

abstract class ViewModelChildProvider <S extends ViewModel, T extends StatefulWidget> extends State<T> {

  final ViewModelProvider provider;

  ViewModelChildProvider(this.provider);


  S createViewModel();

  S viewModel;


  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    viewModel = ViewModelFactory.instance.create(provider,createViewModel());
  }


}