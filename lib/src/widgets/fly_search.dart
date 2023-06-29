import 'package:flutter/material.dart';
import 'package:fly_widget/fly_widget.dart';

/// 统一的搜索框
class FlySearch extends StatefulWidget {
  ///
  const FlySearch({
    required this.onSearch,
    super.key,
  });

  /// 搜索框的回调
  final void Function(String? value) onSearch;

  @override
  State<StatefulWidget> createState() => _FlySearchState();
}

class _FlySearchState extends State<FlySearch> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          SizedBox(
            width: 200,
            child: TextFormField(
              // decoration: const InputDecoration(
              //   suffixIcon: Icon(
              //     Icons.search,
              //   ),
              // ),
              controller: _controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          const SizedBox(width: 12),
          FlyButton<FlyPositiveButtonExtension>(
            text: '搜索',
            onPressed: () {
              // Validate will return true if the form is valid, or false if
              // the form is invalid.
              if (_formKey.currentState!.validate()) {
                // Process data.
                widget.onSearch(_controller.text);
              }
            },
          ),
          const SizedBox(width: 12),
          FlyButton<FlyNegativeButtonExtension>(
            text: '重置',
            onPressed: () {
              _formKey.currentState!.reset();
              _controller.clear();
              widget.onSearch('');
            },
          ),
        ],
      ),
    );
  }
}
