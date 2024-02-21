import 'package:StunAi/Widgets/bottom_navbar.dart';
import 'package:StunAi/bloc/generate_image_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String route = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: non_constant_identifier_names

  int index = 0;
  TextEditingController textEditingController = TextEditingController();
  final GenerateImageBloc bloc_generateimage = GenerateImageBloc();

  @override
  void initState() {
    bloc_generateimage.add(GenerateInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StunAi'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomnavBar(
        current_index: index,
      ),
      body: BlocConsumer<GenerateImageBloc, GenerateImageState>(
        bloc: bloc_generateimage,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case ErrorState:
              return const Center(
                child: Text('Something Went Wrong!'),
              );
            case SuccessState:
              final successState = state as SuccessState;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Image(
                                         image: MemoryImage(successState.file),
                                        height: 135,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: IconButton(
                                          icon: const Icon(Icons.favorite),
                                          onPressed: () async {},
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: IconButton(
                                          icon: const Icon(Icons.download),
                                          onPressed: () async {
                                            
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Material(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: TextField(
                                style: const TextStyle(color: Colors.black54),
                                controller: textEditingController,
                                onSubmitted: (value) async {},
                                decoration: const InputDecoration.collapsed(
                                  hintText: "Insert Text To generate Image",
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                if(textEditingController.text.isNotEmpty){
                                  bloc_generateimage.add(EnterTextEvent(text: textEditingController.text));
                                }
                              },
                              icon: const Icon(
                                Icons.send,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
