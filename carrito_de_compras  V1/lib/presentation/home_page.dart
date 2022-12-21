import 'package:flutter/material.dart';
import 'shopping_cart.dart' show Carrito;
import 'lista_productos.dart';

 class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ListaProductos> _productosModel = <ListaProductos>[];


  final List<ListaProductos> _listaCarro = <ListaProductos>[];

@override
void initState() {

  super.initState();
  _productos();
}

@override
Widget build(BuildContext context) {
  return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.blue[200],
        elevation: 0,
        child: Column(
          children: const [
            DrawerHeader(
              child: CircleAvatar(
               backgroundImage: NetworkImage(''),
               radius: 70,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8, top: 8),
              child: ListTile(
                leading: Icon(Icons.home_filled),
                title: Text(
                  'H O M E',style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.yellowAccent[100],
      appBar: AppBar(
          backgroundColor: Colors.red,
          actions: <Widget>[
      Padding(
      padding: const EdgeInsets.only(right: 16.0, top: 8.0),
      child: GestureDetector(
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
          const Icon(
          Icons.shopping_cart,
            size: 38,
          ),
                  if (_listaCarro.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                              _listaCarro.length.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12.0
                              )
                          )
                      ),
                    ),
                ],
              ),
              onTap: () {
                if (_listaCarro.isNotEmpty) {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Carrito(_listaCarro),
                      )
                  );
                }
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _productosModel.length,
        itemBuilder: (context, index) {
          var item = _productosModel[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Container(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image(
                      image: NetworkImage(
                          _productosModel[index].imageURL.toString()
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 8
                              ),
                              child: Text(
                                _productosModel[index].nombre.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 8
                              ),
                              child:
                              Text(_productosModel[index].precio.toString()),
                            ),
                          ],
                        ),
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (!_listaCarro.contains(item)) {
                            _listaCarro.add(item);
                          } else {
                            _listaCarro.remove(item);
                          }
                        });
                      },
                      icon: (!_listaCarro.contains(item))
                          ? const Icon(Icons.shopping_cart)
                          : const Icon(
                        Icons.shopping_cart_checkout,
                        color: Colors.green,
                      ))
                ],
              ),
            ),
          );
        },
      ));
}
  void _productos() {
    var list = <ListaProductos>[
      ListaProductos(
          nombre: 'Pizza familiar 3 carnes',
          precio: 40000,
          imageURL: 'images/pizza.jpg',
          id: 1,
          isAdd: false
      ),
      ListaProductos(nombre: 'Hamburguesa',
          precio: 16500,
          imageURL: 'images/hamburguesa.jpg',
          id: 2,
          isAdd: false
      ),
      ListaProductos(nombre: 'Salchipapas',
          precio: 11750,
          imageURL: 'images/salchipapa.jpg',
          id: 3,
          isAdd: false
      ),
      ListaProductos(nombre: 'Perro Caliente',
          precio: 8900,
          imageURL: 'images/perrito.jpg',
          id: 4,
          isAdd: false
      ),
      ListaProductos(
          nombre: 'Lasaña',
          precio: 17000,
          imageURL: 'images/lasaña.jpg',
          id: 5,
          isAdd: false
      )
    ];
    setState(() {
      _productosModel = list;
    });
  }
}

