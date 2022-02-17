import 'package:flutter/material.dart';
import 'package:university_detail/bloc_file.dart' ;
import 'package:university_detail/model/university_info.dart';

import 'Constant/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final blocfile =BlocFile();

@override
  void initState() {
    blocfile.eventSink.add(Act.Fetch);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent[100],
        title: Text('University Details', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Container(
        child:StreamBuilder<List<University>>(
          stream: blocfile.universityStream ,
          builder: (context, snapshot) {
            if(snapshot.hasError){
              return Center(child:Text(snapshot.error.toString()));
            }
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var name = snapshot.data![index].name;
                    var country = snapshot.data![index].country;
                    
                    return Container(
                      height: 100,
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  image,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          SizedBox(width: 16),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                
                                Text(
                                  name!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  country!,
                                  
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}