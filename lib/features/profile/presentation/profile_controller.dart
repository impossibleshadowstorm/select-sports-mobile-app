import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/profile_repository.dart';

class ProfileController extends StateNotifier<ProfileState> {
  final ProfileRepository profileRepository;

  ProfileController(this.profileRepository)
      : super(
          ProfileState(
            preferredPosition: '',
            experienceLevel: '',
            preferredFoot: '',
            totalMatches: 0,
            winnings: 0,
            draws: 0,
            loses: 0,
            isLoading: true,
            preferredPositionOptions: [],
            experienceLevelOptions: [],
            preferredFootOptions: [],
          ),
        ) {
    fetchSportsProfile();
    fetchProfileOptions();
  }

  // Fetch profile data
  Future<void> fetchSportsProfile() async {
    state = state.copyWith(isLoading: true);

    final profile = await profileRepository.getSportsProfile();

    if (profile != null) {
      state = state.copyWith(
        preferredPosition: profile.preferredPosition,
        experienceLevel: profile.skillLevel,
        preferredFoot: profile.preferredFoot,
        isLoading: false,
      );
    } else {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> fetchProfileOptions() async {
    final options = await profileRepository.getProfileOptions();
    if (options != null) {
      state = state.copyWith(
        preferredPositionOptions: options.preferredPositionOptions,
        experienceLevelOptions: options.skillLevelOptions,
        preferredFootOptions: options.preferredFootOptions,
      );
    }
  }

  // Update the edit mode
  void toggleEditMode() {
    state = state.copyWith(isEditing: !state.isEditing);
  }

  // Update functions for dropdown selections
  void updatePreferredPosition(String newPosition) {
    state = state.copyWith(preferredPosition: newPosition);
  }

  void updateExperienceLevel(String newExperience) {
    state = state.copyWith(experienceLevel: newExperience);
  }

  void updatePreferredFoot(String newFoot) {
    state = state.copyWith(preferredFoot: newFoot);
  }

  // Available options
  static const List<String> preferredPositions = [
    'GOALKEEPER',
    'DEFENDER',
    'MIDFIELDER',
    'FORWARD'
  ];
  static const List<String> experienceLevels = [
    'BEGINNER',
    'INTERMEDIATE',
    'ADVANCED'
  ];
  static const List<String> preferredFoot = ['LEFT', 'RIGHT', 'BOTH'];
}

class ProfileState {
  final bool isEditing;
  final bool isLoading;
  final String preferredPosition;
  final String experienceLevel;
  final String preferredFoot;
  final int totalMatches;
  final int winnings;
  final int draws;
  final int loses;
  final List<String> preferredPositionOptions;
  final List<String> experienceLevelOptions;
  final List<String> preferredFootOptions;

  ProfileState({
    this.isEditing = false,
    this.isLoading = false,
    required this.preferredPosition,
    required this.experienceLevel,
    required this.preferredFoot,
    required this.totalMatches,
    required this.winnings,
    required this.draws,
    required this.loses,
    required this.preferredPositionOptions,
    required this.preferredFootOptions,
    required this.experienceLevelOptions,
  });

  ProfileState copyWith({
    bool? isEditing,
    String? preferredPosition,
    String? experienceLevel,
    String? preferredFoot,
    bool? isLoading,
    int? totalMatches,
    int? winnings,
    int? draws,
    int? loses,
    List<String>? preferredPositionOptions,
    List<String>? preferredFootOptions,
    List<String>? experienceLevelOptions,
  }) {
    return ProfileState(
      isEditing: isEditing ?? this.isEditing,
      preferredPosition: preferredPosition ?? this.preferredPosition,
      experienceLevel: experienceLevel ?? this.experienceLevel,
      preferredFoot: preferredFoot ?? this.preferredFoot,
      isLoading: isLoading ?? this.isLoading,
      totalMatches: totalMatches ?? this.totalMatches,
      winnings: winnings ?? this.winnings,
      draws: draws ?? this.draws,
      loses: loses ?? this.loses,
      preferredPositionOptions: preferredPositionOptions ?? this.preferredPositionOptions,
      preferredFootOptions: preferredFootOptions ?? this.preferredFootOptions,
      experienceLevelOptions: experienceLevelOptions ?? this.experienceLevelOptions,
    );
  }
}

final profileControllerProvider =
    StateNotifierProvider<ProfileController, ProfileState>((ref) {
  final profileRepository = ref.watch(profileRepositoryProvider);
  return ProfileController(profileRepository);
  // return ProfileController();
});
