import 'package:flutter/material.dart';
class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          backgroundColor: Colors.green,
        title: const Text("Maize growing"),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
              Column(
              children: [
                //crop selection
                const Text("Crop selection"),
                const Image(image: AssetImage("assets/apple.png")),
            Container()
              ],
            ),
           const SizedBox(height: 15,),

            ///Land Cultivation
            Column(
              children: [
                const Text("Land Cultivation"),
                const Image(image: AssetImage("assets/apple.png")),
            Container()
              ],
            ),
                      const SizedBox(height: 15,),

            ///Weeding
            Column(
              children: [
                const Text("Weeding"),
                const Image(image: AssetImage("assets/apple.png")),
            Container()
              ],
            ),
                       const SizedBox(height: 15,),

            ///Spraying
            Column(
              children: [
                const Text("Spraying pestscides"),
                const Image(image: AssetImage("assets/apple.png")),
            Container()
              ],
            ),
           const SizedBox(height: 15,),
            ///Harvesting
        
            Column(
              children: [
                const Text("Harvesting"),
                const Image(image: AssetImage("assets/apple.png")),
            Container()
              ],
            ),
            
          
           
            
            
            
        
          ],
        ),
      ),

    );
  }
}