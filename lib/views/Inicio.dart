import 'package:flutter/material.dart';
import 'package:youtube/Api/Api.dart';
import 'package:youtube/models/VideoModel.dart';
import 'package:youtube/views/VideoView.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Inicio extends StatefulWidget {

  var pesquisa = "";

  Inicio(this.pesquisa);


  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listarVideos(var pesquisa) {

    Api api = Api();

    return api.pesquisar(pesquisa.toString());
  }

  @override
  void initState() {
    super.initState();
    print('chamado 1 - initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('chamado 2 - didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant Inicio oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('chamado 2 - didUpdateWidget');
  }

  @override
  void dispose() {
    super.dispose();
    print('chamado 4 - dispose');
    
  }

  

  final style = TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {


    print('chamado 3 - Build');
    

    return FutureBuilder<List<VideoModel>>(
      future: _listarVideos(widget.pesquisa),
      builder: (context, snapshot) {
        switch(snapshot.connectionState){

          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
            break;
          
          case ConnectionState.active:
          case ConnectionState.done:
            if(snapshot.hasData) {

              return ListView.separated(
                itemBuilder: (context, index) {

                  List<VideoModel> videos = snapshot.data!;

                  VideoModel video = videos[index];

       

                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => VideoView(video.id, video.title) ));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(video.image)
                              )
                            ),
                          ),
                    
                          ListTile(
                            
                            textColor: Colors.white,
                            title: Text(video.title),
                    
                            subtitle: Text(video.description),
                          )
                        ],
                      ),
                    ),
                  );

                }, 
                separatorBuilder: (context, index) => SizedBox(
                  height:10,
                ),
                itemCount: snapshot.data!.length
              );

            } else{
              return Center(
              child: Text("Nenhum dado a ser exibido!"),
            );
            }
        }
      }
    );
  } 
}