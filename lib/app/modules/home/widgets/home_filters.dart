import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/ui/theme_extension.dart';
import 'package:todo_list_provider/app/models/task_filter_enum.dart';
import 'package:todo_list_provider/app/models/total_tasks_model.dart';
import 'package:todo_list_provider/app/modules/home/widgets/todo_card_filter.dart';

import '../home_controller.dart';

class HomeFilters extends StatelessWidget {

  const HomeFilters({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FILTROS',
          style: context.titleStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TodoCardFilter(
                selected: context.select<HomeController, TaskFilterEnum>((value) => value.filterSelected) == TaskFilterEnum.today,
                label: 'HOJE',
                taskFilter: TaskFilterEnum.today,
                totalTasksModel:
                    TotalTasksModel(
                  totalTasks: 20,
                  totalTasksFinish: 10,
                ),
              ),
              TodoCardFilter(selected: context.select<HomeController, TaskFilterEnum>((value) => value.filterSelected) == TaskFilterEnum.tomorrow,
                label: 'AMANHÃ',
                taskFilter: TaskFilterEnum.tomorrow,
                totalTasksModel:
                    TotalTasksModel(
                  totalTasks: 10,
                  totalTasksFinish: 7,
                ),
              ),
              TodoCardFilter(
                selected: context.select<HomeController, TaskFilterEnum>(
                        (value) => value.filterSelected) ==
                    TaskFilterEnum.week,
                label: 'SEMANA',
                taskFilter: TaskFilterEnum.week,
                totalTasksModel: TotalTasksModel(
                  totalTasks: 10,
                  totalTasksFinish: 3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}