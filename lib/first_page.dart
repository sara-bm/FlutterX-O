
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:xo/Class_Buttons.dart';



class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
late List<GameButton> buttonsList;
class _HomePageState extends State<HomePage> {
 //@override
 List<int> player1 = [];
 List<int> player2 = [];
// ignore: prefer_typing_uninitialized_variables
var activeP;
bool vsComputer=true;
 @override
  void initState(){
    super.initState();
  buttonsList=listInitialisation();

  }
 

  List<GameButton> listInitialisation()
  {
    activeP=1;
  // ignore: deprecated_member_use
   player1= [];
  // ignore: deprecated_member_use
  player2=[];
  
    var gameButtons=<GameButton>[
       GameButton(id:1),
       GameButton(id:2),
       GameButton(id:3),
       GameButton(id:4),
       GameButton(id:5),
       GameButton(id:6),
       GameButton(id:7),
       GameButton(id:8),
       GameButton(id:9),

    ];
  
    return gameButtons;
  }
 void playGame(GameButton gb) 
  {
  if(activeP==1)
  {gb.text="X";
  gb.bg=Colors.red.shade300;
  activeP=2;
  player1.add(gb.id);
  }
  else{
    gb.text="O";
    gb.bg=Colors.black;
   player2.add(gb.id);
   activeP = 1;
  }

gb.enabled=false;


 int winner = lockforwinner();
 print(player2.length);
 if(player2.length==5 || player1.length==5)
{
   
   showDialog(context: context, builder: (context){
     
   return AlertDialog(
     backgroundColor: Colors.yellow,
     
   title:Text('Result'),
 
    actions: <Widget>[
        TextButton(
          onPressed: reset,
          
        style: TextButton.styleFrom(
         backgroundColor:Colors.yellow, 
        ),
        
          child: new Text('This game is a tie',style:TextStyle(fontSize: 24),),
        ),
    ],  
   ); 
   },
   );
 } 
 
 
 
 
           
        
    
setState(() {
  
});
}
int lockforwinner()
{
     var winner = 0;
    /*winner bch n7to fuh 1 kan player 1 rbe7 w 2 kan player 2 rbe7 w kan 
      rbe7 7ad yb9a -1*/
    //chway conditionat bch nlgo 3 bottonat wra b3thhom w n3rfo rab7
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }

    // row 2
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }

    // row 3
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    // col 1
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }

    // col 2
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }

    // col 3
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }

    //diagonal
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }
    print(winner);

 if(winner== 1 || winner==2)
 {
   
   showDialog(context: context, builder: (context){
   return AlertDialog(
   title:Text('Result'),
 
    actions: <Widget>[
        TextButton(
          onPressed: reset,
          
        style: TextButton.styleFrom(
          backgroundColor:Colors.white10, 
        ),
          child: new Text('Player $winner won'),
        ),
    ],  
   ); 
   },
   );
 }

  




return winner;
}
void reset()
{
  /*if(Navigator.canPop(context)) Navigator.pop(context);*/

  setState(() {
    buttonsList=listInitialisation();
  });
/*setState(() {
  theme:new ThemeData(primaryColor:Colors.black);
home:new HomePage();
});*/
  
}

  /*@override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }*/
  late Color c;
  @override
  
  Widget build(BuildContext context) {
     
    return Scaffold(
      backgroundColor:Colors.black,
      appBar:AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
       title:const Text('Tic Tac Toe'),
      ),
body:

Center(
  
child:Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment:CrossAxisAlignment.center,

 children:<Widget>[
   Expanded(
  child: GridView.builder( 
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
  childAspectRatio: 1.0,
  crossAxisSpacing: 9.0,
  mainAxisSpacing: 9.0,

  ),
  itemCount : buttonsList.length,
  itemBuilder: (context,i)
  {
    return SizedBox(
      width:100.0,
      height:100.0,
      // ignore: deprecated_member_use
    //  children : <Widget>[
      child:  TextButton(
        // padding:const EdgeInsets.all(8.0),
        
        style: TextButton.styleFrom(
          backgroundColor:buttonsList[i].bg 
        ),
        onPressed:buttonsList[i].enabled? ()=> playGame(buttonsList[i]) :null,
     
      child:Text(buttonsList[i].text,style:TextStyle(color:Colors.grey,fontSize:20.0)),
      
     // ButtonStyle.backgroundColor:buttonsList[i].bg,
      //disabledColor:buttonsList[i].bg,
      
      ),

     
      
    );

   
  }
  ),


   ),
     FloatingActionButton(
      onPressed: reset,
     tooltip: 'Reset',
     child:const Icon(Icons.restart_alt)
    ),
 ],
 
),

),
    );
      
    
  }
  
}




