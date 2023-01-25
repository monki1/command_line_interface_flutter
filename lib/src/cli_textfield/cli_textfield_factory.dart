import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
int maxLines = 50;

TextField cliTextFieldFactory(BehaviorSubject<String> onChangeStream, BehaviorSubject<String> onSubmitStream,
     TextEditingController controller,
     FocusNode focusNode, InputDecoration decoration) {
  //change to take stream, then sink the stream
  //


  TextField t =  TextField(
    onSubmitted: (String s){
      controller.clear();
      focusNode.requestFocus();//keep focused
      onSubmitStream.add(s);
    },
    onChanged: (String s){
      onChangeStream.add(s);
    },
    focusNode: focusNode,
    autofocus: true,
    controller: controller,
    decoration: decoration,
    minLines: 1,
    maxLines: maxLines,
  );
  return t;
}
// superTextFieldStreamBuilder(BehaviorSubject<String> autofill, BehaviorSubject<String> submit, BehaviorSubject<String> onChanged, BehaviorSubject<TextInputType> keyboardType,   FocusNode focusNode
// ){
//
//   return
//     StreamBuilder(
//         stream: keyboardType.stream,
//         builder: (BuildContext context, AsyncSnapshot<TextInputType> snapshot){
//           return superTextFieldFactory(autofill, submit, onChanged, focusNode, keyboardType: snapshot.data ?? TextInputType.text);
//         }
//     );
// }
