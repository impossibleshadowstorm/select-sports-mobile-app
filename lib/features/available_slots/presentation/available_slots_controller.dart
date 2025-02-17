import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/core/models/slot_model.dart';
import 'package:select_sports/features/available_slots/data/available_slots_repository.dart';

class AvailableSlotsController {
  final AvailableSlotsRepository availableSlotsRepository;

  AvailableSlotsController(this.availableSlotsRepository);

  Future<List<Slot>> fetchAvailableSlots() async {
    return await availableSlotsRepository.getAvailableSlots();
  }
}

final availableSlotsControllerProvider = Provider<AvailableSlotsController>(
  (ref) {
    final repository = ref.watch(availableSlotsRepositoryProvider);
    return AvailableSlotsController(repository);
  },
);
