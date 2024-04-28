import 'package:app_test/models/favorites_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../cubit/home/home_cubit.dart';
import '../shared/styles/colors.dart';

Widget buildFavItem(ProductData model , context) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Container(
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child:
                Stack(alignment: AlignmentDirectional.bottomStart, children: [
              Image(
                image: NetworkImage(
                    '${model.product!.image}'),
                width: 120,
                height: 120,
              ),
              if (model.product!.discount != 0)
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
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.product!.name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w600, height: 1.2),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      '${model.product!.price}',
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
                    if (model.product!.discount != 0)
                      Text(
                        '${model.product!.old_price}',
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
                      backgroundColor:
                           HomeCubit.get(context).favorite[model.product!.productId]
                           ? defaultColor : Colors.grey,
                      radius: 15,
                      child: IconButton(
                          color: Colors.white,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                             HomeCubit.get(context).changeFavorites(model.product!.productId as int);
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
    ),
  );
}
