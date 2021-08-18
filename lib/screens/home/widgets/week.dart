import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:previsao_do_tempo/models/forecast.dart';

class Week extends StatelessWidget {
  final List<Forecast> forecastList;

  Week(this.forecastList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
          height: 63,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: builder,
              itemCount: this.forecastList.length)),
    );
  }

  Widget builder(BuildContext context, int index) {
    Forecast forecast = this.forecastList[index];

    return Padding(
      padding: EdgeInsets.only(right: 30),
      child: Column(
        children: [
          Text(forecast.weekDay, style: Theme.of(context).textTheme.bodyText1),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: SvgPicture.asset(forecast.icon, width: 20)),
          Text("${forecast.temperature}°",
              style: Theme.of(context).textTheme.caption)
        ],
      ),
    );
  }
}
