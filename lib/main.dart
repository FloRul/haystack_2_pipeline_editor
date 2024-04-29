import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/editor_view.dart';
import 'package:haystack_2_pipeline_editor/presentation/sidebar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haystack 2 visual editor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(14, 175, 156, 1)),
        useMaterial3: true,
      ),
      home: const Home(
        title: 'Haystack 2 visual editor',
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
      body: Row(
        children: [
          Sidebar(
            onDestinationSelected: (index) {},
          ),
          const Expanded(
            child: EditorView(),
          ),
        ],
      ),
    );
  }
}

class EditorView extends StatelessWidget {
  const EditorView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        // Align(
        //   alignment: const Alignment(-1, -1),
        //   child: Container(
        //       color: Theme.of(context).colorScheme.surface,
        //       width: 200,
        //       height: 200,
        //       child: const Column(
        //         children: [
        //           Text('Node 1'),
        //           Text('Node 2'),
        //           Text('Node 3'),
        //         ],
        //       )),
        // ),
        EditorScreen(),
      ],
    );
  }
}
