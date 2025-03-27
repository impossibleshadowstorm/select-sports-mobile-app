import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:iconsax/iconsax.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/features/wallet/presentation/wallet_controller.dart';

import '../../../providers/theme_provider.dart';

class WalletScreen extends ConsumerStatefulWidget {
  const WalletScreen({super.key});

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> {
  late ScrollController _scrollController;

  bool _isScrolled = false;

  final List<dynamic> _transactions = [
    [
      'Amazon',
      'https://img.icons8.com/color/2x/amazon.png',
      '6:25pm',
      '\$8.90'
    ],
    [
      'Cash from ATM',
      'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-atm-banking-and-finance-kiranshastry-lineal-color-kiranshastry.png',
      '5:50pm',
      '\$200.00'
    ],
    [
      'Netflix',
      'https://img.icons8.com/color-glass/2x/netflix.png',
      '2:22pm',
      '\$13.99'
    ],
    [
      'Apple Store',
      'https://img.icons8.com/color/2x/mac-os--v2.gif',
      '6:25pm',
      '\$4.99'
    ],
    [
      'Cash from ATM',
      'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-atm-banking-and-finance-kiranshastry-lineal-color-kiranshastry.png',
      '5:50pm',
      '\$200.00'
    ],
    [
      'Netflix',
      'https://img.icons8.com/color-glass/2x/netflix.png',
      '2:22pm',
      '\$13.99'
    ]
  ];

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(walletControllerProvider.notifier).fetchUserWallet();
    });
  }

  void _listenToScrollChange() {
    if (_scrollController.offset >= 100.0) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    // final authController = ref.read(authControllerProvider);
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;
    final walletState = ref.watch(walletControllerProvider);
    final walletNotifier = ref.read(walletControllerProvider.notifier);

    if (walletState.isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            elevation: 0,
            pinned: true,
            stretch: true,
            toolbarHeight: 80,
            backgroundColor:
                isDarkMode ? AppColors.darkGreyColor : Colors.white,
            leading: IconButton(
              color: isDarkMode ? AppColors.lightestGreyColor : Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 250),
                    child: Icon(
                      Icons.arrow_back_sharp,
                    ),
                  );
                },
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            centerTitle: true,
            title: AnimatedOpacity(
              opacity: _isScrolled ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Column(
                children: [
                  Text(
                    '₹ ${walletState.userWallet.balance}',
                    style: TextStyle(
                      color: isDarkMode ? AppColors.lightText : Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 30,
                    height: 4,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? AppColors.lightestGreyColor
                          : Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              titlePadding: const EdgeInsets.only(left: 20, right: 20),
              title: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _isScrolled ? 0.0 : 1.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '₹',
                            style: TextStyle(
                                color: isDarkMode
                                    ? AppColors.lightestGreyColor
                                    : Colors.grey.shade800,
                                fontSize: 22),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            walletState.userWallet.balance.toString(),
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode
                                  ? AppColors.lightText
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: MaterialButton(
                        height: 30,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        onPressed: () {
                          Navigator.pushNamed(context, '/addMoney');
                        },
                        child: Text(
                          'Add Money',
                          style: TextStyle(
                              color: isDarkMode
                                  ? AppColors.lightText
                                  : Colors.black,
                              fontSize: 10),
                        ),
                        color: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: Colors.grey.shade300, width: 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 30,
                      height: 3,
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? AppColors.lightestGreyColor
                            : Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                children: [
                  FadeInDown(
                    duration: Duration(milliseconds: 500),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transactions',
                            style: TextStyle(
                                color: isDarkMode
                                    ? AppColors.lightestGreyColor
                                    : Colors.grey.shade800,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('₹ ${walletState.userWallet.balance}',
                              style: TextStyle(
                                color: isDarkMode
                                    ? AppColors.lightText
                                    : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              )),
                        ]),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 20),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: walletState.userWallet.transactions?.length,
                      itemBuilder: (context, index) {
                        return FadeInDown(
                          duration: Duration(milliseconds: 500),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? AppColors.darkLightBackground
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: isDarkMode
                                      ? AppColors.darkGreyColor
                                      : Colors.grey.shade200,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      walletState
                                                  .userWallet
                                                  .transactions![index]
                                                  .method ==
                                              "RAZORPAY"
                                          ? "https://media.tradly.app/images/marketplace/34521/razor_pay_icon-ICtywSbN.png"
                                          : "https://static-00.iconduck.com/assets.00/wallet-icon-1964x2048-g8f5z6u3.png",
                                      width: 50,
                                      height: 50,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          walletState.userWallet
                                              .transactions![index].method,
                                          style: TextStyle(
                                              color: isDarkMode
                                                  ? AppColors.lightestGreyColor
                                                  : Colors.grey.shade900,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          walletState.userWallet
                                              .transactions![index].updatedAt,
                                          style: TextStyle(
                                              color: isDarkMode
                                                  ? AppColors.darkBlue
                                                  : Colors.grey.shade500,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  walletState
                                      .userWallet.transactions![index].amount
                                      .toString(),
                                  style: TextStyle(
                                      color: isDarkMode
                                          ? AppColors.lightestGreyColor
                                          : Colors.grey.shade800,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
