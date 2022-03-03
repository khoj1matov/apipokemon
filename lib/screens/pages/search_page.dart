import 'package:flutter/material.dart';
import 'package:pok_api/core/components/textstyle_comp.dart';
import 'package:pok_api/models/pokemon_model.dart';
import 'package:pok_api/services/pokemons_service.dart';

class SearchPage extends StatefulWidget {
  final List<Pokemon> data;
  const SearchPage({Key? key, required this.data}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Set<Pokemon> searchedItems = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: PokemonsService.getData(),
          builder: (context, AsyncSnapshot<PokemonsModel> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (snapshot.hasError) {
              return const Text("ERROR");
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: const Image(
                      image: AssetImage("assets/images/image3.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(45),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Buscar Pokemons",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0))),
                      onChanged: (v) {
                        searchedItems.clear();
                        for (Pokemon item in widget.data) {
                          if (v.isEmpty) {
                            searchedItems.clear();
                            setState(() {});
                          } else if (item.name
                              .toString()
                              .toLowerCase()
                              .contains(v.toString().toLowerCase())) {
                            searchedItems.add(item);
                            setState(() {});
                          }
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 40),
                              height: MediaQuery.of(context).size.height * 0.35,
                              width: MediaQuery.of(context).size.width * 1,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "#" +
                                              snapshot.data!.pokemon![index].num
                                                  .toString(),
                                          style:
                                              MyTextStyle.pokimonId2TextStyle,
                                        ),
                                        Text(
                                          snapshot.data!.pokemon![index].name
                                              .toString(),
                                          style:
                                              MyTextStyle.pokimonName2TextStyle,
                                          overflow: TextOverflow.clip,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    height: MediaQuery.of(context).size.height *
                                        0.23,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      color: Colors.purple,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 45, bottom: 20),
                              height: 247,
                              width: 289,
                              child: Image(
                                image: NetworkImage(
                                  searchedItems.toList()[index].img.toString(),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: searchedItems.length,
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
