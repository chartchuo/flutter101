import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main(List<String> args) {
  runApp(MaterialApp(
    home: BlocProvider(
        create: (BuildContext context) {
          var m = Model([]);
          m.items.add(ModelItem(DateTime.now(), '1111'));
          m.items.add(ModelItem(DateTime.now(), '2222'));
          m.items.add(ModelItem(DateTime.now(), '3333'));
          return ModelCubit(m);
        },
        child: Home()),
  ));
}

class ModelItem {
  late DateTime dateTime;
  late String text;

  ModelItem(this.dateTime, this.text);
}

class Model {
  late List<ModelItem> items;
  Model(this.items);

  Model.from(Model old) {
    this.items = old.items;
  }
}

class ModelCubit extends Cubit<Model> {
  ModelCubit(Model initialState) : super(initialState);
  void add(ModelItem m) {
    state.items.add(m);
    emit(Model.from(state));
  }

  void remove(ModelItem m) {
    state.items.remove(m);
    emit(Model.from(state));
  }
}

class Home extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ModelCubit, Model>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: state.items
                      .map((e) => ListTile(
                            title: Text(e.text),
                            subtitle: Text(e.dateTime.toString()),
                            trailing: IconButton(
                                onPressed: () {
                                  BlocProvider.of<ModelCubit>(context)
                                      .remove(e);
                                },
                                icon: Icon(Icons.delete)),
                          ))
                      .toList(),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: controller,
                  )),
                  TextButton(
                      onPressed: () {
                        BlocProvider.of<ModelCubit>(context)
                            .add(ModelItem(DateTime.now(), controller.text));
                        controller.clear();
                      },
                      child: Text('Add')),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
