import 'package:project_bloc/app/Clients/entities/client.dart';

class ClientsRepository {
  final List<Client> _clients = [];

  List<Client> loadClients() {
    _clients.addAll([
      Client(name: 'Aline'),
      Client(name: 'Felipe'),
    ]);

    return _clients;
  }

  List<Client> addClient({required Client client}) {
    _clients.add(client);

    return _clients;
  }

  List<Client> removeClient({required Client client}) {
    _clients.remove(client);

    return _clients;
  }
}
