import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:finall/business_logic/cubittt/character_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/colors.dart';
import '../../data/model/character.dart';
import '../widgees/Character_itterm.dart';

class CharactrScreen extends StatefulWidget {
  @override
  _CharactrScreenState createState() => _CharactrScreenState();
}

class _CharactrScreenState extends State<CharactrScreen> {
  @override
  late List<Character> allCharacters;
  late List<Character> searchedForCharacters;
  bool _isSearching = false;

  final _searchTextController = TextEditingController();

  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacter();
  }


  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: myGrey,
      decoration: const InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: myGrey, fontSize: 18),
      ),
      style: const TextStyle(color: myGrey, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedFOrItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedFOrItemsToSearchedList(String searchedCharacter) {
    searchedForCharacters = allCharacters
        .where((Character) =>
        Character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: myGrey),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(Icons.search, color: myGrey),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).character;
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: myYellow,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: myGrey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _searchTextController.text.isEmpty
            ? allCharacters.length
            : searchedForCharacters.length,
        itemBuilder: (context, index) {
          return CharacterItem(
              character: _searchTextController.text.isEmpty
                  ? allCharacters[index]
                  : searchedForCharacters[index]);
        });
  }

  Widget _buildAppBartitel() {
    return const Text(
      'Characters',
      style: TextStyle(color: myGrey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: myWhite,
          appBar: AppBar(
            backgroundColor: myYellow,
            leading: _isSearching
                ? const BackButton(
              color: myGrey,
            )
                : SizedBox(),
            title: _isSearching ? _buildSearchField() : _buildAppBartitel(),
            actions: _buildAppBarActions(),
          ),
          body: SafeArea(child: buildBlocWidget()),
        );
      },
    );
  }
}

