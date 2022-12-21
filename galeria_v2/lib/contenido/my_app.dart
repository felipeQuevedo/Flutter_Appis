import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  const MyApp ({super.key});

  static const showGrid = true;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Galeria con GridView y ListView',
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Galeria con GridView y ListView')
        ),
        body: Center(child: showGrid ? _buildGrid(): _buildList()),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.green[900]
                ),
                child: Container(
                  child: Column(
                    children: const [
                      Text(
                          'Sena CBA',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                      ),
                      Text(
                        'Bienvenidos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: const[
                  ListTile(
                    title: Text("Inicio"),
                    leading: Icon(Icons.home),
                  ),
                  Divider(
                    height: 0.2,
                  ),
                  ListTile(
                    title: Text("Tiendas"),
                    leading: Icon(Icons.storefront),
                  ),
                  ListTile(
                    title: Text("Promociones"),
                    leading: Icon(Icons.category),
                  ),
                  Divider(
                    height: 0.2,
                  ),
                  ListTile(
                    title: Text("email"),
                    leading: Icon(Icons.mail),
                  ),
                  ListTile(
                    title: Text('Soporte'),
                    leading: Icon(Icons.contact_phone_sharp),
                  ),
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 8.0,
            child: const Icon(Icons.add),
            onPressed: (){
              print('Soy un boton de accion flotante');
            }
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(icon: const Icon(Icons.chevron_right_outlined), onPressed: (){},),
              IconButton(icon: const Icon(Icons.brightness_1_outlined), onPressed:(){},),
              IconButton(icon: const Icon(Icons.check_box_outline_blank ), onPressed:(){},),
            ],
          ),
        ),

      ),
    );
  }
  Widget _buildGrid() => GridView.extent(
    maxCrossAxisExtent: 450,
    childAspectRatio: (1.5),
    padding: const EdgeInsets.all(4),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: _buildGridTileList(30));

  List<Container> _buildGridTileList(int count)=>
      List.generate(
        count,(i)=> Container(child: Image.asset('images/pic$i.jpg'))
      );
  Widget _buildList(){
    return ListView(
      children: [
        _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
        _tile('The Castro Theater','429 Castro St',Icons.theaters),
        _tile('Alamo Drafthouse Cinema','2550 Mission St',Icons.theaters),
        _tile('Roxie Theater','3117 16th  St',Icons.theaters),
        _tile('United Artists Stonestown Twin','501 Buckingham way',
            Icons.theaters),
        _tile('AMC Metreon 16','135 4th St #3000',Icons.theaters),
        const Divider(),
        _tile('K\'s Kitchen','757 Monterey Blvd', Icons.restaurant),
        _tile('Emmy\'s restaurant','1923 Ocean Ave',Icons.restaurant),
        _tile('Chaiya Thai Restaurant','272 Claremont Blcd',Icons.restaurant),
        _tile('La Ciccia','291 30th St',Icons.restaurant),
      ],
    );
  }
  ListTile _tile(String title, String subtitle, IconData icon){
    return ListTile(
      title: Text(title,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      )),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
    );
  }
}

