import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:crypto_coins_list_app/repositories/models/crypto_coin_model.dart';

class CryptoCoinsRepository {
  Future<List<CryptoCoinModel>> getCoinsList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX,AID,SQL,CAG,DOV&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final dataList = dataRaw.entries.map((e) {
      final USDData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = USDData['PRICE'];
      final imgUrl = USDData['IMAGEURL'];
      return CryptoCoinModel(
        name: e.key,
        priceInUSD: price,
        imageUrl: 'https://www.cryptocompare.com' + imgUrl,
      );
    }).toList();
    return dataList;
  }
}
