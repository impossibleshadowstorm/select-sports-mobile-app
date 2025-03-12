import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/core/models/booking_list_model.dart';
import 'package:select_sports/features/bookings/data/booking_repository.dart';

class BookingController {
  final BookingRepository bookingRepository;

  BookingController(this.bookingRepository);

  Future<List<BookingList>> fetchBookingsList() async {
    return await bookingRepository.getBookings();
  }
}

final bookingControllerProvider = Provider<BookingController>(
      (ref) {
    final repository = ref.watch(bookingRepositoryProvider);
    return BookingController(repository);
  },
);
