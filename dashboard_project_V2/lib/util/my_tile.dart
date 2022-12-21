import 'package:flutter/material.dart';
import 'package:dashboard_project/util/lista_productos.dart';

class MyTile extends StatelessWidget {
  final int a;
  const MyTile({Key? key, required this.a}): super(key:key);
  List<ListaProductos> _productosModel = <ListaProductos>[];

  final List<ListaProductos> _listaCarro = <ListaProductos>[];



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 78,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[200]
        ),
      ),
    );

  }
  void _productos(){
    var list = <ListaProductos>[
    ListaProductos(
    nombre: 'Pizza familiar 3 carnes',
    precio: 40000,
    imageURL: 'images/img1.jpg',
    id: 1,
    isAdd: false
     ),
    ];
  }
}