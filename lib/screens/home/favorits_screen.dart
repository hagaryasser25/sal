import 'package:app_test/models/favorites_model.dart';
import 'package:app_test/widgets/favorites_item.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/home/home_cubit.dart';
import '../../cubit/home/home_state.dart';
import '../../shared/styles/colors.dart';

class FavoritsScreen extends StatelessWidget {
  const FavoritsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return ConditionalBuilder(
            condition: state is! HomeGetFavoritesLoadingState,
            builder: (context) => ListView.separated(
                itemBuilder: (context, index) => buildFavItem(cubit.favoritesModel!.data!.data[index], context),
                separatorBuilder: (context, index) => Divider(),
                itemCount: cubit.favoritesModel!.data!.data.length),
            fallback: (context) => Center(child: CircularProgressIndicator(),),
          );
        },
        listener: (context, state) {});
  }
}
