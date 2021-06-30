import 'package:api_task/models/factResponse.dart';
import 'package:api_task/services/dataServices.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  //const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataServices dataServices=DataServices();
  late FactResponse  factResponse;

  late List<Data> dataList =[];

    fetchData()async{
      factResponse= await dataServices.getData();
      dataList=factResponse.data;
    }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Users details"),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: dataServices.getData(),
          builder:(context,snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 15,
                        color: Colors.white,
                        shadowColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(dataList[index].firstName,
                                  style: const TextStyle(
                                      fontSize: 20, fontWeight: FontWeight
                                      .bold),),
                                Text(
                                  dataList[index].lastName, style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight
                                    .bold),),
                                const SizedBox(height: 10,),
                                Text(dataList[index].email, style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight
                                    .bold),),
                                const SizedBox(height: 10,),
                                Text(dataList[index].id.toString(),
                                  style: const TextStyle(
                                      fontSize: 15, fontWeight: FontWeight
                                      .bold),),


                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                  height: 120,
                                  width: 120,

                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.network(
                                        dataList[index].avatar,
                                        fit: BoxFit.cover,))),
                            ),

                          ],
                        )
                    );
                  }
              );
            }
            else {
              return const CircularProgressIndicator();
            }
          }
       )));
  }
}
