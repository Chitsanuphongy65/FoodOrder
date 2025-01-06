import 'package:flutter/material.dart';
import 'dart:math'; // ใช้สำหรับสุ่มเมนู

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodOrderScreen(),
    );
  }
}

class FoodOrderScreen extends StatefulWidget {
  @override
  _FoodOrderScreenState createState() => _FoodOrderScreenState();
}

class _FoodOrderScreenState extends State<FoodOrderScreen> {
  final List<Dish> dishes = [
    Dish(name: "Pizza", price: 150, ingredients: ["Dough", "Cheese", "Tomato Sauce"]),
    Dish(name: "Burger", price: 120, ingredients: ["Bun", "Beef", "Lettuce"]),
    Dish(name: "Sushi", price: 180, ingredients: ["Rice", "Fish", "Seaweed"]),
    Dish(name: "Soup", price: 90, ingredients: ["Broth", "Vegetables", "Chicken"]),
  ];

  void addRandomDish() {
    final random = Random();
    // ตัวเลือกเมนูที่จำกัดให้เหลือเฉพาะ Pizza, Burger, Sushi, และ Soup
    final limitedDishes = [
      Dish(name: "Pizza", price: 150, ingredients: ["Dough", "Cheese", "Tomato Sauce"]),
      Dish(name: "Burger", price: 120, ingredients: ["Bun", "Beef", "Lettuce"]),
      Dish(name: "Sushi", price: 180, ingredients: ["Rice", "Fish", "Seaweed"]),
      Dish(name: "Soup", price: 90, ingredients: ["Broth", "Vegetables", "Chicken"]),
    ];

    final newDish = limitedDishes[random.nextInt(limitedDishes.length)];

    setState(() {
      dishes.add(newDish);
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = dishes.fold(0, (sum, dish) => sum + dish.price);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo : Food Order - Total Price: $totalPrice'),
        backgroundColor: Colors.green.shade600, // สีเขียว
      ),
      body: ListView.builder(
        itemCount: dishes.length,
        itemBuilder: (context, index) {
          final dish = dishes[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade100, // สีเขียวอ่อน
              child: Text('${dish.price}'),
            ),
            title: Text('Dish $index is ${dish.name}'),
            subtitle: Text(
                'This menu ingredients are ${dish.ingredients.join(", ")}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addRandomDish, // เมื่อกดปุ่ม "+" จะเพิ่มเมนูแบบสุ่ม
        child: Icon(Icons.add),
        backgroundColor: Colors.green.shade700, // สีเขียวเข้ม
      ),
    );
  }
}

class Dish {
  final String name;
  final int price;
  final List<String> ingredients;

  Dish({required this.name, required this.price, required this.ingredients});
}
