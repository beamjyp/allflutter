import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:allflutter/api/api_service.dart';
import 'package:allflutter/repo/data_repository.dart';
import 'package:allflutter/my_home_page.dart';
import 'bloc/data_bloc.dart';

void main() {
  final apiService = ApiService("https://jsonplaceholder.typicode.com");
  final dataRepository = DataRepository(apiService);

  runApp(
    MaterialApp(
      home: BlocProvider<DataBloc>(
        create: (context) => DataBloc(dataRepository),
        child: const MyHomePage(),
      ),
    ),
  );
}
