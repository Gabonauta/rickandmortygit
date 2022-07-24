import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortyapp/Screens/loading_screen.dart';
import '../Services/services.dart';
import '../Widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final charactersService = Provider.of<CharactersService>(context);
    if (charactersService.isLoading) return const LoadingScreen();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff146356),
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
          children: const [
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
    final charactersService = Provider.of<CharactersService>(context);
    return CardTable(
      onNextPage: () {
        charactersService.loadCharacters();
      },
    );
  }
}
