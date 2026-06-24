import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput(
      {super.key,
      required this.controller,
      required this.onSearch,
      this.isEnabled});

  @override
  State<SearchInput> createState() => _SearchInputState();

  final TextEditingController controller;
  final VoidCallback onSearch;
  final bool? isEnabled;
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.isEnabled,
      controller: widget.controller,
      decoration: InputDecoration(
        enabled: widget.isEnabled ?? true,
        hintText: 'Поиск напитков...',
        hintStyle: TextStyle(color: Colors.grey.shade500),
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
            onPressed: () => widget.controller.clear(),
            icon: Icon(
              Icons.clear,
              color: AppColors.grey5,
            )),
        filled: true,
        fillColor: AppColors.customBlue2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      ),
    );
  }
}
