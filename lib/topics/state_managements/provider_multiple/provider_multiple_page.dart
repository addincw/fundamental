import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:fundamental/topics/state_managements/provider_multiple/cart_provider.dart';
import 'package:fundamental/topics/state_managements/provider_multiple/wallet_provider.dart';

class ProviderMultiplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WalletProvider>(
          create: (context) => WalletProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('State Management - Multi Provider'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your Balance:'),
                  Consumer<WalletProvider>(
                    builder:
                        (BuildContext context, walletProvider, Widget child) {
                      return Text(
                        NumberFormat.currency(
                          decimalDigits: 0,
                          locale: 'id-ID',
                          symbol: 'IDR ',
                        ).format(walletProvider.balance),
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 12,
              color: Colors.grey[100],
            ),
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue[50],
              ),
              child: Consumer<CartProvider>(
                builder: (context, cartProvider, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Apple (500) x ${cartProvider.quantity}'),
                    Text(
                      NumberFormat.currency(
                        decimalDigits: 0,
                        locale: 'id-ID',
                        symbol: 'IDR ',
                      ).format(500 * cartProvider.quantity),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Consumer<WalletProvider>(
          builder: (context, walletProvider, child) => Consumer<CartProvider>(
            builder: (context, cartProvider, child) => FloatingActionButton(
              child: Icon(Icons.add_shopping_cart),
              onPressed: () {
                if (walletProvider.balance >= 500) {
                  cartProvider.quantity++;
                  walletProvider.balance -= 500;
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
