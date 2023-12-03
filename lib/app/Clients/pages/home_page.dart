import 'package:flutter/material.dart';
import 'package:project_bloc/app/Clients/blocs/client_bloc.dart';
import 'package:project_bloc/app/Clients/blocs/client_event.dart';
import 'package:project_bloc/app/Clients/blocs/client_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final ClientBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ClientBloc();

    bloc.inputClient.add(LoadClientEvent());
  }

  @override
  void dispose() {
    bloc.inputClient.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: StreamBuilder<ClientState>(
          stream: bloc.stream,
          builder: (context, AsyncSnapshot<ClientState> snapshot) {
            final clientsList = snapshot.data?.clients ?? [];
            return ListView.separated(
              itemCount: clientsList.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) => ListTile(
                title: Text(clientsList[index].name),
              ),
            );
          }),
    );
  }
}
