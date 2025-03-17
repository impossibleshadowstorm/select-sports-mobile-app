import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/paths.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/models/address_model.dart';
import 'package:select_sports/core/models/booking_list_model.dart';
import 'package:select_sports/core/widgets/common_appbar.dart';
import 'package:select_sports/core/widgets/visibility_widgets.dart';
import 'package:select_sports/features/bookings/presentation/booking_controller.dart';
import 'package:select_sports/features/bookings/presentation/booking_details_screen.dart';
import 'package:select_sports/providers/theme_provider.dart';
import 'package:select_sports/utils/common_functions.dart';

class BookingsScreen extends ConsumerStatefulWidget {
  const BookingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends ConsumerState<BookingsScreen> {
  late Future<List<BookingList>> _bookingsFuture;

  @override
  void initState() {
    super.initState();
    final slotsController = ref.read(bookingControllerProvider);
    _bookingsFuture = slotsController.fetchBookingsList();
  }

  @override
  Widget build(BuildContext context) {
    // Check if the current theme mode is dark
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VisibilityWidgets.statusBarVisibleWidget(context: context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: CommonAppbar.appbarWithoutLeading(
                context,
                isDarkMode,
                "Your Bookings",
              ),
            ),
            Expanded(
              child: FutureBuilder<List<BookingList>>(
                future: _bookingsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error fetching bookings"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        "You haven't done any bookings!",
                        style: TextStyle(
                          color: isDarkMode
                              ? AppColors.lightText
                              : AppColors.darkText,
                        ),
                      ),
                    );
                  }

                  final bookings = snapshot.data!;
                  return ListView.builder(
                    itemCount: bookings.length,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final booking = bookings[index];
                      // final slotVenueAddress = slot.venue.address;

                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Column(
                          children: [
                            InkWell(
                              overlayColor: WidgetStatePropertyAll(Colors.transparent),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BookingDetailsScreen(
                                          bookingId: booking.id,
                                        ),
                                  ),
                                );
                              },
                              child: _singleBooking(isDarkMode, booking),
                            ),
                            SizedBox(height: 5.w),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _singleBooking(bool isDarkMode, BookingList booking) {
    const boxHeight = 200.0;
    Address address = booking.slot.venue.address;
    // String completeAddress = "${}, ${address.city}";

    return Container(
      height: boxHeight,
      width: 100.w,
      decoration: BoxDecoration(
          // color: isDarkMode ? AppColors.darkGreyColor : AppColors.lightText,
          ),
      child: Row(
        children: [
          Container(
            width: 20.w,
            height: boxHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(booking.slot.venue.images[0]),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: AppColors.darkGreenColor,
                width: 2,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.w),
                bottomLeft: Radius.circular(5.w),
              ),
            ),
          ),
          SizedBox(width: 2.5.w),
          Expanded(
            child: Container(
              height: boxHeight,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.darkGreenColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.w),
                  bottomRight: Radius.circular(5.w),
                ),
                color:
                    isDarkMode ? AppColors.darkScaffoldBackground : AppColors.lightText,
              ),
              padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.w),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(
                          Paths.footballIcon,
                          color: isDarkMode
                              ? AppColors.lightGreenColor
                              : AppColors.darkGreenColor,
                        ),
                      ),
                      SizedBox(width: 2.5.w),
                      Text(
                        "Football",
                        style: AppTextStyles.body.copyWith(
                          color: isDarkMode
                              ? AppColors.lightGreenColor
                              : AppColors.darkGreenColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Booking #${CommonFunctions.getLastNChars(booking.id, 8)}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: AppTextStyles.body.copyWith(
                                color: isDarkMode
                                    ? AppColors.lightText
                                    : AppColors.darkText,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2.5.w),
                            Text(
                              address.street,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              // textAlign: TextAlign.justify,
                              style: AppTextStyles.body.copyWith(
                                color: isDarkMode
                                    ? AppColors.lightGreyColor
                                    : AppColors.darkText,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: .5.w),
                            Text(
                              "${address.city}, ${address.postalCode}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: AppTextStyles.body.copyWith(
                                color: isDarkMode
                                    ? AppColors.lightGreyColor
                                    : AppColors.darkText,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 1.5.w),
                            Row(
                              children: [
                                Text(
                                  CommonFunctions.formatDateInDayDateMon(
                                      booking.slot.startTime),
                                  style: AppTextStyles.body.copyWith(
                                    color: isDarkMode
                                        ? AppColors.lightText
                                        : AppColors.darkText,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Container(
                                  height: 20,
                                  width: 1.5,
                                  color: AppColors.lightGreyColor,
                                ),
                                SizedBox(width: 2.w),
                                Text(
                                  CommonFunctions.formatTimeIn24HourMinAMPM(
                                      booking.slot.startTime),
                                  style: AppTextStyles.body.copyWith(
                                    color: isDarkMode
                                        ? AppColors.lightText
                                        : AppColors.darkText,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
