import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MonWidget(),
    );
  }
}


class MonWidget extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var plateforme = Theme.of(context).platform;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon application"),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).primaryColorLight,
        leading: const Icon(Icons.home),
        actions: [
          const Icon(Icons.handshake),
          const Icon(Icons.border_all)
        ],
        elevation: 30,
      ),
      body: Container(
        color: const Color(0xff414141),
        height: size.height,
        width: size.width,
        child: Center(
            child: Card(
              margin: const EdgeInsets.all(10),
              borderOnForeground: true,
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Test de la colonne"),
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          getImageFromNetwork("https://images.pexels.com/photos/16174390/pexels-photo-16174390/free-photo-of-mer-eau-ocean-animal.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", Size(size.width,300)),
                          Padding(
                            padding: const EdgeInsets.only(top: 250),
                            child: profilePicture(radius: 50),
                          ),
                          const Row(
                              children: [
                                Icon(Icons.favorite, color: Colors.white,),
                                Icon(Icons.height, color: Colors.white),
                                Spacer(),
                                Text(
                                  "Un autre élément",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                              ]
                          )
                        ],
                      ),
                      const Divider(
                        color: Colors.teal,
                        thickness: 2,
                      ),
                      Container(
                          color: Colors.teal,
                          padding: const EdgeInsets.all(5.6),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              profilePicture(),
                              // getImageFromAsset("images/image.jpg", Size(100,100)),
                              Expanded(
                                  child: simpleText("Marc Petitdemange")
                              )
                            ],
                          )
                      ),
                      getImageFromAsset("images/image.jpg", Size(size.width, 200)),
                      spanDemo("Coucou bande de nouilles"),
                      getImageFromAsset("images/image.jpg", Size(size.width, 200)),
                      getImageFromAsset("images/image.jpg", Size(size.width, 200)),
                    ],
                  ),
                ),
              ),
            )
        )
      )
    );
  }

  CircleAvatar profilePicture({double radius = 40}) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.pink,
      foregroundImage: const AssetImage("images/image.jpg")
    );
  }


  Image getImageFromNetwork(String path, Size size) {
    return Image.network(path,
        height: size.height,
        width: size.width,
        fit: BoxFit.cover
    );
  }

  Image getImageFromAsset(String path, Size size){
    return Image.asset(path,
        height: size.height,
        width: size.width,
        fit: BoxFit.cover
    );
  }


  Text simpleText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
      textAlign: TextAlign.center,
    );
  }

  Text spanDemo(String text) {
    return Text.rich(
        TextSpan(
          text: text,
          style: const TextStyle(color: Colors.red),
          children: [
            const TextSpan(
                text: "Second style",
                style: TextStyle(fontSize: 30, color: Colors.grey)
            ),
            const TextSpan(
              text: "A l'infini",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.lightBlue),
            ),
          ]
        )
    );
  }
}
