import 'package:app2/model/curreny_model.dart';
import 'package:app2/service/curreny_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  RefreshIndicator build(BuildContext context) {
    return RefreshIndicator(
      child: FutureBuilder(
        future: CurrencyService.getCurrency(),
        builder: (context, AsyncSnapshot snapshot) {
          // ma'lumot bormi ?
          if (!snapshot.hasData) {
            return const Center(
              child: Image(image: AssetImage("assets/image/200w.gif")),
            );
          }

          // xatolik
          else if (snapshot.data is String) {
            return Center(
              child: Text(
                snapshot.error.toString().isEmpty
                    ? "Ma'lumot yo'q"
                    : "Qaytadan urunib ko'ring...",
                style: const TextStyle(fontSize: 25),
              ),
            );
          }
          // boiz kutgan natija
          else {
            List<CurrenyModel> data = snapshot.data as List<CurrenyModel>;
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      data[index].title.toString(),
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    // : ,
                    trailing: Text(
                      "${data[index].cbPrice.toString()} so'm",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
              itemCount: data.length,
            );
          }
        },
      ),
      onRefresh: () => CurrencyService.getCurrency(),
    );
  }
}
