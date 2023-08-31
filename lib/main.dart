import 'package:flutter/material.dart';
import 'package:recipes/recipe_detail.dart';
import 'recipe_model.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  print(Recipe.samples[index].label);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RecipeDetail(
                      recipe: Recipe.samples[index],
                    );
                  }));
                },
                child: buildRecipeCard(Recipe.samples[index]));
          }),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          //패딩 감싸기
          padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            Image.asset(recipe.imageUrl),
            const SizedBox(
              height: 10,
            ),
            Text(recipe.label),
          ]),
        ));
  }
}
