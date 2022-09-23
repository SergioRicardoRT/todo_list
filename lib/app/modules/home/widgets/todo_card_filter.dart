import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/theme_extension.dart';

class TodoCardFilter extends StatefulWidget {
  const TodoCardFilter({Key? key}) : super(key: key);

  @override
  State<TodoCardFilter> createState() => _TodoCardFilterState();
}

class _TodoCardFilterState extends State<TodoCardFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(
        minHeight: 120,
        maxWidth: 150,
      ),
      decoration: BoxDecoration(
          color: context.primaryColor,
          border: Border.all(
            color: Colors.grey.withOpacity(.8),
            width: 1,
          ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '10 Tasks',
            style:
                context.titleStyle.copyWith(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
          const Text(
            'HOJE',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          LinearProgressIndicator(
            backgroundColor: context.primaryColorLight,
            value: .00001,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ],
      ),
    );
  }
}
