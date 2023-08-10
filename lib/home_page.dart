import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_cubit.dart';
import 'package:weather_app/bloc/weather_states/states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';

class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);

  Weather_Model? weather_data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 280,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(80)),
                  color: Colors.blueGrey[100]),
              child: const Text(
                'Setting',
                style: TextStyle(fontSize: 40, color: Colors.blueGrey),
              ),
            ),
            ListTile(
              leading: Switch(
                value: false,
                onChanged: (value) => weather_data,
              ),
              title: const Text(
                'light',

              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Weather',
            style: TextStyle(fontSize: 30),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Search(
                    //  update_ui: update_ui,
                  );
                }));
              },
              icon: const Icon(
                Icons.location_on_outlined,
                size: 30,
              )),
        ],
      ),
     body: BlocBuilder<Weathercubit,Weatherstates>
       (
        builder: (context,state)
            {
             if(state is Loadingstate)
               {
                 return const Center(child: CircularProgressIndicator());
               }
             else if(state is Successstate)
               {
                 weather_data = BlocProvider.of<Weathercubit>(context).model;
                 return Center(
                   child: Column(
                     children: [
                       const SizedBox(
                         height: 80,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           const Icon(
                             Icons.location_on_outlined,
                             size: 35,
                             color: Colors.blueGrey,
                           ),
                           Text(
                             '${BlocProvider.of<Weathercubit>(context).city}',
                             style: const TextStyle(
                                 fontSize: 40,
                                 color: Colors.blueGrey,
                                 fontWeight: FontWeight.w500),
                           ),
                         ],
                       ),
                       Text(
                         'updated:${weather_data!.date}',
                         style: const TextStyle(
                           fontSize: 18,
                           color: Colors.blueGrey,
                         ),
                       ),
                       const SizedBox(
                         height: 20,
                       ),
                       SingleChildScrollView(
                         scrollDirection: Axis.horizontal,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Image(
                               //placeholder: AssetImage('assets/placeholder.png'),
                               image:
                               NetworkImage('https:${weather_data!.icon_data}'),
                             ),
                             const SizedBox(
                               width: 40,
                             ),
                             Text(
                               weather_data!.weather_state,
                               style: const TextStyle(
                                   fontSize: 40,
                                   color: Colors.blueGrey,
                                   fontWeight: FontWeight.w500),
                             ),
                           ],
                         ),
                       ),
                       const SizedBox(
                         height: 20,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             '${weather_data!.aver_temp.toInt()}',
                             style: const TextStyle(
                                 fontSize: 40,
                                 color: Colors.blueGrey,
                                 fontWeight: FontWeight.w500),
                           ),
                           const SizedBox(
                             width: 10,
                           ),
                           Container(
                             height: 40,
                             width: 5,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(15),
                                 color: Colors.blueGrey),
                           ),
                           const SizedBox(
                             width: 10,
                           ),
                           Column(
                             children: [
                               Text(
                                 'min temp: ${weather_data!.min_temp.toInt()}',
                                 style: const TextStyle(
                                   fontSize: 18,
                                   color: Colors.blueGrey,
                                 ),
                               ),
                               Text(
                                 'max temp :${weather_data!.min_temp.toInt()}',
                                 style: const TextStyle(
                                   fontSize: 18,
                                   color: Colors.blueGrey,
                                 ),
                               ),
                             ],
                           )
                         ],
                       )
                     ],
                   ),
                 );
               }
             else if(state is Faildstate)
               {
                 return const Padding(
                   padding: EdgeInsets.all(18.0),
                   child: Center(
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Text(
                           'something wrong try again ',
                           style: TextStyle(fontSize: 30),
                         )
                       ],
                     ),
                   ),
                 );
               }
             else
               {
                 return const Padding(
                   padding: EdgeInsets.all(18.0),
                   child: Center(
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Text(
                           'there is no weather start searching now ',
                           style: TextStyle(fontSize: 30),
                         )
                       ],
                     ),
                   ),
                 );
               }
            }
     ),
    );
  }
}