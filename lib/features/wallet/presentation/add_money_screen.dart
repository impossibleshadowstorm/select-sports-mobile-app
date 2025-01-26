import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:animate_do/animate_do.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/widgets/custom_buttons.dart';
import 'package:select_sports/providers/theme_provider.dart';

class AddMoneyScreen extends ConsumerStatefulWidget {
  final String avatar;

  const AddMoneyScreen({
    super.key,
    this.avatar = 'assets/images/avatar-1.png',
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends ConsumerState<AddMoneyScreen> {
  var amount = TextEditingController(text: "0.00");

  final FocusNode _focusNode = FocusNode();
  final TextEditingController _editingController = TextEditingController();
  bool isFocused = false;

  final List<String> _feedbacks = [
    'Debit Card ',
    'UPI ',
    'Show QR ',
  ];

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(onFocusChanged);
  }

  void onFocusChanged() {
    setState(() {
      isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode
            ? AppColors.darkScaffoldBackground
            : AppColors.lightBackground,
        elevation: 0,
        title: Text(
          'Add Money',
          style: TextStyle(
            color: isDarkMode ? AppColors.lightestGreyColor : Colors.black,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
          child: Icon(
            Icons.arrow_back_sharp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: isDarkMode
                ? AppColors.darkScaffoldBackground
                : AppColors.lightBackground,
          ),
          width: 100.w,
          height: 100.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              FadeInDown(
                from: 100,
                duration: Duration(milliseconds: 1000),
                child: Container(
                  width: 130,
                  height: 130,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(widget.avatar),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              FadeInUp(
                from: 60,
                delay: Duration(milliseconds: 500),
                duration: Duration(milliseconds: 1000),
                child: Text(
                  "Add Money To",
                  style: TextStyle(
                    color: isDarkMode
                        ? AppColors.lightestGreyColor
                        : AppColors.darkGreyColor,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FadeInUp(
                from: 30,
                delay: Duration(milliseconds: 800),
                duration: Duration(milliseconds: 1000),
                child: Text(
                  "Wallet",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? AppColors.lightestGreyColor
                        : AppColors.darkGreyColor,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeInUp(
                from: 40,
                delay: Duration(milliseconds: 800),
                duration: Duration(milliseconds: 1000),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: TextField(
                    controller: amount,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                    cursorColor:
                        isDarkMode ? AppColors.lightestGreyColor : Colors.black,
                    style: TextStyle(
                      color: isDarkMode
                          ? AppColors.lightestGreyColor
                          : Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    onSubmitted: (value) {
                      setState(() {
                        amount.text = "₹$value.00";
                      });
                    },
                    onTap: () {
                      setState(
                        () {
                          if (amount.text == "0.00") {
                            amount.text = "";
                          } else {
                            amount.text =
                                amount.text.replaceAll(RegExp(r'.00'), '');
                          }
                        },
                      );
                    },
                    inputFormatters: [ThousandsFormatter()],
                    decoration: InputDecoration(
                      hintText: "Enter Amount",
                      hintStyle: TextStyle(
                        color: isDarkMode
                            ? AppColors.lightestGreyColor
                            : AppColors.mediumGreyColor,
                        fontSize: 20.sp,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FadeInUp(
                from: 60,
                delay: Duration(milliseconds: 800),
                duration: Duration(milliseconds: 1000),
                child: AnimatedContainer(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? AppColors.darkMediumBackground
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isFocused
                          ? Colors.indigo.shade400
                          : Colors.grey.shade200,
                      width: 2,
                    ),
                  ),
                  child: TextField(
                    maxLines: 3,
                    focusNode: _focusNode,
                    controller: _editingController,
                    keyboardType: TextInputType.text,
                    cursorColor:
                        isDarkMode ? AppColors.lightestGreyColor : Colors.black,
                    style: TextStyle(
                      color:
                          isDarkMode ? AppColors.lightText : AppColors.darkText,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      hintText: "Wallet Note...",
                      hintStyle: TextStyle(
                        color: isDarkMode
                            ? AppColors.lightestGreyColor
                            : AppColors.darkGreyColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeInUp(
                from: 60,
                delay: Duration(milliseconds: 800),
                duration: Duration(milliseconds: 1000),
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: FadeInRight(
                    from: 100,
                    delay: Duration(milliseconds: 500),
                    duration: Duration(milliseconds: 1000),
                    child: BouncingWidget(
                      duration: Duration(milliseconds: 100),
                      scaleFactor: 1.5,
                      onPressed: () {
                        _editingController.text = "";
                        _focusNode.requestFocus();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? AppColors.lightGreenColor.withValues(alpha: 0.1)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(2.5.w),
                          border: Border.all(
                            color: isDarkMode
                                ? AppColors.lightestGreyColor
                                : AppColors.darkGreyColor,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Debit Card",
                              style: TextStyle(
                                color: isDarkMode
                                    ? AppColors.lightestGreyColor
                                    : Colors.grey.shade800,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: AppColors.darkGreenColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // child: ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   itemCount: _feedbacks.length,
                  //   itemBuilder: (context, index) {
                  //     return FadeInRight(
                  //       from: 100,
                  //       delay: Duration(milliseconds: index * 500),
                  //       duration: Duration(milliseconds: 1000),
                  //       child: BouncingWidget(
                  //         duration: Duration(milliseconds: 100),
                  //         scaleFactor: 1.5,
                  //         onPressed: () {
                  //           _editingController.text = _feedbacks[index];
                  //           _focusNode.requestFocus();
                  //         },
                  //         child: Container(
                  //           margin: EdgeInsets.only(right: 20),
                  //           padding: EdgeInsets.symmetric(
                  //             horizontal: 20,
                  //             vertical: 8,
                  //           ),
                  //           decoration: BoxDecoration(
                  //             color: isDarkMode
                  //                 ? AppColors.darkLightBackground
                  //                 : Colors.white,
                  //             borderRadius: BorderRadius.circular(8),
                  //             border: Border.all(
                  //               color: isDarkMode
                  //                   ? AppColors.lightestGreyColor
                  //                   : AppColors.darkGreyColor,
                  //               width: 2,
                  //             ),
                  //           ),
                  //           child: Text(
                  //             _feedbacks[index],
                  //             style: TextStyle(
                  //               color: isDarkMode
                  //                   ? AppColors.lightestGreyColor
                  //                   : Colors.grey.shade800,
                  //               fontSize: 16,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              FadeInUp(
                duration: Duration(milliseconds: 1000),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: CustomButtons.fullWidthFilledButton(
                    buttonText: "Add",
                    ref: ref,
                    onClick: () {},
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 50.0),
                //   child: Material(
                //     elevation: 5,
                //     borderRadius: BorderRadius.circular(10),
                //     color: isDarkMode
                //         ? AppColors.darkGreyColor
                //         : AppColors.lightBackground,
                //     child: MaterialButton(
                //       onPressed: () {},
                //       minWidth: double.infinity,
                //       height: 50,
                //       child: Text(
                //         "Add",
                //         style: TextStyle(
                //           color: isDarkMode
                //               ? AppColors.lightText
                //               : AppColors.darkText,
                //           fontSize: 16,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
