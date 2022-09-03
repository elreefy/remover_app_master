import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remover_app/business_logic/news_cubit/remover_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RemoverCubit cubit = RemoverCubit.get(context);
    return BlocConsumer<RemoverCubit, RemoverState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Container(
                child: cubit.image == null
                    ? Center(child: Text(
                  'No image selected.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                )) : Image.file(cubit.image!,
                fit: BoxFit.cover,
                ),
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(
               color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                cubit.getImageFromGallery();
              },
              child: Text('Pick Image'),
            ),
            Center(
              child: Container(
                child: cubit.imageAfterRemover == null
                    ? Center(child: Text(
                  'No image selected.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )) : Image.memory(
                  cubit.imageAfterRemover!,
                  fit: BoxFit.cover,
                ),
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                cubit.postImageToServer();
              },
              child: Text('upload Image'),
            ),

          ],
        ),
      ),
    );
  },
);
  }
}
