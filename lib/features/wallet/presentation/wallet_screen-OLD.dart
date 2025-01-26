

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/features/wallet/presentation/wallet_controller.dart';

import '../../../core/constants/theme_constants.dart';
import '../../../providers/theme_provider.dart';

class WalletScreenOLD extends ConsumerStatefulWidget {
  const WalletScreenOLD({super.key});

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreenOLD> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedPaymentMethod = 'Card'; // Default payment method
  TextEditingController upiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final walletState = ref.watch(walletControllerProvider);
    final walletController = ref.read(walletControllerProvider.notifier);
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.light;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode
            ? AppColors.darkLightBackground
            : AppColors.lightestGreyColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: isDarkMode ? AppColors.lightText : Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert,
                color: isDarkMode ? AppColors.lightText : Colors.black),
            onPressed: () {},
          ),
        ],
        title: Text(
          'Top Up Select Sports',
          style:
              TextStyle(color: isDarkMode ? AppColors.lightText : Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: isDarkMode
                ? AppColors.darkMediumBackground
                : AppColors.lightBackground),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [Text('Current Wallet Amount')],
              ),
              Text(
                'Top Up Methods',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? AppColors.lightText
                        : AppColors.lightGreyColor),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color:
                      isDarkMode ? AppColors.darkGreyColor : Colors.grey[200],
                  borderRadius: BorderRadius.circular(40),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.credit_card,
                        color:
                            isDarkMode ? AppColors.lightText : Colors.purple),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bank Transfer (BNO)',
                            style: TextStyle(
                                fontSize: 16,
                                color: isDarkMode
                                    ? AppColors.lightText
                                    : Colors.black),
                          ),
                          Text(
                            '**** **** **** 5324',
                            style: TextStyle(
                                color: isDarkMode
                                    ? AppColors.lightText
                                    : Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_drop_down,
                        color: isDarkMode ? AppColors.lightText : Colors.black),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Top Up Amount',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? AppColors.lightText : Colors.black),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? AppColors.darkLightBackground
                      : AppColors.lightestGreyColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: walletController.amountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter Amount",
                          border: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: isDarkMode
                                    ? AppColors.lightGreenColor
                                    : Colors.purple),
                          ),
                        ),
                        style: TextStyle(
                          color:
                              isDarkMode ? AppColors.lightText : Colors.black,
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            final numericValue = int.tryParse(value);
                            if (numericValue != null) {
                              walletController
                                  .updateAmount(numericValue.toString());
                            }
                          }
                        },
                      ),
                    ),
                    if (walletController.amountController.text.isNotEmpty)
                      IconButton(
                        icon: Icon(Icons.close,
                            color: isDarkMode
                                ? AppColors.lightText
                                : Colors.black),
                        onPressed: () {
                          walletController.amountController.clear();
                          walletController.updateAmount('');
                        },
                      ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (int i = 0;
                      i < [50, 100, 150, 200, 300, 400, 500, 1000].length;
                      i += 4)
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly, // Distribute items equally
                      children: [
                        for (var amount in [
                          50,
                          100,
                          150,
                          200,
                          300,
                          400,
                          500,
                          1000
                        ].skip(i).take(4))
                          SizedBox(
                            width:
                                80, // Set a fixed width for each chip to align them consistently
                            child: ChoiceChip(
                              label: Text('$amount'),
                              selected:
                                  walletController.amountController.text ==
                                      amount.toString(),
                              onSelected: (selected) {
                                if (selected) {
                                  walletController.amountController.text =
                                      amount.toString();
                                  walletController
                                      .updateAmount(amount.toString());
                                }
                              },
                              selectedColor: AppColors.mediumGreenColor,
                              backgroundColor: isDarkMode
                                  ? AppColors.darkGreyColor
                                  : Colors.white,
                              labelStyle: TextStyle(
                                color: isDarkMode
                                    ? AppColors.lightText
                                    : Colors.black,
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mediumGreenColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Top Up',
                    style: TextStyle(
                        fontSize: 18,
                        color: isDarkMode ? AppColors.darkText : Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent Transactions ',
                      style: TextStyle(
                          fontSize: 18,
                          color: isDarkMode
                              ? AppColors.lightText
                              : AppColors.darkText)),
                  TextButton(
                    onPressed: () => {print('More Transactions CLicked')},
                    child: Text(
                      "Show More",
                      style: AppTextStyles.body.copyWith(
                        color:isDarkMode? AppColors.darkGreenColor:AppColors.darkBlue,
                      ),
                    ),
                  ),
                ],
              ),
              // ListTile(
              //       title: Text('Top-up to Wallet',style: TextStyle(
              //           fontSize: 18,
              //           color: isDarkMode ? AppColors.lightText : AppColors.darkText)),
              //       subtitle: Text('January 26, 2025',style: TextStyle(
              //           fontSize: 18,
              //           color: isDarkMode ? AppColors.lightText : AppColors.darkText)),
              //       leading: Icon(Icons.credit_card_off_outlined,color: AppColors.cardColor,),
              //       trailing: Text('+₹250',style: TextStyle(
              //         fontSize: 18,
              //         color: AppColors.lightGreenColor
              //       ),),
              //     )
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors
                        .mediumGreyColor, // Set your desired border color here
                    width: 1, // Set your desired border width here
                  ),
                  borderRadius: BorderRadius.circular(
                      8), // Optional: Add border radius for rounded corners
                ),
                child: ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.credit_card,
                        color: AppColors.cardColor,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Game Booking',
                        style: TextStyle(
                          fontSize: 18,
                          color: isDarkMode
                              ? AppColors.lightText
                              : AppColors.darkText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'January 22, 2025',
                        style: TextStyle(
                          fontSize: 16,
                          color: isDarkMode
                              ? AppColors.lightText
                              : AppColors.darkText,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: AppColors.lightGreenColor,
                            size: 18,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Successful',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.lightGreenColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  leading: CircleAvatar(
                    backgroundColor: AppColors.cardColor,
                    child: Icon(
                      Icons.wallet,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '-₹299',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.redColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'deducted',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.lightGreenColor,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Handle tap action, e.g., navigate to detailed view of the wallet
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors
                        .mediumGreyColor, // Set your desired border color here
                    width: 1, // Set your desired border width here
                  ),
                  borderRadius: BorderRadius.circular(
                      8), // Optional: Add border radius for rounded corners
                ),
                child: ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.payment,
                        color: AppColors.cardColor,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Top-up to Wallet',
                        style: TextStyle(
                          fontSize: 18,
                          color: isDarkMode
                              ? AppColors.lightText
                              : AppColors.darkText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'January 21, 2025',
                        style: TextStyle(
                          fontSize: 16,
                          color: isDarkMode
                              ? AppColors.lightText
                              : AppColors.darkText,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: AppColors.lightGreenColor,
                            size: 18,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Successful',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.lightGreenColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  leading: CircleAvatar(
                    backgroundColor: AppColors.cardColor,
                    child: Icon(
                      Icons.credit_card,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '+₹500',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.lightGreenColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Added',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.lightGreenColor,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Handle tap action, e.g., navigate to detailed view of the wallet
                  },
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors
                        .mediumGreyColor, // Set your desired border color here
                    width: 1, // Set your desired border width here
                  ),
                  borderRadius: BorderRadius.circular(
                      8), // Optional: Add border radius for rounded corners
                ),
                child: ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.credit_card,
                        color: AppColors.cardColor,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Top-up to Wallet',
                        style: TextStyle(
                          fontSize: 18,
                          color: isDarkMode
                              ? AppColors.lightText
                              : AppColors.darkText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'January 26, 2025',
                        style: TextStyle(
                          fontSize: 16,
                          color: isDarkMode
                              ? AppColors.lightText
                              : AppColors.darkText,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: AppColors.lightGreenColor,
                            size: 18,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Successful',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.lightGreenColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  leading: CircleAvatar(
                    backgroundColor: AppColors.cardColor,
                    child: Icon(
                      Icons.credit_card_off_outlined,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '+₹250',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.lightGreenColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Added',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.lightGreenColor,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Handle tap action, e.g., navigate to detailed view of the wallet
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
