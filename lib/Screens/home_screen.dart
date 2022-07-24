import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff146356),
          title: const Text(
            "Rick and Morty App",
            // style: TextStyle(color: Color(0xffFFF1BD)),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: const Icon(
                Icons.search,
                //color: Color(0xffFFF1BD),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Background(),
            _HomeBody(),
          ],
        ));
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          SizedBox(
            height: 10,
          ),
          //No titulo
          //cards table
          CardTable(),
        ],
      ),
    );
  }
}
