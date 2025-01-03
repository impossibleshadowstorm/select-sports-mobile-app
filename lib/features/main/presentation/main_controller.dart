import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../membership/presentation/membership_screen.dart';
import '../../connections/presentation/connections_screen.dart';
import '../../home/presentation/home_screen.dart';
import '../../notifications/presentation/notifications_screen.dart';
import '../../profile/presentation/profile_screen.dart';

final mainControllerProvider =
    StateNotifierProvider<MainController, int>((ref) => MainController());

class MainController extends StateNotifier<int> {
  MainController() : super(2);

  final List<Widget> pages = [
    const MembershipScreen(),
    const ConnectionsScreen(),
    const HomeScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  final List<Map<String, dynamic>> navItems = [
    {'icon': Icons.card_membership, 'label': 'Membership'},
    {'icon': Icons.people, 'label': 'Connections'},
    {'icon': Icons.sports_soccer, 'label': 'Home'},
    {'icon': Icons.notifications, 'label': 'Notifications'},
    {'icon': Icons.person, 'label': 'Profile'},
  ];

  void updateIndex(int newIndex) {
    state = newIndex;
  }
}
