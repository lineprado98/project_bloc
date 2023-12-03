import 'dart:async';

import 'package:project_bloc/app/Clients/blocs/client_state.dart';
import 'package:project_bloc/app/Clients/blocs/client_event.dart';
import 'package:project_bloc/app/Clients/entities/client.dart';
import 'package:project_bloc/app/Clients/repositories/clients_repository.dart';

class ClientBloc {
  final _clientRepo = ClientsRepository();

  final StreamController<ClientEvent> _inputClientController = StreamController<ClientEvent>();
  final StreamController<ClientState> _outputClientController = StreamController<ClientState>();

  Sink<ClientEvent> get inputClient => _inputClientController.sink;
  Stream<ClientState> get stream => _outputClientController.stream;

  ClientBloc() {
    _inputClientController.stream.listen(_mapEventToState);
  }

  _mapEventToState(ClientEvent event) {
    List<Client> clients = [];
    if (event is LoadClientEvent) {
      clients = _clientRepo.loadClients();
    }
    if (event is AddClientEvent) {
      clients = _clientRepo.addClient(client: event.client);
    }

    if (event is RemoveClientEvent) {
      clients = _clientRepo.removeClient(client: event.client);
    }
    _outputClientController.add(ClientSuccessState(clients: clients));
  }
}
