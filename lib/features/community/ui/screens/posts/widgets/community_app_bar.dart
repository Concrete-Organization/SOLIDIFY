import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/community/logic/posts/posts_cubit.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/default_community_app_bar.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/search_community_app_bar.dart';

class CommunityAppBar extends StatefulWidget {
  const CommunityAppBar({super.key});

  @override
  State<CommunityAppBar> createState() => _CommunityAppBarState();
}

class _CommunityAppBarState extends State<CommunityAppBar> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isSearching
        ? SearchCommunityAppBar(
      searchController: _searchController,
      onBackPressed: () {
        setState(() {
          _isSearching = false;
          _searchController.clear();
          context.read<PostsCubit>().clearSearch();
        });
      },
    )
        : DefaultCommunityAppBar(
      onSearchPressed: () {
        setState(() {
          _isSearching = true;
        });
      },
    );
  }
}