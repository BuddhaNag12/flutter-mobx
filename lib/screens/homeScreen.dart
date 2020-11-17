import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_state/constants/pokeConstants.dart';
import 'package:flutter_state/screens/pokeDetails.dart';
import 'package:flutter_state/store/globalStore.dart';
import 'package:flutter_state/widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalStore _store = new GlobalStore();
  final PokeConstants _pokeConstant = new PokeConstants();
  final _scrollController = new ScrollController();
  @override
  void initState() {
    _store.fetchPokemon();
    _scrollController.addListener(_scrollToLoad);
    super.initState();
  }

  _scrollToLoad() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      String nexturl = "?offset=20&limit=20";
      _store.fetchPokemonWithNext(nextUrl: nexturl);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: RefreshIndicator(
        onRefresh: () => _store.fetchPokemon(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Observer(
            builder: (_) => _store.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: _store.pokemons.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PokeDetails(dex: index + 1),
                          ),
                        ),
                        title: Text(
                          _store.pokemons[index].name,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        leading:
                            imageWidget(index + 1, _pokeConstant, 50.0, 50.0),
                        trailing: Text(
                          '${index + 1}',
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
