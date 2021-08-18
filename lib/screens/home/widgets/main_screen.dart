import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:previsao_do_tempo/models/forecast.dart';
import 'package:previsao_do_tempo/screens/home/widgets/week.dart';
import 'package:previsao_do_tempo/shared/find_icon.dart';

class MainScreen extends StatelessWidget {
  final dynamic data;

  MainScreen(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 80),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Text(this.data["city"],
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(height: 5),
                Text(this.data["date"],
                    style: Theme.of(context).textTheme.subtitle2),
                SizedBox(height: 37),
                SvgPicture.asset(findIcon(this.data["condition_slug"]),
                    width: 50),
                Text("${this.data["temp"]}°",
                    style: Theme.of(context).textTheme.headline1),
                Text(this.data["description"],
                    style: Theme.of(context).textTheme.subtitle1),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child:
                      (SvgPicture.asset("assets/images/vento.svg", width: 32)),
                ),
                Text(this.data["wind_speedy"].toString().toUpperCase()),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Week(buildWeek(this.data["forecast"])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Forecast> buildWeek(List<dynamic> data) {
    List<Forecast> listWeek = [];
    for (var i = 0; i < data.length; i++) {
      listWeek.add(Forecast(
          weekDay: data[i]["weekday"],
          icon: findIcon(data[i]["condition"]),
          temperature: data[i]["max"]));
    }
    return listWeek;
  }
}
