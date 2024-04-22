import 'package:connect/analytics.dart';
import 'package:connect/chat_Screen.dart';
import 'package:connect/shop.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
class AI extends StatefulWidget {
  const AI({super.key});

  @override
  State<AI> createState() => _AIState();
}

class _AIState extends State<AI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.agriculture_sharp,size: 37,),
        actions:const  [
          Icon(Icons.notifications,size: 37,),
           SizedBox(width: 10,)
          ,Icon(Icons.menu,size: 37,color: Colors.black,),
          SizedBox(width: 10,)

        ],
        backgroundColor: Colors.green,
        title: const Text("Agro",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            ////FIRST CONTAINER
            Container(
              child: Stack(
               children: [
                 Container(
                  height: 120.6,
                  decoration: BoxDecoration(borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35)
                
                  ),
                  color: Colors.green[500],
                ),
                child:const Center(
                  child: Row(
                    children: [                    
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("Hi Douglas!",  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color:Colors.white),
                           
                            ),  
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.only(right: 40),
                        child: CircleAvatar(
                          radius: 30,
                          child: Icon(Icons.person, size: 40,),
                        ),
                      )
                    ],
                  ),
                ),
                     ),
               ],
              ),
            ),
            const SizedBox(height: 10,),

            ///AI TOOLS
            Container(height: 40,
            width: 340,
            decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(20), 
            boxShadow: [BoxShadow(
                     offset:const Offset(0,10),
                     blurRadius: 35
                     ,color:Colors.blue.withOpacity(0.35)
                    )],),
              child:const Center(child: Text("AI tools",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)
              ,
              )),
              
            ),
           const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                    
                    },
                    child: Container(height:260,width: 179,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)
                    , boxShadow: [BoxShadow(
                       offset:const Offset(0,10),
                       blurRadius: 35
                       ,color:Colors.blue.withOpacity(0.35)
                      )],),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search,size: 65,),
                          Text("Scan",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold))
                          
                        ],
                      ),
                    ),
                    ),
                  ),
                 const  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) => const ChatScreen(),));
                      
                    },
                    child: Container(
                      height:260,width: 179,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30), boxShadow: [BoxShadow(
                       offset:const Offset(0,10),
                       blurRadius: 35
                       ,color:Colors.blue.withOpacity(0.35)
                      )],),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.message,size: 65,),
                          Text("Chat Bot",style:TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold))
                          
                        ],
                      ),
                    ),
                    ),
                  )
                ],
              ),
            )

      ] )) ,
      bottomNavigationBar: BottomAppBar(
        elevation: 4,
        shadowColor: Colors.green.withOpacity(0.35),
        height: 60,
        color: Colors.grey,
        child: SingleChildScrollView(scrollDirection: axisDirectionToAxis(AxisDirection.right),
          child: Row(children: [
             const Icon(Icons.home,size: 30,color: Colors.white,),
             const SizedBox(width: 30,),
            ElevatedButton(
              onPressed: () {
               /// Navigator.push(context, MaterialPageRoute(builder:(context) => AI(),));
              },
              child:const Text("AI tools")),
           const SizedBox(width: 30,),
               ElevatedButton(
              onPressed: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Analytics(),));
              },
              child:const Text("Analytics")),
               const SizedBox(width: 30,),
               ElevatedButton(
              onPressed: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Shop(),));
              },
              child:const Text("Shop"))
                ],),
        )), 

      );
  }
}
class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraScreen({Key? key, required this.cameras}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // Create a CameraController
    _controller = CameraController(
      // Get a specific camera from the list of available cameras
      widget.cameras.first,
      // Define the resolution to use
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan')),
      // Wait until the controller is initialized before displaying the camera preview. Use a FutureBuilder to display a loading spinner until the controller has finished initializing
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}