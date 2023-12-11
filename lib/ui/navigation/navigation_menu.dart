import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visitor_mgnt/ui/dashboard/dashboard_screen.dart';
import 'package:visitor_mgnt/ui/navigation/navigation_bar_items.dart';
import 'package:visitor_mgnt/ui/profile/profile_screen.dart';

import 'navigation_cubit.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: BlocConsumer<NavigationCubit, NavigationState>(
        listener: (context, state) {

        },
        builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: NavigationBar(
            selectedIndex: state.index,
            onDestinationSelected: (index) => context.read<NavigationCubit>().getNavBarItem(NavbarItem.values[index]),
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home_rounded), label: 'Dashboard'),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
          body: _buildNavItemPage(state),
        );
        }
      ),
    );
  }

  _buildNavItemPage(NavigationState state) {
    if (state.navbarItem == NavbarItem.profile) {
      return const ProfileScreen();
    } else if (state.navbarItem == NavbarItem.home) {
      return const DashboardScreen();
    }
  }
}