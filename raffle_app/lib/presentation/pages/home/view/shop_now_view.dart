// import 'package:flutter/material.dart';

// import '../../../../shared/couple_buttons.dart';
// import '../widgets/pageview_image_widget.dart';

// class ShopNowScreen extends StatefulWidget {
//   final String drawDate;
//   final String prodId;
//   final String whatYouWillWin;
//   final String prizeName;
//   final String youWillBuy;
//   final String prizeDetail;
//   final String productDetail;
//   final int totalNumber;
//   final bool addMore;
//   final List<String> imageUrl;
//   final List<String?> littleImageUrl;
//   //final VoidCallback onPressed;
//   final int category;

//   final int soldNumber;
//   final String date;
//   final String whatWillYouWin;

//   const ShopNowScreen({
//     super.key,
//     required this.whatYouWillWin,
//     required this.totalNumber,
//     required this.drawDate,
//     required this.prodId,
//     required this.imageUrl,
//     this.addMore = false,
//     required this.prizeName,
//     required this.youWillBuy,
//     required this.littleImageUrl,
//     required this.prizeDetail,
//     required this.productDetail,
//     //required this.onPressed,
//     required this.category,
//     required this.soldNumber,
//     required this.date,
//     required this.whatWillYouWin,
//   });

//   @override
//   State<ShopNowScreen> createState() => _ShopNowScreenState();
// }

// class _ShopNowScreenState extends State<ShopNowScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final PageController pgController = PageController(keepPage: true);
//     TextEditingController selectQuantityTextField = TextEditingController();
//     // final FavoriteController favoriteController = Get.put(FavoriteController());
//     // final AuthController authController = Get.find();
//     // final CartController cartController = Get.find();
//     //! Bura baxacam
//     List quantityList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]; //declare quantity values
//     int selectedValue = 0;

//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: const Color(0xFFF1F1F1),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             PageViewImageWidget(
//               imageUrl: widget.imageUrl,
//               prizeName: widget.prizeName,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: size.width * 0.01, vertical: size.height * 0.01),
//               child: Column(
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             width: size.width * 0.4,
//                             child: Text(
//                               'Buy:USD${widget.youWillBuy} rafflebasics credit',
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
//                             ),
//                           ),
//                           SizedBox(
//                             height: size.height * 0.01,
//                           ),
//                           SizedBox(
//                             width: size.width * 0.45,
//                             child: Text(
//                               'Date:${widget.date}',
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style:
//                                   const TextStyle(color: Color(0xFFA2A2A2), fontSize: 14, fontWeight: FontWeight.w500),
//                             ),
//                           ),
//                           SizedBox(
//                             height: size.height * 0.04,
//                           ),
//                         ],
//                       ),
//                       // Container(
//                       //   height: size.height * 0.14,
//                       //   width: size.width * 0.28,
//                       //   decoration: BoxDecoration(
//                       //       borderRadius: BorderRadius.circular(10),
//                       //       border:
//                       //           Border.all(color: const Color(0xFF8DC0CA))),
//                       //   alignment: Alignment.center,
//                       //   child: widget.addMore
//                       //       ? (widget.littleImageUrl != null
//                       //           ? Image(
//                       //               fit: BoxFit.cover,
//                       //               image: NetworkImage(
//                       //                   widget.littleImageUrl[0]!))
//                       //           : Text(
//                       //               'Raffle credit\nor product',
//                       //               style: TextStyle(
//                       //                   color: AppColors.blueColor,
//                       //                   fontWeight: FontWeight.w700),
//                       //             ))
//                       //       : Text(
//                       //           'Raffle credit\nor product',
//                       //           style: TextStyle(
//                       //               color: AppColors.blueColor,
//                       //               fontWeight: FontWeight.w700),
//                       //         ),
//                       // ),

