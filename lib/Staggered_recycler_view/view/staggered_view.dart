import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/Staggered_recycler_view/provider/Staggered_provider.dart';

class Staggerred_view extends StatefulWidget {
  const Staggerred_view({Key? key}) : super(key: key);

  @override
  State<Staggerred_view> createState() => _Staggerred_viewState();
}

class _Staggerred_viewState extends State<Staggerred_view> {
  Staggered_provider? pT;
  Staggered_provider? pF;
  @override
  Widget build(BuildContext context) {
    pT = Provider.of<Staggered_provider>(context, listen: false);
    pF = Provider.of<Staggered_provider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Staggered Grid View",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),elevation: 1,
        backgroundColor: Colors.teal,
      ),
      body: GridView.custom(
        gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          pattern: [
            WovenGridTile(1),
            WovenGridTile(
              5 / 7,
              crossAxisRatio: 0.8,
              alignment: AlignmentDirectional.centerEnd,
            ),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: pT!.Images.length,
          (context, index) {
            return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  SizedBox(
                  height: 5,
                ),
                Container(
                  height: 150,
                  width: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "${pF!.Images[index]}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(left: 5,top: 4),
                  child: Text(
                    "${pF!.Name[index]}",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
              ),
            );
          },
        ),
      ),
    ));
  }
}
