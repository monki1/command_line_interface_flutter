import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget cliListViewFactory(
    Stream<List<Widget>> stream, ScrollController scrollController) {
  //display in a scrollable list
  return StreamBuilder(
    stream: stream,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        ///
        return
            // Container(
            //   height: double.infinity,
            //   child:

            CustomScrollView(

                ///slivers
                slivers: [
              // SliverAppBar(),
              SliverFillRemaining(
                  child: ListView.builder(
                controller: scrollController,
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  Widget item = snapshot.data![index];
                  return Container(child: item);
                },
              )),
            ]);
        // CustomScrollView(
        //   slivers: [
        //     SliverFixedExtentList(
        //       itemExtent: 100,
        //       delegate: SliverChildBuilderDelegate(
        //             (BuildContext context, int index) {
        //           Widget item = snapshot.data![index];
        //           return item;
        //         },
        //       ),
        //     )
        //   ],
        // )
        // ]
        // );
        // );
        // )
        //     ;
      } else if (snapshot.hasError) {
        return Text("Error: ${snapshot.error}");
      } else {
        return const CircularProgressIndicator();
      }
    },
  );
}