//                       Stack(
//                         alignment: Alignment.topRight,
//                         clipBehavior: Clip.none,
//                         children: [
//                           Container(
//                               height: 110,
//                               width: 140,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(17),
//                                   border: Border.all(color: const Color(0xFFBBBBBB))),
//                               alignment: Alignment.center,
//                               child: Container(
//                                 height: 70,
//                                 width: 120,
//                                 decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(11)),
//                                 child: const Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           'raffle',
//                                           style:
//                                               TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
//                                         ),
//                                         Text(
//                                           'basics credit',
//                                           style:
//                                               TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
//                                         ),
//                                       ],
//                                     ),
//                                     Text(
//                                       '8.4AZN',
//                                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
//                                     ),
//                                   ],
//                                 ),
//                               )),
//                           // Positioned(
//                           //   top: -9,
//                           //   right: -5,
//                           //   child: CircleAvatar(
//                           //     radius: 10,
//                           //     backgroundColor: Colors.grey.withOpacity(0.7),
//                           //     child: Text(
//                           //       '𝓲',
//                           //       style: TextStyle(color: AppColors.standartWhiteColor, fontSize: 20),
//                           //     ),
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: size.height * 0.03,
//                   ),
//                   CoupleButtons(
//                     indexFromOut: 0,
//                     height: size.height * 0.08,
//                     buttonText1: 'Prize details',
//                     buttonText2: 'Product details',
//                     function: ({required int index}) {
//                       if (pgController.hasClients) {
//                         pgController.animateToPage(index,
//                             duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);
//                       }
//                     },
//                   ),
//                   SizedBox(
//                     height: size.height * 0.02,
//                   ),
//                   SizedBox(
//                     height: size.height * 0.1,
//                     width: size.width,
//                     child: PageView(
//                       controller: pgController,
//                       physics: const NeverScrollableScrollPhysics(),
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         SingleChildScrollView(
//                           padding: const EdgeInsets.only(bottom: 20),
//                           child: Text(
//                             widget.prizeDetail,
//                             textAlign: TextAlign.justify,
//                             style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFFA2A2A2)),
//                           ),
//                         ),
//                         SingleChildScrollView(
//                           padding: const EdgeInsets.only(bottom: 20),
//                           child: Text(
//                             widget.productDetail,
//                             textAlign: TextAlign.justify,
//                             style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFFA2A2A2)),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height * 0.01,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       InkWell(
//                         splashColor: Colors.transparent,
//                         highlightColor: Colors.transparent,
//                         onTap: () {
//                           // favoriteController
//                           //     .toggleFavorite(
//                           //         userUid: authController.user.uid,
//                           //         productId: widget.prodId)
//                           //     .then((value) {
//                           //   setState(() {});
//                           // });
//                         },
//                         child: CircleAvatar(
//                           backgroundColor: Colors.white,
//                           radius: size.width * 0.07,
//                           child: FutureBuilder(
//                             future:
//                                 favoriteController.isFav(userUid: authController.user.uid, productId: widget.prodId),
//                             builder: (context, snapshot) {
//                               if (snapshot.connectionState == ConnectionState.waiting) {
//                                 return Center(
//                                   child: LottieBuilder.asset(
//                                       width: size.height * 0.03,
//                                       height: size.height * 0.03,
//                                       'assets/loading_raffle.json'),
//                                 );
//                               } else {
//                                 return snapshot.data == true
//                                     ? const Icon(
//                                         Icons.favorite,
//                                         color: Colors.red,
//                                       )
//                                     : const Icon(
//                                         Icons.favorite_border,
//                                         color: Colors.black,
//                                       );
//                               }
//                             },
//                             // child: Icon(
//                             //   Icons.favorite_border,
//                             //   color: AppColors.standartBlackColor,
//                             // ),
//                           ),
//                         ),
//                       ),
//                       InkWell(
//                         splashColor: Colors.transparent,
//                         highlightColor: Colors.transparent,
//                         onTap: () {
//                           DynamicLinkProvider().createLink('aezakmi').then((value) {
//                             Share.share(value);
//                           });
//                         },
//                         child: CircleAvatar(
//                           backgroundColor: AppColors.standartWhiteColor,
//                           radius: size.width * 0.07,
//                           child: Icon(
//                             Icons.ios_share,
//                             color: AppColors.standartBlackColor,
//                             size: 25,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: size.height * 0.02,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//           width: size.width,
//           height: size.height * 0.12,
//           color: AppColors.standartWhiteColor,
//           child: SafeArea(
//               minimum: EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: size.height * 0.01),
//               child: GetBuilder(
//                   init: cartController,
//                   builder: (contextt) {
//                     return cartController.cartElements.any((element) => element.productId == widget.prodId)
//                         ? Row(
//                             children: [
//                               SizedBox(
//                                 width: 65,
//                                 child: InkWell(
//                                   onTap: () {
//                                     cartController.removeFromLocalCartWithBack(
//                                         model: CartModel(
//                                             drawDate: widget.drawDate,
//                                             category: widget.category,
//                                             // availableNumber: widget.totalNumber,
//                                             // imageUrl: widget.imageUrl[0],

//                                             numberOfOrder: cartController.cartElements
//                                                     .elementAt(cartController.cartElements
//                                                         .indexWhere((element) => element.productId == widget.prodId))
//                                                     .numberOfOrder -
//                                                 1,
//                                             prize: widget.prizeName,
//                                             //  soldNumber: widget.soldNumber,
//                                             whatYouWillBuy: double.parse(widget.youWillBuy),
//                                             productId: widget.prodId));
//                                   },
//                                   child: Stack(
//                                     alignment: Alignment.center,
//                                     children: [
//                                       Container(
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(15),
//                                           color: const Color(0xFFECECEC),
//                                         ),
//                                       ),
//                                       Container(
//                                         height: size.height * 0.006,
//                                         width: size.width * 0.07,
//                                         decoration: BoxDecoration(
//                                             color: const Color(0xFF414141), borderRadius: BorderRadius.circular(21)),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: size.width * 0.02,
//                               ),
//                               SizedBox(
//                                 width: 145,
//                                 child: InkWell(
//                                   onTap: () {
//                                     Get.bottomSheet(Container(
//                                       height: size.height * 0.33,
//                                       width: size.width,
//                                       decoration: const BoxDecoration(
//                                           borderRadius: BorderRadius.only(
//                                               topLeft: Radius.circular(20), topRight: Radius.circular(20)),
//                                           color: Color(0xFFEBEBEB)),
//                                       child: Padding(
//                                         padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
//                                         child: Column(
//                                           children: [
//                                             SizedBox(
//                                               height: size.height * 0.03,
//                                             ),
//                                             Row(
//                                               mainAxisAlignment: MainAxisAlignment.start,
//                                               children: [
//                                                 Text(
//                                                   'Select Quantity',
//                                                   style: TextStyle(
//                                                       fontSize: 20,
//                                                       fontWeight: FontWeight.bold,
//                                                       color: AppColors.standartBlackColor),
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               height: size.height * 0.02,
//                                             ),
//                                             SizedBox(
//                                               width: size.width * 0.03,
//                                             ),
//                                             Row(
//                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                               children: [
//                                                 Expanded(
//                                                   child: SizedBox(
//                                                     height: size.height * 0.1,
//                                                     width: size.width,
//                                                     child:
//                                                         StatefulBuilder(builder: (BuildContext context, setModalState) {
//                                                       return Row(
//                                                         children: [
//                                                           Container(
//                                                             height: size.height * 0.077,
//                                                             width: size.width * 0.22,
//                                                             decoration: BoxDecoration(
//                                                               borderRadius: BorderRadius.circular(5),
//                                                               color: AppColors.standartWhiteColor,
//                                                             ),

//                                                             //!
//                                                             child: TextField(
//                                                               style: const TextStyle(
//                                                                 fontSize: 20,
//                                                                 fontWeight: FontWeight.bold,
//                                                               ),
//                                                               controller: selectQuantityTextField,
//                                                               onTapOutside: (event) {
//                                                                 FocusScope.of(context).unfocus();
//                                                               },
//                                                               // autofocus: true,
//                                                               keyboardType: TextInputType.number,
//                                                               cursorColor: AppColors.standartBlackColor,
//                                                               cursorHeight: 30,
//                                                               textAlign: TextAlign.center,
//                                                               decoration: const InputDecoration(
//                                                                   contentPadding: EdgeInsets.only(top: 10),
//                                                                   border: InputBorder.none),
//                                                             ),
//                                                           ),
//                                                           const SizedBox(
//                                                             width: 10,
//                                                           ),
//                                                           Expanded(
//                                                             child: PageView.builder(
//                                                               physics: const BouncingScrollPhysics(),
//                                                               padEnds: false,
//                                                               pageSnapping: false,
//                                                               controller: PageController(
//                                                                   viewportFraction: 0.28,
//                                                                   initialPage: /* selectedValue - 1*/
//                                                                       cartController.cartElements
//                                                                               .elementAt(cartController.cartElements
//                                                                                   .indexWhere((element) =>
//                                                                                       element.productId ==
//                                                                                       widget.prodId))
//                                                                               .numberOfOrder -
//                                                                           1),
//                                                               scrollDirection: Axis.horizontal,
//                                                               itemCount: quantityList.length,
//                                                               itemBuilder: (context, index) {
//                                                                 CartModel model = cartController.cartElements.elementAt(
//                                                                     cartController.cartElements.indexWhere((element) =>
//                                                                         element.productId == widget.prodId));
//                                                                 return SelectableContainer(
//                                                                     selectedVal: model.numberOfOrder,
//                                                                     onTap: (value) {
//                                                                       setModalState(() {
//                                                                         model.numberOfOrder = value;
//                                                                         selectedValue = value;
//                                                                       });
//                                                                     },
//                                                                     amount: quantityList[index]);
//                                                               },
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       );
//                                                     }),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               height: size.height * 0.03,
//                                             ),
//                                             Row(
//                                               mainAxisAlignment: MainAxisAlignment.end,
//                                               children: [
//                                                 InkWell(
//                                                   onTap: () {
//                                                     CartModel model = cartController.cartElements.elementAt(
//                                                         cartController.cartElements.indexWhere(
//                                                             (element) => element.productId == widget.prodId));
//                                                     if (selectQuantityTextField.text.isEmpty) {
//                                                       cartController.updateSingleLocalCartItemWithBack(
//                                                           id: widget.prodId,
//                                                           amount: model.numberOfOrder +
//                                                               (selectedValue - model.numberOfOrder));
//                                                     } else {
//                                                       int selectedQuantity = int.parse(selectQuantityTextField.text);
//                                                       cartController.updateSingleLocalCartItemWithBack(
//                                                           id: widget.prodId,
//                                                           amount: model.numberOfOrder +
//                                                               (selectedQuantity - model.numberOfOrder));
//                                                     }
//                                                     print('sebete elave olundu ${selectQuantityTextField.text}');
//                                                     selectQuantityTextField.clear();
//                                                     Get.back();
//                                                   },
//                                                   child: Container(
//                                                     height: 60,
//                                                     width: size.width * 0.4,
//                                                     decoration: BoxDecoration(
//                                                         borderRadius: BorderRadius.circular(20),
//                                                         gradient: const LinearGradient(
//                                                           begin: Alignment(-0.00, 1.00),
//                                                           end: Alignment(0, -1),
//                                                           colors: [Color(0xFF3C0AE1), Color(0xFF4D7BFA)],
//                                                         )),
//                                                     alignment: Alignment.center,
//                                                     child: const Text(
//                                                       'Update',
//                                                       style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontSize: 20,
//                                                           fontWeight: FontWeight.bold),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ));
//                                   },
//                                   child: Stack(
//                                     alignment: Alignment.center,
//                                     children: [
//                                       Container(
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(15),
//                                             border: Border.all(color: const Color(0xFFA2A2A2))),
//                                       ),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           const SizedBox(
//                                             width: 10,
//                                           ),
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               const Text(
//                                                 'Selected Qty.',
//                                                 style: TextStyle(fontSize: 10, color: Colors.black87),
//                                               ),
//                                               GetBuilder(
//                                                   init: cartController,
//                                                   builder: (context) {
//                                                     return Text(
//                                                       cartController.cartElements
//                                                           .elementAt(cartController.cartElements.indexWhere(
//                                                               (element) => element.productId == widget.prodId))
//                                                           .numberOfOrder
//                                                           .toString(),
//                                                       textAlign: TextAlign.center,
//                                                       style: TextStyle(
//                                                           color: AppColors.standartBlackColor,
//                                                           fontSize: 24,
//                                                           fontWeight: FontWeight.w400),
//                                                     );
//                                                   }),
//                                             ],
//                                           ),

//                                           Stack(
//                                             alignment: Alignment.center,
//                                             children: [
//                                               Container(
//                                                 height: 50,
//                                                 width: 15,
//                                                 decoration: const BoxDecoration(
//                                                     borderRadius: BorderRadius.only(
//                                                         topLeft: Radius.circular(15),
//                                                         bottomLeft: Radius.circular(15),
//                                                         topRight: Radius.circular(15),
//                                                         bottomRight: Radius.circular(15)),
//                                                     color: Color(0xFFEFEFEF)),
//                                               ),
//                                               const Icon(
//                                                 Icons.arrow_drop_down,
//                                                 size: 30,
//                                                 color: Color(0xffD9D9D9),
//                                               ),
//                                             ],
//                                           ),
//                                           // const SizedBox(
//                                           //   width: 5,
//                                           // ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: size.width * 0.015,
//                               ),
//                               SizedBox(
//                                 width: 70,
//                                 child: InkWell(
//                                   onTap: () {
//                                     cartController.addToLocalCartWithBack(
//                                         model: CartModel(
//                                             drawDate: widget.drawDate,
//                                             category: widget.category,
//                                             //  availableNumber: widget.totalNumber,
//                                             // imageUrl: widget.imageUrl[0],
//                                             numberOfOrder: cartController.cartElements
//                                                     .elementAt(cartController.cartElements
//                                                         .indexWhere((element) => element.productId == widget.prodId))
//                                                     .numberOfOrder +
//                                                 1,
//                                             prize: widget.prizeName,
//                                             //  soldNumber: widget.soldNumber,
//                                             whatYouWillBuy: double.parse(widget.youWillBuy),
//                                             productId: widget.prodId));
//                                   },
//                                   child: Stack(
//                                     alignment: Alignment.center,
//                                     children: [
//                                       Container(
//                                         decoration: BoxDecoration(
//                                           gradient: const LinearGradient(
//                                               begin: Alignment(-0.00, 1.00),
//                                               end: Alignment(0, -1),
//                                               colors: [
//                                                 Color(0xFF3C0AE1),
//                                                 Color(0xFF4D7BFA),
//                                               ]),
//                                           borderRadius: BorderRadius.circular(15),
//                                         ),
//                                       ),
//                                       /* Text(
//                                         'Add more',
//                                         style: TextStyle(
//                                             color: AppColors.standartWhiteColor,
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.w700),
//                                       ),*/

