import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:live_class_project/add_product_screen.dart';
import 'package:live_class_project/product.dart';
import 'package:live_class_project/update_product_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool _getProductListInProgress = false;
  List<Product> productList = [];

  @override
  void initState() {
    super.initState();
    _getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product list'),
      ),
      body: Visibility(
        visible: _getProductListInProgress == false,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.separated(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return _buildProductItem(productList[index]); // n(1)
          },
          separatorBuilder: (_, __) => const Divider(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProductScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _getProductList() async {
    _getProductListInProgress = true;
    setState(() {});
    productList.clear();
    const String productListUrl = 'https://crud.teamrabbil.com/api/v1/ReadProduct';
    Uri uri = Uri.parse(productListUrl);
    Response response = await get(uri);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      // data decode
      final decodedData = jsonDecode(response.body);
      // get the list
      final jsonProductList = decodedData['data'];
      // loop over the list
      for (Map<String, dynamic> p in jsonProductList) {
        Product product = Product(
          id: p['_id'] ?? '',
          productName: p['ProductName'] ?? 'Unknown',
          productCode: p['ProductCode'] ?? '',
          image: p['Img'] ?? '',
          unitPrice: p['UnitPrice'] ?? '',
          quantity: p['Qty'] ?? '',
          totalPrice: p['TotalPrice'] ?? '',
        );

        productList.add(product);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Get product list failed! Try again.')),
      );
    }

    _getProductListInProgress = false;
    setState(() {});
  }

  Widget _buildProductItem(Product product) {
    return ListTile(
      // leading: Image.network(
      //   product.image,
      //   height: 60,
      //   width: 60,
      // ),
      title: Text(product.productName),
      subtitle: Wrap(
        spacing: 16,
        children: [
          Text('Unit Price: ${product.unitPrice}'),
          Text('Quantity : ${product.quantity}'),
          Text('Total Price: ${product.totalPrice}'),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UpdateProductScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline_sharp),
            onPressed: () {
              _showDeleteConfirmationDialog();
            },
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: const Text('Are you sure that you want to delete this product?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Yes, delete'),
            ),
          ],
        );
      },
    );
  }
}
