import 'package:flutter_app/data/network/endpoints.dart';
import 'package:flutter_app/data/network/rest_client.dart';
import 'package:flutter_app/models/accounts_model.dart';

class AccountsViewModel {
  RestClient resClient = RestClient();
  // var getRes = await rc.get(Endpoints.getAccounts);
  Future<List<AccountsModel>> getAccounts() async {
    final response = await resClient.get(Endpoints.getAccounts);
    print(response);
    return profileFromJson(response.toString());
  }
}
