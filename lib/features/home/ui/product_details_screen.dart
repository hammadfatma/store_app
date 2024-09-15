import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/data/models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final ProductModel product;
  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600.h,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          product.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        background: Hero(
          tag: product.id as Object,
          child: Image.network(
            product.image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget characterInfo({required String title, required String value}) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30.h,
      endIndent: endIndent.w,
      color: Colors.yellowAccent,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: CustomScrollView(
          slivers: [
            buildSliverAppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        characterInfo(title: 'title: ', value: product.title),
                        buildDivider(315),
                        characterInfo(
                            title: 'price: ', value: product.price.toString()),
                        buildDivider(315),
                        characterInfo(
                            title: 'description: ', value: product.description),
                        buildDivider(315),
                        characterInfo(
                            title: 'category: ', value: product.category),
                        buildDivider(315),
                        characterInfo(
                            title: 'rate: ',
                            value: product.rating.rate.toString()),
                        buildDivider(315),
                        characterInfo(
                            title: 'count: ',
                            value: product.rating.count.toString()),
                        buildDivider(315),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 500.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
