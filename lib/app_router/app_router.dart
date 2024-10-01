import 'package:crypto_coins_list_app/features/crypto_coins_list/crypto_coins_list.dart';

import '../features/crypto_coin/crypto_coin.dart';

final routes = {
  '/': (context) => CryptoCoinsListScreen(),
  '/coin': (context) => CryptoCoinScreen(),
};
