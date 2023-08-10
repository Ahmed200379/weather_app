import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_cubit.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: const Center(
          child: Text(
            'Location',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 18, right: 18),
        child: Column(
          children: [
            const Image(
                image: NetworkImage(
                    'https://cip-network-rss.org/sites/default/files/2021-09/Globe_CIP_0.gif')),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              onFieldSubmitted: (location)  {
                BlocProvider.of<Weathercubit>(context).getweather(city: location);
                BlocProvider.of<Weathercubit>(context).city=location;
                Navigator.pop(context);
                const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 5.0,
                        )));
              },
              decoration: InputDecoration(
                  labelText: 'Location',
                  hintText: 'Enter your city',
                  suffixIcon: const Icon(Icons.location_on_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18))),
            ),
          ],
        ),
      ),
    );
  }
}