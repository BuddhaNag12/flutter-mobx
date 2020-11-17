import 'package:flutter_state/models/pokeDescModel.dart';
import 'package:flutter_state/models/pokeModel.dart';
import 'package:flutter_state/services/apiCalls.dart';
import 'package:mobx/mobx.dart';
part 'globalStore.g.dart';

class GlobalStore = _GlobalStore with _$GlobalStore;

abstract class _GlobalStore with Store {
// State Obseravables all state variables instantiated here
  @observable
  ObservableList<Result> pokes = ObservableList<Result>();
  ObservableList<PokeDesc> pokeDetails = ObservableList<PokeDesc>();
  Map<String, dynamic> errors = ObservableMap<String, dynamic>();

  @observable
  bool isLoading = false;

  // All store actions goes here
  @action
  fetchPokemon() async {
    try {
      this.isLoading = true;
      var response = await fetchData();
      pokes.addAll(response.results);
      this.isLoading = false;
    } catch (error) {
      this.isLoading = false;
      errors = {"status": error};
    } finally {
      this.isLoading = false;
    }
  }

  @action
  fetchPokemonWithNext({String nextUrl}) async {
    try {
      var response = await fetchData(nextUrl: nextUrl);
      pokes.addAll(response.results);
    } catch (error) {
      errors = {"status": error};
    }
  }

  @action
  fetchPokemonDetails(int id) async {
    try {
      isLoading = true;
      var response = await fetchDetails(id);
      pokeDetails.add(response);
      isLoading = false;
    } catch (error) {
      isLoading = false;
      errors = {"status": error};
    } finally {
      this.isLoading = false;
    }
  }

  // All getters goes here
  @computed
  List<Result> get pokemons => pokes;
  List<PokeDesc> get pokemonDetails => pokeDetails;
  bool get loading => isLoading;
  Map get error => errors;
}
