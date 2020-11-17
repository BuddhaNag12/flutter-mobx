// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'globalStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GlobalStore on _GlobalStore, Store {
  Computed<List<Result>> _$pokemonsComputed;

  @override
  List<Result> get pokemons =>
      (_$pokemonsComputed ??= Computed<List<Result>>(() => super.pokemons,
              name: '_GlobalStore.pokemons'))
          .value;

  final _$pokesAtom = Atom(name: '_GlobalStore.pokes');

  @override
  ObservableList<Result> get pokes {
    _$pokesAtom.reportRead();
    return super.pokes;
  }

  @override
  set pokes(ObservableList<Result> value) {
    _$pokesAtom.reportWrite(value, super.pokes, () {
      super.pokes = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_GlobalStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$fetchPokemonAsyncAction = AsyncAction('_GlobalStore.fetchPokemon');

  @override
  Future fetchPokemon() {
    return _$fetchPokemonAsyncAction.run(() => super.fetchPokemon());
  }

  final _$fetchPokemonWithNextAsyncAction =
      AsyncAction('_GlobalStore.fetchPokemonWithNext');

  @override
  Future fetchPokemonWithNext({String nextUrl}) {
    return _$fetchPokemonWithNextAsyncAction
        .run(() => super.fetchPokemonWithNext(nextUrl: nextUrl));
  }

  final _$fetchPokemonDetailsAsyncAction =
      AsyncAction('_GlobalStore.fetchPokemonDetails');

  @override
  Future fetchPokemonDetails(int id) {
    return _$fetchPokemonDetailsAsyncAction
        .run(() => super.fetchPokemonDetails(id));
  }

  @override
  String toString() {
    return '''
pokes: ${pokes},
isLoading: ${isLoading},
pokemons: ${pokemons}
    ''';
  }
}
