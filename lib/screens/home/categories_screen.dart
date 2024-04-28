import 'package:app_test/cubit/home/home_cubit.dart';
import 'package:app_test/cubit/home/home_state.dart';
import 'package:app_test/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return ListView.separated(
              itemBuilder: (context, index) => buildCatItem(cubit.categoriesModel!.data!.data[index]),
              separatorBuilder: (context, index) => Divider(),
              itemCount: cubit.categoriesModel!.data!.data.length);
        },
        listener: (context, state) {});
  }

  Widget buildCatItem(DataCategoriesModel model) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Image(
            image: NetworkImage(
                '${model.image}'),
            fit: BoxFit.cover,
            height: 80,
            width: 80,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            '${model.name}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
  }
}
