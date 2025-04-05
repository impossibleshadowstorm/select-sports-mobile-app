import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/paths.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/models/booking_detail_model.dart';
import 'package:select_sports/core/models/user_model.dart';
import 'package:select_sports/core/widgets/common_appbar.dart';
import 'package:select_sports/core/widgets/visibility_widgets.dart';
import 'package:select_sports/features/bookings/presentation/booking_controller.dart';
import 'package:select_sports/providers/theme_provider.dart';
import 'package:select_sports/utils/common_functions.dart';
import 'package:select_sports/utils/map_util.dart';

class BookingDetailsScreen extends ConsumerStatefulWidget {
  final String bookingId;

  const BookingDetailsScreen({super.key, required this.bookingId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends ConsumerState<BookingDetailsScreen> {
  late Future<BookingDetail?> _bookingDetailsFuture;

  @override
  void initState() {
    super.initState();
    final slotsController = ref.read(bookingControllerProvider);
    _bookingDetailsFuture =
        slotsController.fetchBookingDetails(widget.bookingId);
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
                "Booking #${CommonFunctions.getLastNChars(widget.bookingId, 8)} Detail",
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: FutureBuilder<BookingDetail?>(
                  future: _bookingDetailsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text("Error fetching booking details"));
                    } else if (!snapshot.hasData) {
                      return Center(
                        child: Text(
                          "There is no any booking with this detail!",
                          style: TextStyle(
                            color: isDarkMode
                                ? AppColors.lightText
                                : AppColors.darkText,
                          ),
                        ),
                      );
                    }

                    BookingDetail bookingDetail = snapshot.data!;
                    Slot slotDetail = bookingDetail.slot;
                    Venue venueDetail = slotDetail.venue;

                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildVenueBox(
                            isDarkMode,
                            venueDetail.name,
                            venueDetail.images[0],
                            venueDetail.address.street,
                            venueDetail.address.city,
                            venueDetail.locationUrl,
                          ),
                          SizedBox(height: 5.w),
                          Text(
                            "Booking Slot Details",
                            style: AppTextStyles.body.copyWith(
                              color: isDarkMode
                                  ? AppColors.lightText
                                  : AppColors.darkText,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 2.5.w),
                          _buildSlotDetail(
                            isDarkMode,
                            slotDetail.startTime,
                            slotDetail.endTime,
                            bookingDetail.status,
                          ),
                          SizedBox(height: 5.w),
                          Text(
                            "Payment Details",
                            style: AppTextStyles.body.copyWith(
                              color: isDarkMode
                                  ? AppColors.lightText
                                  : AppColors.darkText,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 2.5.w),
                          _buildPaymentDetail(
                            isDarkMode,
                            slotDetail.price.toDouble(),
                            slotDetail.discountedPrice.toDouble(),
                          ),
                          SizedBox(height: 5.w),
                          Text(
                            "Assigned Team",
                            style: AppTextStyles.body.copyWith(
                              color: isDarkMode
                                  ? AppColors.lightText
                                  : AppColors.darkText,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 2.5.w),
                          _buildTeam(
                            isDarkMode,
                            bookingDetail.team.name,
                            bookingDetail.team.color,
                            bookingDetail.team.status,
                            bookingDetail.team.teamMembers,
                          ),
                          SizedBox(height: 5.h),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeam(
    bool isDarkMode,
    String name,
    String color,
    String status,
    List<User> teamMembers,
  ) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.5.w),
        color: isDarkMode ? AppColors.darkGreyColor : AppColors.lightText,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Team Name",
                      style: AppTextStyles.body.copyWith(
                        color: isDarkMode
                            ? AppColors.lightGreyColor
                            : AppColors.darkText,
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(height: 1.w),
                    Text(
                      CommonFunctions.capitalizeFirst(name),
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
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Team Color",
                      style: AppTextStyles.body.copyWith(
                        color: isDarkMode
                            ? AppColors.lightGreyColor
                            : AppColors.darkText,
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(height: 1.w),
                    Container(
                      decoration: BoxDecoration(
                        color: CommonFunctions.hexToColor(color),
                      ),
                      height: 25,
                      width: 70,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 2.5.w),
          Text(
            "Winning Status",
            style: AppTextStyles.body.copyWith(
              color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
              fontSize: 13.sp,
            ),
          ),
          SizedBox(height: 1.w),
          Text(
            CommonFunctions.capitalizeFirst(status),
            style: AppTextStyles.body.copyWith(
              color: isDarkMode ? AppColors.lightText : AppColors.darkText,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.5.w),
          Text(
            "Team Members",
            style: AppTextStyles.body.copyWith(
              color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
              fontSize: 13.sp,
            ),
          ),
          for (var i = 0; i < teamMembers.length; i++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.5.w),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.w),
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? AppColors.mediumGreyColor
                        : AppColors.lightGreyColor,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              Paths.userAvatarImage,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 2.5.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              teamMembers[i].name,
                              style: AppTextStyles.body.copyWith(
                                color: isDarkMode
                                    ? AppColors.lightText
                                    : AppColors.darkText,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Skill Rating: ",
                                  style: AppTextStyles.body.copyWith(
                                    color: isDarkMode
                                        ? AppColors.lightGreyColor
                                        : AppColors.darkText,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  teamMembers[i].skillsRating.toString(),
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildPaymentDetail(
    bool isDarkMode,
    double originalPrice,
    double discountedPrice,
  ) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.5.w),
        color: isDarkMode ? AppColors.darkGreyColor : AppColors.lightText,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total Cost",
            style: AppTextStyles.body.copyWith(
              color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
              fontSize: 13.sp,
            ),
          ),
          SizedBox(height: 1.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Original Price",
                style: AppTextStyles.body.copyWith(
                  color: isDarkMode
                      ? AppColors.lightestGreyColorV2
                      : AppColors.darkText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "₹ $originalPrice",
                style: AppTextStyles.body.copyWith(
                  color: isDarkMode ? AppColors.lightText : AppColors.darkText,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Discount",
                style: AppTextStyles.body.copyWith(
                  color: isDarkMode
                      ? AppColors.lightestGreyColorV2
                      : AppColors.darkText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "₹ ${originalPrice - discountedPrice}",
                style: AppTextStyles.body.copyWith(
                  color: isDarkMode ? AppColors.lightText : AppColors.darkText,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 0.5.w),
          Divider(
            color: isDarkMode
                ? AppColors.lightGreyColor
                : AppColors.mediumGreyColor,
          ),
          SizedBox(height: 0.5.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Final cost",
                style: AppTextStyles.body.copyWith(
                  color: isDarkMode
                      ? AppColors.lightestGreyColorV2
                      : AppColors.darkText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "₹ $discountedPrice",
                style: AppTextStyles.body.copyWith(
                  color: isDarkMode ? AppColors.lightText : AppColors.darkText,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSlotDetail(
    bool isDarkMode,
    DateTime startDateTime,
    DateTime endDateTime,
    String status,
  ) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.5.w),
        color: isDarkMode ? AppColors.darkGreyColor : AppColors.lightText,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Current Status",
            style: AppTextStyles.body.copyWith(
              color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
              fontSize: 13.sp,
            ),
          ),
          SizedBox(height: 1.w),
          Text(
            status,
            style: AppTextStyles.body.copyWith(
              color: status == "CANCELLED"
                  ? AppColors.redColor
                  : isDarkMode
                      ? AppColors.lightText
                      : AppColors.darkText,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 3.5.w),
          Text(
            "Start Date & Time",
            style: AppTextStyles.body.copyWith(
              color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
              fontSize: 13.sp,
            ),
          ),
          SizedBox(height: 1.w),
          Text(
            "${CommonFunctions.formatDateInMonthDayYear(startDateTime)} | ${CommonFunctions.formatTimeIn12HourAMPM(startDateTime)}",
            style: AppTextStyles.body.copyWith(
              color: isDarkMode ? AppColors.lightText : AppColors.darkText,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 3.5.w),
          Text(
            "End Date & Time",
            style: AppTextStyles.body.copyWith(
              color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
              fontSize: 13.sp,
            ),
          ),
          Text(
            "${CommonFunctions.formatDateInMonthDayYear(endDateTime)} | ${CommonFunctions.formatTimeIn12HourAMPM(endDateTime)}",
            style: AppTextStyles.body.copyWith(
              color: isDarkMode ? AppColors.lightText : AppColors.darkText,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVenueBox(bool isDarkMode, String name, String image,
      String street, String city, String url) {
    return Container(
      height: 150,
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.w),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.darkGreyColor : AppColors.lightText,
        borderRadius: BorderRadius.circular(2.5.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 150,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.5.w),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 2.5.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 0.25.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.pin_drop_outlined,
                          color: isDarkMode
                              ? AppColors.lightText
                              : AppColors.darkText,
                          size: 15.sp,
                        ),
                        SizedBox(width: 1.5.w),
                        Text(
                          city,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.body.copyWith(
                            color: isDarkMode
                                ? AppColors.lightText
                                : AppColors.darkText,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.5.w),
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body.copyWith(
                        color: isDarkMode
                            ? AppColors.lightText
                            : AppColors.darkText,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 0.5.w),
                    Text(
                      street,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body.copyWith(
                        color: isDarkMode
                            ? AppColors.lightText
                            : AppColors.darkText,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    MapUtils.openMap(url);
                  },
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  child: Row(
                    children: [
                      Icon(
                        Icons.directions,
                        color: isDarkMode
                            ? AppColors.lightGreenColor
                            : AppColors.darkText,
                        size: 15.sp,
                      ),
                      SizedBox(width: 1.5.w),
                      Text(
                        "Direction",
                        style: AppTextStyles.body.copyWith(
                          color: isDarkMode
                              ? AppColors.lightGreenColor
                              : AppColors.darkText,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0.25.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
