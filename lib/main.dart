import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyBagScreen(),
    );
  }
}

class MyBagScreen extends StatefulWidget {
  @override
  _MyBagScreenState createState() => _MyBagScreenState();
}

class _MyBagScreenState extends State<MyBagScreen> {
  final List<CartItem> _cartItems = [
    CartItem(imageUrl: 'https://via.placeholder.com/100', productName: 'Pullover', color: 'Black', size: 'L', price: 51, quantity: 1),
    CartItem(imageUrl: 'https://via.placeholder.com/100', productName: 'T-Shirt', color: 'Gray', size: 'L', price: 30, quantity: 1),
    CartItem(imageUrl: 'https://via.placeholder.com/100', productName: 'Sport Dress', color: 'Black', size: 'M', price: 43, quantity: 1),
  ];

  int get _totalAmount {
    return _cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);
  }

  void _updateTotal() {
    setState(() {});
  }

  void _showCheckoutMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Congratulations! Your order has been placed.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Bag"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _cartItems.length,
                itemBuilder: (context, index) {
                  return CartItemWidget(
                    cartItem: _cartItems[index],
                    onQuantityChanged: _updateTotal,
                  );
                },
              ),
            ),
            TotalAmount(total: _totalAmount),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _showCheckoutMessage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  'CHECK OUT',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem {
  final String imageUrl;
  final String productName;
  final String color;
  final String size;
  final int price;
  int quantity;

  CartItem({
    required this.imageUrl,
    required this.productName,
    required this.color,
    required this.size,
    required this.price,
    this.quantity = 1,
  });
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onQuantityChanged;

  CartItemWidget({
    required this.cartItem,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.network(cartItem.imageUrl, width: 70, height: 70),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.productName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text('Color: ${cartItem.color}, Size: ${cartItem.size}'),
                Text('\$${cartItem.price}', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          QuantitySelector(
            cartItem: cartItem,
            onQuantityChanged: onQuantityChanged,
          ),
        ],
      ),
    );
  }
}

class QuantitySelector extends StatefulWidget {
  final CartItem cartItem;
  final VoidCallback onQuantityChanged;

  QuantitySelector({
    required this.cartItem,
    required this.onQuantityChanged,
  });

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (widget.cartItem.quantity > 1) {
                widget.cartItem.quantity--;
                widget.onQuantityChanged();
              }
            });
          },
        ),
        Text('${widget.cartItem.quantity}', style: TextStyle(fontSize: 18)),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              widget.cartItem.quantity++;
              widget.onQuantityChanged();
            });
          },
        ),
      ],
    );
  }
}

class TotalAmount extends StatelessWidget {
  final int total;

  TotalAmount({required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total amount:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          '\$$total',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}