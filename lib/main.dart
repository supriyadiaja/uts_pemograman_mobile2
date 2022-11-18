import 'dart:math';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:date_time_picker/date_time_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (a) {
        // home

        if (currenIndex == 0) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Dasboard"),
              ),
              body: Column(
                children: [
                  Container(
                    height: 200,
                    width: 500,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 270,
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1486286701208-1d58e9338013?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                                fit: BoxFit.cover),
                          ),
                          margin: EdgeInsets.only(left: 10, bottom: 20),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Card(
                            margin: EdgeInsets.all(10),
                            elevation: 10,
                            color: Color.fromARGB(
                              255,
                              100 + Random().nextInt(266),
                              100 + Random().nextInt(266),
                              100 + Random().nextInt(266),
                            ),
                            child: Container(
                              height: 100,
                              margin: EdgeInsets.all(10),
                              child: Center(
                                child: Text('Gambar ke-${index + 1}'),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ));

          // game
        } else if (currenIndex == 1) {
          return DefaultTabController(
            initialIndex: 0,
            length: tabs.length,
            child: Scaffold(
                appBar: AppBar(
                  title: Text('Pertandingan'),
                  bottom: TabBar(tabs: tabs),
                ),
                body: TabBarView(children: [
                  Container(
                    child: _bulidListView(),
                  ),
                  Column(
                    children: [
                      DateTimePicker(
                        type: DateTimePickerType.dateTimeSeparate,
                        dateMask: 'd MMM, yyyy',
                        initialValue: DateTime.now().toString(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        icon: Icon(Icons.event),
                        dateLabelText: 'Date',
                        timeLabelText: "Hour",
                        // selectableDayPredicate: (date) {
                        //   // Nonaktifkan hari akhir pekan untuk memilih kalender
                        //   if (date.weekday == 6 || date.weekday == 7) {
                        //     return false;
                        //   }
                        //   return true;
                        // },
                        onChanged: (val) => print(val),
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => print(val),
                      ),
                    ],
                  )
                ])),
          );
          // Search
        } else if (currenIndex == 2) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Search"),
            ),
            body: Container(
              child: ListView(
                children: [
                  Container(
                    height: 150,
                    width: 400,
                    color: Colors.grey[300],
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          width: 400,
                          height: 40,
                          margin: EdgeInsets.all(10),
                          child: Icon(
                            Icons.search,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 70,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(
                                    255,
                                    100 + Random().nextInt(300),
                                    100 + Random().nextInt(300),
                                    100 + Random().nextInt(300),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: EdgeInsets.all(10),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Container(
                                width: 400,
                                child: Text(
                                  "Langsung di OneFootball",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 130,
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Card(
                                margin: EdgeInsets.all(10),
                                elevation: 10,
                                color: Color.fromARGB(
                                  255,
                                  100 + Random().nextInt(300),
                                  100 + Random().nextInt(300),
                                  100 + Random().nextInt(300),
                                ),
                                child: Container(
                                  height: 75,
                                  width: 250,
                                  margin: EdgeInsets.all(10),
                                  child: Center(
                                    child: Text("Gambar ke- ${index + 1}"),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 70,
                        width: 400,
                        child: Card(
                          semanticContainer: true,
                          elevation: 10,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              "Lihat Lebih banyak",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );

          // galery
        } else if (currenIndex == 3) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Galery"),
            ),
            body: Container(
                child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Card(
                          elevation: 5,
                          child: Image.network(
                            'https://picsum.photos/id/${237 + index}/536/354',
                            fit: BoxFit.cover,
                          ),
                          margin: EdgeInsets.all(10),
                        ),
                      );
                    },
                  ),
                )
              ],
            )),
          );

          // profile
        } else if (currenIndex == 4) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Profile'),
            ),
            body: Container(
              child: ListView(
                children: [
                  Container(
                    height: 150,
                    width: 400,
                    color: Colors.grey[300],
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(255),
                          ),
                          child: Icon(
                            Icons.person,
                            size: 60,
                          ),
                        ),
                        Container(
                            child: Column(
                          children: [
                            Text(
                              "Supriyadi",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 3)),
                            Text(
                              "20552011145",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(5),
                            width: 400,
                            child: Text(
                              "Akun",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Container(
                          height: 200,
                          margin: EdgeInsets.only(top: 10),
                          child: Card(
                            elevation: 10,
                            color: Colors.grey[300],
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Row(
                                      children: [
                                        Icon(Icons.person),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Text(
                                            'Reward Saya',
                                            style: TextStyle(
                                              fontSize: 12,
                                              letterSpacing: 0.5,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Row(
                                      children: [
                                        Icon(Icons.person_add),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Text(
                                            'Ajak Teman',
                                            style: TextStyle(
                                              fontSize: 12,
                                              letterSpacing: 0.5,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Row(
                                      children: [
                                        Icon(Icons.help_center),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Text(
                                            'Bantuan',
                                            style: TextStyle(
                                              fontSize: 12,
                                              letterSpacing: 0.5,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.lock_clock),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Text(
                                            'Aktivitas Terakhir',
                                            style: TextStyle(
                                              fontSize: 12,
                                              letterSpacing: 0.5,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(top: 20),
                          child: Card(
                            elevation: 10,
                            color: Colors.grey[300],
                            child: Container(
                              width: 400,
                              margin: EdgeInsets.all(10),
                              child: Container(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    'Keluar',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Competition',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Galery',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: (index) {
          setState(() {
            currenIndex = index;
          });
        },
      ),
    );
  }

  ListView _bulidListView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, index) {
        return Container(
          child: Card(
            elevation: 10,
            child: ListTile(
              title: Text("Nama Club"),
              subtitle: Text("Deskripsi CLub"),
              leading: Icon(Icons.sports_soccer),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
        );
      },
    );
  }

  final List<Tab> tabs = [
    Tab(
      text: 'Club',
    ),
    Tab(
      text: 'Date',
    ),
  ];
}
