import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resplash/model/wallpaper_model.dart';
import 'package:resplash/views/image_view.dart';

Widget brandName() {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,),
      children: const <TextSpan>[
        TextSpan(text: 'Re', style: TextStyle(color: Colors.blue,)),
        TextSpan(text: 'Splash', style: TextStyle(color: Colors.black87,)),
      ],
    ),
  );
}

Widget wallpapersList({required List<WallpaperModel> wallpapers, context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,        //this ratio is the ratio between height and width between of the image in grid view
      mainAxisSpacing:  6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper){
        return GridTile(
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ImageView(
                      imgUrl: wallpaper.src.portrait,
                    )
                ));
              },
              child: Hero(
                tag: wallpaper.src.portrait,
                child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(wallpaper.src.portrait, fit: BoxFit.cover,)),
                ),
              ),
            )
        );
      }).toList(),
    ),
  );
}