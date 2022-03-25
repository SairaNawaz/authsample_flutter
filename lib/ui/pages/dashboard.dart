import 'package:flutter/material.dart';
import 'package:flutter_uniutamademo/network/login_provider.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, baseMdl, _) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Dashboard"),
          ),
          body: ListView.builder(
            itemBuilder: (context, position) {
              return Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                            child: Text(
                              baseMdl.loginModel.data!.students![position].student!,
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                            child: Text(
                              baseMdl.loginModel.data!.students![position].status!,
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "5m",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.star_border,
                                size: 35.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 2.0,
                    color: Colors.grey,
                  )
                ],
              );
            },
            itemCount: baseMdl.loginModel.data!.students!.length,
          ),
        ),
      );
    });
  }
}
