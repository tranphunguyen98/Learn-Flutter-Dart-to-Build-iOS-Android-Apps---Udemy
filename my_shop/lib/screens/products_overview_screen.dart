import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart.dart';
import 'package:my_shop/screens/cart_screen.dart';
import 'package:my_shop/widgets/badge.dart';
import 'package:my_shop/widgets/products_grid.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
        actions: <Widget>[
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
                child: child, value: cart.itemCount.toString(), color: null),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (FilterOptions selected) {
                setState(() {
                  if (selected == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text("Only Favirites"),
                      value: FilterOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text("Show All"),
                      value: FilterOptions.All,
                    ),
                  ]),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
