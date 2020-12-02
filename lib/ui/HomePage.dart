import 'package:flutter_desk_challenge/base/vm/VMHeader.dart';
import 'package:flutter_desk_challenge/entity/weather_entity.dart';
import 'package:flutter_desk_challenge/ui/vm/HomeViewModel.dart';

import '../WindowSizeService.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends ViewModelProvider<HomeViewModel, HomePage> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    viewModel.getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    var service = WindowSizeService();
    service.initialize();
    return StreamBuilder(
        stream: viewModel.weatherData.stream,
        builder: (context, snapshot) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  "assets/ic_background.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              _buildHome(this, snapshot)
            ],
          );
        });
  }

  @override
  HomeViewModel createViewModel() => HomeViewModel();
}

Widget _buildHome(HomePageState state, AsyncSnapshot snapshot) {
  if (snapshot.connectionState == ConnectionState.active) {
    Weather_entity data = snapshot.data;
    if (state._controller == null) {
      state._controller = ScrollController();
    }
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      controller: state._controller,
      itemCount: data.data.forecast.length,
      padding: EdgeInsets.only(left: 25.0, right: 25.0),
      itemBuilder: (context, index) {
        return _buildItem(data.data.forecast[index]);
      },
    );
  } else {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

Widget _buildItem(Forecast data) {
  return SizedBox(
    width: 200,
    height: 400,
    child: Card(
      color: Colors.white60,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(data.date.substring(data.date.indexOf("日") + 1),style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: "ZhiMing"),),
          ),

        ],
      ),
    ),
  );
}
