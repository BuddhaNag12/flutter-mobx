import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_state/constants/pokeConstants.dart';
import 'package:flutter_state/store/globalStore.dart';
import 'package:flutter_state/widgets/appbar.dart';

class PokeDetails extends StatefulWidget {
  const PokeDetails({Key key, this.dex}) : super(key: key);
  final int dex;

  @override
  _PokeDetailsState createState() => _PokeDetailsState();
}

class _PokeDetailsState extends State<PokeDetails> {
  final GlobalStore _store = new GlobalStore();
  final PokeConstants _pokeConstant = new PokeConstants();

  @override
  void initState() {
    _store.fetchPokemonDetails(widget.dex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          child: Observer(
            builder: (_) => Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    child: imageWidget(widget.dex, _pokeConstant, 300, 300)),
                _store.isLoading
                    ? CircularProgressIndicator()
                    : Column(
                        children: [
                           Text(
                            "Name : "+ _store.pokeDetails[0].name,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            "Type of pokemon",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Wrap(
                              children: _store.pokeDetails[0].types
                                  .map(
                                    (e) => Container(
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 2.0,
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 0.2),
                                            spreadRadius: 0.4,
                                          ),
                                        ],
                                        gradient: LinearGradient(
                                            colors: [
                                              Colors.orangeAccent,
                                              Colors.pinkAccent
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight),
                                      ),
                                      child: Text(e.type.name,
                                      style: Theme.of(context).textTheme.caption,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      )
              ],
            ),
          ),
        ));
  }
}