//                                       Icon(
//                                         Icons.add,
//                                         color: AppColors.standartWhiteColor,
//                                         size: 40,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: size.width * 0.01,
//                               ),
//                               Expanded(
//                                 flex: 1,
//                                 child: InkWell(
//                                   splashColor: Colors.transparent,
//                                   highlightColor: Colors.transparent,
//                                   onTap: () {
//                                     // cartController.addToLocalCartWithBack(
//                                     //     model: CartModel(
//                                     //         drawDate: widget.drawDate,
//                                     //         category: widget.category,
//                                     //         //  availableNumber: widget.totalNumber,
//                                     //         // imageUrl: widget.imageUrl[0],
//                                     //         numberOfOrder: cartController
//                                     //                 .cartElements
//                                     //                 .elementAt(cartController
//                                     //                     .cartElements
//                                     //                     .indexWhere((element) =>
//                                     //                         element.productId ==
//                                     //                         widget.prodId))
//                                     //                 .numberOfOrder +
//                                     //             1,
//                                     //         prize: widget.prizeName,
//                                     //         //  soldNumber: widget.soldNumber,
//                                     //         whatYouWillBuy:
//                                     //             double.parse(widget.youWillBuy),
//                                     //         productId: widget.prodId));

//                                     Get.offAll(() => const FullCartScreen());
//                                   },
//                                   child: Stack(
//                                     alignment: Alignment.center,
//                                     children: [
//                                       Container(
//                                         decoration: BoxDecoration(
//                                           gradient: LinearGradient(
//                                               // begin:
//                                               //     const Alignment(-0.00, 1.00),
//                                               // end: const Alignment(0, -1),
//                                               colors: [
//                                                 const Color(0xFFFE1936).withOpacity(0.97),
//                                                 const Color(0xFFFA1F60),
//                                                 const Color(0xFFFF35DF).withOpacity(0.88),
//                                               ]),
//                                           borderRadius: BorderRadius.circular(37),
//                                         ),
//                                       ),
//                                       /* Text(
//                                         'Add more',
//                                         style: TextStyle(
//                                             color: AppColors.standartWhiteColor,
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.w700),
//                                       ),*/

