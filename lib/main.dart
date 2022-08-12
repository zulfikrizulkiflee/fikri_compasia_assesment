import 'package:fikri_compasia_assesment/bloc/data_bloc.dart';
import 'package:fikri_compasia_assesment/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DataBloc()..add(LoadData())
        )
      ],
      child: MaterialApp(
        title: 'Albums',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Albums'),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: BlocBuilder<DataBloc, DataState>(
          builder: (context, state) {
            if (state is DataInitial) {
              return const CircularProgressIndicator();
            }
            if (state is DataLoaded) {
              return _buildDataList(context, state.data);
            }
            if (state is DataError) {
              return Text(state.message.toString());
            } else {
              return const Text('Something went wrong');
            }
          },
        )
      ),
    );
  }

  Widget _buildDataList(BuildContext context, List<Data> data) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        color: Colors.grey,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          child: Text(data[index].title.toString(), textAlign: TextAlign.left),
        );
      },
    );
  }
}
