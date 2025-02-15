import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TaskProgressChart extends StatelessWidget {
  final int completedTasks;
  final int remainingTasks;

  const TaskProgressChart({
    super.key,
    required this.completedTasks,
    required this.remainingTasks,
  });

  @override
  Widget build(BuildContext context) {
    int totalTasks = completedTasks + remainingTasks;
    int completionPercentage =
        totalTasks == 0 ? 0 : ((completedTasks / totalTasks) * 100).round();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2D3E),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Task Progress",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD3D3D3),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          color: const Color(0xFF8E7AB5),
                          value: completedTasks.toDouble(),
                          title: "$completedTasks",
                          radius: 55,
                          titleStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        PieChartSectionData(
                          color: const Color(0xFFEEBBC3),
                          value: remainingTasks.toDouble(),
                          title: "$remainingTasks",
                          radius: 50,
                          titleStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                      sectionsSpace: 3,
                      centerSpaceRadius: 40,
                    ),
                  ),
                  Text(
                    "$completionPercentage%",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