//                                       Container(
//                                         height: 30,
//                                         width: 30,
//                                         decoration: const BoxDecoration(
//                                             image: DecorationImage(image: AssetImage('assets/images/bag.png'))),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           )
//                         : CustomElevatedButton(
//                             isBorderEnabled: true,
//                             borderRadius: 15,
//                             buttonColor: AppColors.blueColor,
//                             textColor: AppColors.standartWhiteColor,
//                             onPressed: () {
//                               setState(() {
//                                 selectedValue = 0;
//                               });

//                               Get.bottomSheet(Container(
//                                 height: size.height * 0.33,
//                                 width: size.width,
//                                 decoration: const BoxDecoration(
//                                     borderRadius:
//                                         BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
//                                     color: Color(0xFFEBEBEB)),
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
//                                   child: Column(
//                                     children: [
//                                       SizedBox(
//                                         height: size.height * 0.03,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             'Select Quantity',
//                                             style: TextStyle(
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: AppColors.standartBlackColor),
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: size.height * 0.02,
//                                       ),
//                                       SizedBox(
//                                         width: size.width * 0.03,
//                                       ),
//                                       SizedBox(
//                                         height: size.height * 0.1,
//                                         width: size.width,
//                                         child: StatefulBuilder(builder: (BuildContext context, setModalState) {
//                                           return PageView.builder(
//                                             padEnds: false,
//                                             pageSnapping: false,
//                                             controller:
//                                                 PageController(viewportFraction: 0.24, initialPage: selectedValue - 1),
//                                             scrollDirection: Axis.horizontal,
//                                             itemCount: quantityList.length,
//                                             itemBuilder: (context, index) {
//                                               return SelectableContainer(
//                                                   selectedVal: selectedValue,
//                                                   onTap: (value) {
//                                                     setModalState(() {
//                                                       selectedValue = value;
//                                                     });
//                                                   },
//                                                   amount: quantityList[index]);
//                                             },
//                                           );
//                                         }),
//                                       ),
//                                       SizedBox(
//                                         height: size.height * 0.03,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.end,
//                                         children: [
//                                           InkWell(
//                                             onTap: () {
//                                               if (selectedValue > 0) {
//                                                 // log('$selectedValue item has been added to cart');
//                                                 cartController.addToLocalCartWithBack(
//                                                   model: CartModel(
//                                                     drawDate: widget.drawDate,
//                                                     category: widget.category,
//                                                     //  availableNumber:
//                                                     //     widget
//                                                     //         .totalNumber,
//                                                     // imageUrl: widget
//                                                     //     .imageUrl[0],
//                                                     numberOfOrder: selectedValue,
//                                                     prize: widget.prizeName,
//                                                     // soldNumber:
//                                                     //     widget.soldNumber,
//                                                     whatYouWillBuy: double.parse(widget.youWillBuy),
//                                                     productId: widget.prodId,
//                                                   ),
//                                                 );
//                                               }

//                                               // Get.back();
//                                             },
//                                             child: Container(
//                                               height: 60,
//                                               width: size.width * 0.4,
//                                               decoration: BoxDecoration(
//                                                   borderRadius: BorderRadius.circular(20),
//                                                   gradient: const LinearGradient(
//                                                     begin: Alignment(-0.00, 1.00),
//                                                     end: Alignment(0, -1),
//                                                     colors: [Color(0xFF3C0AE1), Color(0xFF4D7BFA)],
//                                                   )),
//                                               alignment: Alignment.center,
//                                               child: const Text(
//                                                 'Add',
//                                                 style: TextStyle(
//                                                     color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ));
//                             },
//                             buttonText: 'Add to Cart',
//                             height: 40,
//                             icon: null,
//                             width: size.width);
//                   }))),
//     );
//   }
// }
