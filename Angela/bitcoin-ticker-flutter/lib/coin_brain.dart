import 'package:bitcoin_ticker/network_helper.dart';

const String urlAPI =
    'https://pro-api.coinmarketcap.com/v1/tools/price-conversion';
const String apiKey = '0e9156b7-ecbb-4218-8683-424c551b308b';

class CoinBrain {
  Future<dynamic> getDataCoin(String symbol, String currency) async {
    String url =
        '$urlAPI?symbol=$symbol&amount=50&convert=$currency&CMC_PRO_API_KEY=$apiKey';

    return await NetworkHelper(url).getData();
  }

  Future<String> getPrice(String symbol, String currency) async {
    final data = await getDataCoin(symbol, currency);
    if (data != null) {
      return (data['data']['quote'][currency]['price'] as double)
          .toStringAsFixed(2);
    } else {
      return '-1';
    }
  }
}
