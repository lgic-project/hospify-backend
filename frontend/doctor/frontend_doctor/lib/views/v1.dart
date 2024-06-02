import 'package:flutter/material.dart';
import 'package:frontend/controller/padetails.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final dataProvider = Provider.of<GetDataProvider>(context, listen: false);
    dataProvider.getMyData();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<GetDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shimmer Effect"),
      ),
      body: dataProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : dataProvider.responseData.data == null
              ? Center(child: Text("No data available"))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: dataProvider.responseData.data!.length,
                  itemBuilder: (ctx, i) {
                    final data = dataProvider.responseData.data![i];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(data?.fname ?? "N/A"),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(data?.email ?? "N/A"),
                                Text(data?.gender ?? "N/A"),
                              ],
                            ),
                          ),
                        ],
                      )),
                    );
                  }),
    );
  }
}
