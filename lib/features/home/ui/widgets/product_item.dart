import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/home/data/models/product_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productModel});
  final ProductModel productModel;
  Widget textItem(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 10.sp,
        color: Colors.black,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      textAlign: TextAlign.center,
    );
  }

  Widget itemButton({
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
  }) {
    return ClipOval(
      child: Container(
        width: 32.w,
        height: 32.h,
        decoration: BoxDecoration(color: backgroundColor, boxShadow:  [
          BoxShadow(
            color: Colors.black45.withOpacity(0.34),
            offset: const Offset(0, 10),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ]),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          Routes.productDetailsScreen,
          arguments: productModel,
        ),
        child: Stack(
          children: [
            GridTile(
              footer: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                color: Colors.white,
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textItem(productModel.title),
                    textItem(productModel.description),
                    textItem('EGP ${productModel.price}'),
                    Row(
                      children: [
                        textItem('Review (${productModel.rating.rate})'),
                        const Icon(
                          Icons.star,
                          color: Colors.yellowAccent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              child: Hero(
                tag: productModel.id as Object,
                child: Container(
                  color: Colors.grey,
                  child: productModel.image.isNotEmpty
                      ? FadeInImage.assetNetwork(
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                          placeholder: 'assets/images/loading.gif',
                          image: productModel.image)
                      : Image.asset('assets/images/no_internet.png'),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: itemButton(
                icon: Icons.favorite_border_outlined,
                iconColor: Colors.blueAccent,
                backgroundColor: Colors.white,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: itemButton(
                icon: Icons.add,
                iconColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
