import 'package:app2/view/cal_page.dart';
import 'package:app2/view/card_page.dart';
import 'package:app2/view/home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ming dasturim"),
        bottom: TabBar(
          controller: tabController,
          tabs: const <Tab>[
            Tab(
              icon: Icon(Icons.currency_exchange_outlined),
              text: "Kurs",
            ),
            Tab(
              icon: Icon(Icons.calculate_outlined),
              text: "Kalkulyator",
            ),
            Tab(
              icon: Icon(Icons.credit_card_outlined),
              text: "Kartalar",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const <Widget>[
          HomePage(),
          Calculator(),
          BankCard(),
        ],
      ),
    );
  }
}
