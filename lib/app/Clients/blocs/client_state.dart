import 'package:project_bloc/app/Clients/entities/client.dart';

abstract class ClientState {
  final List<Client> clients;

  ClientState({required this.clients});
}

class ClientInitialState extends ClientState {
  ClientInitialState() : super(clients: []);
}

class ClientSuccessState extends ClientState {
  ClientSuccessState({required List<Client> clients}) : super(clients: clients);
}


//TODO: CREATE A  STATE FOR ERROR 
