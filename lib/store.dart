import 'package:flutter/material.dart';

class StoreApp extends StatefulWidget {
  final Store store;

  StoreApp({required this.store});

  @override
  _StoreAppState createState() => _StoreAppState();
}

class _StoreAppState extends State<StoreApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.store.products.length,
            itemBuilder: (context, index) {
              final product = widget.store.products[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text('${product.price} \$'),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _showEditProductDialog(context, product);
                  },
                ),
                onLongPress: () {
                  widget.store.removeProduct(product.id);
                  setState(() {}); // To refresh the list after removing a product
                },
              );
            },
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            _showAddProductDialog(context);
          },
          child: Icon(Icons.add),
        ),
      ],
    );
  }

  // Method to display a dialog for adding a new product
  void _showAddProductDialog(BuildContext context) {
    String productName = '';
    double productPrice = 0.0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ajouter un nouveau produit'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  productName = value;
                },
                decoration: InputDecoration(labelText: 'Nom du produit'),
              ),
              TextField(
                onChanged: (value) {
                  productPrice = double.tryParse(value) ?? 0.0;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Prix du produit'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                if (productName.isNotEmpty && productPrice > 0) {
                  // Ajouter le produit à la liste
                  final newProduct = Product(id: DateTime.now().toString(), name: productName, price: productPrice);
                  widget.store.addProduct(newProduct);
                  Navigator.of(context).pop();
                  setState(() {}); // To refresh the list after adding a product
                }
              },
              child: Text('Ajouter'),
            ),
          ],
        );
      },
    );
  }

  // Method to display a dialog for editing an existing product
  void _showEditProductDialog(BuildContext context, Product product) {
    String productName = product.name;
    double productPrice = product.price;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Modifier le produit'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: TextEditingController(text: productName),
                onChanged: (value) {
                  productName = value;
                },
                decoration: InputDecoration(labelText: 'Nom du produit'),
              ),
              TextField(
                controller: TextEditingController(text: productPrice.toString()),
                onChanged: (value) {
                  productPrice = double.tryParse(value) ?? 0.0;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Prix du produit'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                if (productName.isNotEmpty && productPrice > 0) {
                  // Update the product in the store
                  final updatedProduct = Product(id: product.id, name: productName, price: productPrice);
                  widget.store.updateProduct(updatedProduct);
                  Navigator.of(context).pop();
                  setState(() {}); // To refresh the list after updating a product
                }
              },
              child: Text('Enregistrer'),
            ),
          ],
        );
      },
    );
  }
}
class Product {
  final String id;
  final String name;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.price,
  });
}

class Store {
  List<Product> _products = [];

  List<Product> get products => _products;

  // Method to add a new product to the store
  void addProduct(Product product) {
    _products.add(product);
  }

  // Method to update an existing product in the store
  void updateProduct(Product updatedProduct) {
    final index = _products.indexWhere((product) => product.id == updatedProduct.id);
    if (index != -1) {
      _products[index] = updatedProduct;
    }
  }

  // Method to remove a product from the store
  void removeProduct(String productId) {
    _products.removeWhere((product) => product.id == productId);
  }
}