import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Widget/Widgets.dart';


class InquiryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InquiryPageState();
  }
}

class InquiryPageState extends State<InquiryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Provider.of<General>(context, listen: false).appbar(context),
        drawer: Provider.of<General>(context, listen: false).drawer(context),
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                gradient: SweepGradient(
                    startAngle: 0.7,
                    colors: [
                      Colors.greenAccent,
                      Colors.lightGreen,
                      Colors.greenAccent
                    ]
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Divider(),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text('For Enquiries,Complains and FeedBack Click the button Below to Contact Us',
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: (){
                        return null;
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          width: 100,
                          height: 40,
                          child: Center(child: Text('Contact Us', style: TextStyle(color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)))
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text('For Advert Placement Click the Button Below to Contact Us',
                      style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: InkWell(
                        onTap: (){
                          return null;
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)
                            ),
                            width: 120,
                            height: 40,
                            child: Center(child: Text('Place Advert', style: TextStyle(color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)))
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Divider(),
                ],
              ),
              padding: EdgeInsets.only(top: MediaQuery
                  .of(context)
                  .size
                  .height /4.5),
            ),
          ],
        ),
      );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
