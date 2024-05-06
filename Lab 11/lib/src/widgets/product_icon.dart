import 'package:flutter/material.dart';

import './extensions.dart';
import '../../src/themes/theme.dart';
import '../../src/model/category.dart';
import '../../src/themes/light_color.dart';
import '../../src/widgets/title_text.dart';

class ProductIcon extends StatelessWidget {
  // final String imagePath;
  // final String text;
  final ValueChanged<Category>? onSelected;
  final Category? model;
  const ProductIcon({Key? key, this.model, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return model?.id == null
        ? Container(width: 5)
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Container(
              padding: AppTheme.hPadding,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: model!.isSelected ? LightColor.background : Colors.white,
                border: Border.all(
                  color: model!.isSelected
                      ? LightColor.lightBlue
                      : LightColor.grey,
                  width: model!.isSelected ? 2 : 1,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: model!.isSelected
                        ? const Color.fromARGB(255, 239, 240, 251)
                        : Colors.transparent,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: const Offset(5, 5),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  model?.image != null
                      ? Image.asset(model!.image)
                      : const SizedBox(),
                  model?.name == null
                      ? Container()
                      : TitleText(
                          text: model!.name,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        )
                ],
              ),
            ).ripple(
              () {
                onSelected!(model!);
              },
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          );
  }
}
