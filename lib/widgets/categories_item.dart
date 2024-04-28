import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/categories_model.dart';

Widget buildCategoryItem(DataCategoriesModel model) =>
      Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        Image(
          image: NetworkImage(
              '${model.image}'),
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(0.8),
          width: 100,
          child: Text('${model.name}',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(color: Colors.white)),
        )
      ]);