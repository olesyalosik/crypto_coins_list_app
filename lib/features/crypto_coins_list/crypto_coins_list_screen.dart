import 'package:crypto_coins_list_app/repositories/crypto_coins_repository/crypto_coins_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crypto_coins_list_app/repositories/models/crypto_coin_model.dart';

class CryptoCoinsListScreen extends StatefulWidget {
  const CryptoCoinsListScreen({
    super.key,
  });

  @override
  State<CryptoCoinsListScreen> createState() => _CryptoCoinsListScreenState();
}

class _CryptoCoinsListScreenState extends State<CryptoCoinsListScreen> {
  List<CryptoCoinModel>? _cryptoCoinsList;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'CryptoCurrenciesList',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: (_cryptoCoinsList == null)
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => Divider(
                    color: Theme.of(context).dividerColor,
                  ),
              padding: EdgeInsets.only(
                top: 15.0,
              ),
              itemCount: _cryptoCoinsList!.length,
              itemBuilder: (context, i) {
                final CryptoCoinModel coin = _cryptoCoinsList![i];
                return ListTile(
                  leading: SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.network(coin.imageUrl)),
                  title: Text(
                    coin.name,
                    style: theme.textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    '${coin.priceInUSD}\$',
                    style: theme.textTheme.labelSmall,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/coin',
                      arguments: coin,
                    );
                  },
                );
              }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () async {
            _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
            setState(() {});
          },
          child: const Icon(
            Icons.refresh,
          )),
    );
  }
}
