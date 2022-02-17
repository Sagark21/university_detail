import 'dart:async';

import 'package:university_detail/model/university_info.dart';
import 'package:university_detail/services/api_manager.dart';


enum Act{ Fetch }
API_Manager api_manager =API_Manager();

class BlocFile{
  final _stateStreamController = StreamController<List<University>>();
  StreamSink<List<University>> get _universitySink => _stateStreamController.sink;
  Stream<List<University>> get universityStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<Act>();
  StreamSink<Act> get eventSink => _eventStreamController.sink;
  Stream<Act> get _eventStream => _eventStreamController.stream;

BlocFile(){
  _eventStream.listen((event)  async{
    if(event==Act.Fetch){
      try {
        var universitylist = await api_manager.getlist();
        if(universitylist!= null){
        List<University>? university = universitylist.university;
        _universitySink.add(university!);}
        else {
          _universitySink.addError("Something went wrong");
        }
      } on Exception catch (e) {
        _universitySink.addError("Something went wrong");
      }

    }
  });
}


}