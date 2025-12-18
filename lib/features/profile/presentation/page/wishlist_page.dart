import 'package:flutter/material.dart';

import '../../../../presentation/components/go_back_button.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),

      body: Padding(
          padding: EdgeInsets.only(top: size.height * 0.06, left: size.width * 0.04, right: size.width * 0.04),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GoBackButton(
                    buttonBackColor: const Color(0xFFD9D9D9),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                const Text(
                  'Wishlist',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Expanded(
                child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.2,
                  ),
                  SizedBox(
                      height: size.height * 0.15,
                      width: size.height * 0.15,
                      child: const Image(image: AssetImage('assets/images/im_attention.png'))),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.7,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xFFECECEC)),
                    alignment: Alignment.center,
                    child: const Text(
                      'sizin səbətiniz boşdur',
                      style: TextStyle(color: Color(0xFF595959), fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            )
                // return ListView.builder(
                //   itemCount: favoriteController.favorites.length,
                //   itemBuilder: (context, index) {
                //     ProductModel favItem = favoriteController.favorites[index];
                //     return WishedItem(
                // addToCart: () {
                //   List<ProductModel> products =
                //       productController.productElements;
                //   ProductModel model = products.elementAt(
                //       products.indexWhere((element) =>
                //           element.productId == favItem.productId));

                //   if (cartController.localNumberOfCurrentElement(
                //           prodId: model.productId) ==
                //       0) {
                //     cartController.addToLocalCartWithBack(
                //         model: CartModel(
                //             // availableNumber: model.availableNumber,
                //             //  imageUrl: model.imageUrl[0],
                //             numberOfOrder: 1,
                //             prize: model.prize,
                //             drawDate: model.drawDate,
                //             //  soldNumber: model.soldNumber,
                //             whatYouWillBuy: model.whatYouWillBuy,
                //             productId: model.productId,
                //             category: model.category));

                //     showSnackbar(
                //         title: 'Uğurlu əməliyyat',
                //         body: 'Məhsul səbətə uğurla əlavə olundu!',
                //         backGroundColor: Colors.green);
                //   } else {
                //     showSnackbar(
                //         title: 'Bildiriş!',
                //         body:
                //             'Siz artıq bu məhsulu səbətə əlavə etmisiniz!',
                //         backGroundColor: Colors.green);
                //   }
                // },
                //   prizeNaame: favItem.prize,
                //   youWillBuy: favItem.whatYouWillBuy.toString(),
                //   imageUrl: favItem.imageUrl[0],
                //   onDelete: () {
                //     favoriteController.toggleFavorite(userUid: authController.user.uid, productId: favItem.productId);
                //   },
                // );
                // },
                // );
                )
          ])),
    );
  }
}
