import 'package:app_test/cubit/home/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/home_model.dart';
import '../shared/styles/colors.dart';

Widget buildGridProduct(ProductsModel model, context) {
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(alignment: AlignmentDirectional.bottomStart, children: [
          Image(
            image: NetworkImage('${model.image}'),
            width: double.infinity,
            height: 180,
          ),
          if (model.discount != 0)
            Container(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'DISCOUNT',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            )
        ]),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
            left: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model.name}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.w600, height: 1.2),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    '${model.price}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: defaultColor,
                        height: 1),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  if (model.discount != 0)
                    Text(
                      '${model.oldPrice.round()}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                          height: 1),
                    ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: HomeCubit.get(context).favorite[model.id]
                        ? defaultColor
                        : Colors.grey,
                    radius: 15,
                    child: IconButton(
                        color: Colors.white,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          HomeCubit.get(context).changeFavorites(model.id as int);
                        },
                        icon: Icon(
                          color: Colors.white,
                          Icons.favorite_border,
                          size: 14,
                        )),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
