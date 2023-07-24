import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:easylearning/screens/quiz_subjects.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ui/widgets/navbar.dart';

class ViewResults extends StatefulWidget {
  const ViewResults({super.key});

  @override
  State<ViewResults> createState() => _ViewResultsState();
}

class _ViewResultsState extends State<ViewResults> {

  @override
  void initState() {
    getData();
    super.initState();
  }
  final List<QuizData> data=[];
  List result=[];
  String? selectedValue;
  String? selectedScore;

  void getData() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    result=json.decode(sharedPreferences.get('results').toString());
    for(int i=0;i<result.length;i++){
      data.add(QuizData(year:DateFormat('MMM dd, yyyy hh:mm a').format(DateTime.parse(result[i]['time'])), population: result[i]['score']));
    }
    setState(() {
      _getSeriesData();
    });
    print(result);
  }

  _getSeriesData() {
    List<charts.Series<QuizData, String>> series = [
      charts.Series(
        id: "Scores",
        data:data,
        domainFn: (QuizData series, _) => series.year.toString(),
        measureFn: (QuizData series, _) => series.population,
        fillPatternFn: (_,__)=>charts.FillPatternType.solid,
        colorFn: (_,__)=>charts.ColorUtil.fromDartColor(Colors.orange),// Legend color
        fillColorFn: (QuizData series,_)=> charts.ColorUtil.fromDartColor(Colors.orange), //column color.
        insideLabelStyleAccessorFn: (QuizData series, _)=>charts.TextStyleSpec(color: charts.ColorUtil.fromDartColor(Colors.white)),
        labelAccessorFn: (QuizData series, _)=> series.year.toString(),
      )
    ];
    return series;
}

void _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    setState(() {
      if (selectedDatum.isNotEmpty) {
        selectedValue = selectedDatum.first.datum.year.toString();
        selectedScore=selectedDatum.first.datum.population.toString();
        print(selectedValue);
      } else {
        selectedValue = null;
        selectedScore= null;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Quiz Results',  style: GoogleFonts.rubikBubbles(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w100),
        ),),
      drawer: const NavBar(),
      body: result.isNotEmpty?
      ListView(children: [
       Container(
          margin: const EdgeInsets.only(top: 10),
          height: 400,
          padding:const EdgeInsets.only(left: 20,right: 20, top: 10),
          child: Card(
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0,top: 8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Scores",
                    style: GoogleFonts.rubikDirt(
                      fontSize: 34,
                      color: const Color.fromRGBO(59, 107, 170, 1),
                      ),
                  ),
                  if(selectedValue!=null)...{
                  const SizedBox(height: 20,),
                  Text(
                    "Date : $selectedValue",
                    style:const TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(59, 107, 170, 1),
                      ),
                  ),
                  Text(
                    "Score : $selectedScore",
                    style:const TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(59, 107, 170, 1),
                      ),
                  ),
                  },
                  const SizedBox(height: 20,),
                  Expanded(
                    child: charts.BarChart(
                      _getSeriesData(), 
                      animate: true,
                      primaryMeasureAxis: const charts.NumericAxisSpec(showAxisLine: true, ),
                      domainAxis: const charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),
                      selectionModels: [
                          charts.SelectionModelConfig(
                            type: charts.SelectionModelType.info,
                            changedListener: _onSelectionChanged,
                          ),
                      ],
                      behaviors: [
                          charts.SeriesLegend(),
                          charts.ChartTitle('Date & Time', behaviorPosition: charts.BehaviorPosition.bottom),
                          charts.ChartTitle('Scores', behaviorPosition: charts.BehaviorPosition.start),
                       ],
                      animationDuration:const Duration(seconds: 3),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
         ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: result.length,
          itemBuilder: (context, i){
            return 
             Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child:
              Card(
                elevation: 20,
                child: 
                ListTile(
                  title:
                  Row(children: [
                  Text("Score : ", style: GoogleFonts.rubikDirt(fontSize: 34, color: const Color.fromRGBO(59, 107, 170, 1),),) ,
                  Text(result[i]['score'].toString(), style: GoogleFonts.rubikBubbles(fontSize: 34, color: Colors.orange),) ,
                  ]),
                  subtitle: Text("Date : ${DateFormat('MMM dd, yyyy hh:mm:ss a').format(DateTime.parse(result[i]['time']))}", style: const TextStyle(fontSize: 18, color: Color.fromRGBO(59, 107, 170, 1),),),
                )
                )
              );
            },
          ),]):Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              child:
              Center(child: Text("No results to show",style: GoogleFonts.rubikDirt(
                fontSize: 34,
                color: const Color.fromRGBO(59, 107, 170, 1),
              ),),
              ),
            ),
            const SizedBox(height: 10,),
            TextButton(
              onPressed:() {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => const QuizSubjects()));
              },
              child: Container(
              color: const Color.fromRGBO(59, 107, 170, 1),
              padding: const EdgeInsets.all(14),
              child: const Text(
                'Take a Quiz',
                style: TextStyle(color: Colors.white),
              ),
              ),
            ),
          ],
        ),
      );
  }
}

class QuizData {
  String year;
  int population;
  QuizData({
    required this.year, 
    required this.population,
  });
}

