import 'package:flutter/material.dart';
import 'package:pok_api/core/components/textstyle_comp.dart';
import 'package:pok_api/core/constants/color_const.dart';
import 'package:pok_api/models/pokemon_model.dart';
import 'package:pok_api/services/pokemons_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    child: ElevatedButton(
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(300, 42)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(
                          ColorConst.elevatedbuttonColor,
                        ),
                      ),
                      child: Text(
                        "Buskar Pokemon",
                        style: MyTextStyle.elevatedbutonTextStyle,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/search',
                            arguments: snapshot.data!.pokemon);
                      },
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 160,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 60),
                                height:
                                    MediaQuery.of(context).size.height * 0.13,
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFC7CFF),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                height:
                                    MediaQuery.of(context).size.height * 0.19,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Image.network(
                                  snapshot.data!.pokemon![index].img.toString(),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                alignment: Alignment.bottomCenter,
                                height: double.infinity,
                                width: double.infinity,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: ColorConst.blablaColor,
                                  ),
                                  height: 25,
                                  width: 147,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          "#" +
                                              snapshot.data!.pokemon![index].num
                                                  .toString(),
                                          style: MyTextStyle.pokimonIdTextStyle,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Text(
                                          snapshot.data!.pokemon![index].name
                                              .toString(),
                                          style: MyTextStyle.pokimonNameTextStyle,
                                          overflow: TextOverflow.clip,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: snapshot.data!.pokemon!.length,
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
