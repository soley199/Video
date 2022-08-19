import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

void main() => runApp(BackgroundVideo());

class BackgroundVideo extends StatefulWidget {
  @override
  _BackgroundVideoState createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
 
  late VideoPlayerController _controller;

  
  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _controller = VideoPlayerController.asset("assets/cana.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Adjusted theme colors to match logo.
        primaryColor: Color(0xffb55e28),
        accentColor: Color(0xffffd544),
      ),
      home: SafeArea(
        child: Scaffold(
          
          body: Stack(
            children: <Widget>[
              
              SizedBox.expand(
                child: FittedBox(
                  // If your background video doesn't look right, try changing the BoxFit property.
                  // BoxFit.fill created the look I was going for.
                  fit: BoxFit.fill,
                  child: SizedBox(
                    width: _controller.value.size?.width ?? 0,
                    height: _controller.value.size?.height ?? 0,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
              LoginWidget()
            ],
          ),
        ),
      ),
    );
  }

 
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

// A basic login widget with a logo and a form with rounded corners.
class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Center(
            child: Image(
              image: AssetImage("assets/cana.png"),
              width: 250.0,
            ),
          ),
        ),
        SizedBox(
          height: 0.0,
        ),
        Container(
          decoration: new BoxDecoration(
           
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0),
              bottomLeft: const Radius.circular(10.0),
              bottomRight: const Radius.circular(10.0),
            ),
          ),
          padding: EdgeInsets.all(16),
          width: 300,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              
              ButtonTheme(
                minWidth: 300.0,
                height: 50,
                child: RaisedButton(
                  color: Color(0XFF1E88E5).withOpacity(0.6),
                  child: Text(
                    'Catalogo',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  onPressed: () {},
                ),
              ),
              ButtonTheme(
                minWidth: 300.0,
                height: 50,
                child: RaisedButton(
                  color: Color(0XFF1E88E5).withOpacity(0.6),
                  child: Text(
                    'Lineas de Producto',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  onPressed: () {},
                ),
              ),
              ButtonTheme(
                minWidth: 300.0,
                height: 50,
                child: RaisedButton(
                  color: Color(0XFF1E88E5).withOpacity(0.6),
                  child: Text(
                    'DistriBuidores',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  onPressed: () {},
                ),
              ),
              ButtonTheme(
                minWidth: 300.0,
                height: 50,
                child: RaisedButton(
                  color: Color(0XFF1E88E5).withOpacity(0.6),
                  child: Text(
                    'Contacto',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  onPressed: () {},
                ),
              ),
              ButtonTheme(
                minWidth: 300.0,
                height: 50,
                child: RaisedButton(
                  color: Color(0XFF1E88E5).withOpacity(0.6),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  onPressed: () {},
                ),
              ),
              
            ],
          ),
        ),
      ],
    );
  }
}
