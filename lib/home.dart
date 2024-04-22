// Import necessary packages and files
import 'package:connect/AI%20_tools.dart';
import 'package:flutter/material.dart';
import './details.dart';
import './analytics.dart';
import './shop.dart';

class Home extends StatefulWidget {
  final String name;
  const Home({Key? key, required this.name}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _search=TextEditingController();

  @override
  void initState() {
    _search= TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _search.dispose()
;    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final name = widget.name; // Store the value of widget.name in a local variable

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        leading:  Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.asset('assets/Crop0.png'),
                ),
        actions: [
          Icon(Icons.notifications, size: 37),
          SizedBox(width: 10),
          Icon(Icons.menu, size: 37, color: Colors.black),
          SizedBox(width: 10),
        ],
        backgroundColor: Colors.green,
        title: const Text(
          "Agro",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            // FIRST CONTAINER
            Container(
              child: Stack(
                children: [
                  Container(
                    height: 120.6,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                      color: Colors.green[500],
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "Hi ${widget.name}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),


                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 40),
                            child: CircleAvatar(
                              radius: 30,
                              child: Icon(
                                Icons.person,
                                size: 40,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                // SECOND CONTAINER
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  height: 49,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(35)),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 35,
                        color: Colors.blue.withOpacity(0.35),
                      )
                    ],
                    color: Colors.white,
                  ),
                  child:  Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextField(
                              ///onChanged: () {},
                              controller: _search,
                              decoration: const InputDecoration(
                                hintText: "search",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(Icons.search, size: 25),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // FIRST COLUMN
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 40),
              child: Row(
                children: [
                  const Text(
                    "Recommended",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "More",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  4,
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Details()),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 35,
                        color: Colors.blue.withOpacity(0.35),
                      ),
                    ],
                  ),
                  child: Container(
                    height: 150,
                    child: Image.asset('assets/crop1.jpeg')),
                ),
                            Container(
                              child: const Padding(
                                padding: EdgeInsets.only(left: 3),
                                child: Column(
                                  children: [
                                    Text("maize"),
                                    
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Second
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 40),
              child: Row(
                children: [
                  const Text(
                    "Featured Plants",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {}, child: const Text("More", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            const SizedBox(height: 5),
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  4,
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Details()),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 35,
                        color: Colors.blue.withOpacity(0.35),
                      ),
                    ],
                  ),
                  child: Container(
                    height: 150,
                    child: Image.asset(
                      'assets/crop5.jpeg'),
                  ),
                ),
                            Container(
                              child: const Padding(
                                padding: EdgeInsets.only(left: 3),
                                child: Column(
                                  children: [
                                    Text("maize"),
                                   
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // THIRD
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 40),
              child: Row(
                children: [
                  const Text(
                    "Recommended",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {}, child: const Text("More", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                ],
              ),
            ),
           const  SizedBox(height: 5),
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  4,
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>const  Details()),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset:const Offset(0, 10),
                        blurRadius: 35,
                        color: Colors.blue.withOpacity(0.35),
                      ),
                    ],
                  ),
                  child: Container(
                    height: 150,
                    child: Image.asset('assets/crop4.jpeg')),
                ),
                            Container(
                              child: const Padding(
                                padding: EdgeInsets.only(left: 3),
                                child: Column(
                                  children: [
                                    Text("veges"),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 4,
        shadowColor: Colors.green.withOpacity(0.35),
        height: 60,
        color: Colors.grey,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Icon(Icons.home, size: 30, color: Colors.white),
              const SizedBox(width: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AI()),
                  );
                },
                child: const Text("AI tools"),
              ),
              const SizedBox(width: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Analytics()),
                  );
                },
                child: const Text("Analytics"),
              ),
             const  SizedBox(width: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Shop()),
                  );
                },
                child: const Text("Shop"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
