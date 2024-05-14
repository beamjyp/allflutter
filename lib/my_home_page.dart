import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:allflutter/bloc/data_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Center(
        child: BlocBuilder<DataBloc, DataState>(
          builder: (context, state) {
            if (state is DataInitialState) {
              return const Text('fetch data');
            } else if (state is DataLoadedState) {
              return Text('Data: ${state.data}');
            } else if (state is DataErrorState) {
              return Text('Error: ${state.message}');
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<DataBloc>(context).add(FetchDataEvent());
        },
        tooltip: 'Fetch Data',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
