import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartTemperatura extends StatelessWidget {
  const BarChartTemperatura({super.key});

  @override
  Widget build(BuildContext context) {
    final List<double> temperaturas = [
      36.5,
      36.6,
      36.6,
      36.6,
      36.7,
      36.8,
      36.9,
      37.0,
      37.1,
      37.2,
    ];

    final List<int> frecuencias = [3, 5, 6, 5, 7, 9, 6, 4, 2, 1];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        AspectRatio(
          aspectRatio: 1.7,
          child: BarChart(
            BarChartData(
              barTouchData: BarTouchData(enabled: false),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < temperaturas.length) {
                        return Text(
                          temperaturas[index].toStringAsFixed(1),
                          style: const TextStyle(fontSize: 10),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                    reservedSize: 30,
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(show: false),
              barGroups: List.generate(
                temperaturas.length,
                (index) => BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: frecuencias[index].toDouble(),
                      color: Colors.lightBlueAccent,
                      width: 12,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
              ),
              gridData: FlGridData(show: true),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Media: 36.86 °C, Varianza: 0.04",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class PantallaEstadistica extends StatelessWidget {
  const PantallaEstadistica({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Análisis Estadístico de Temperatura"),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Los recién nacidos, en especial los prematuros o con bajo peso, enfrentan grandes desafíos para mantener una temperatura corporal estable debido a su desarrollo fisiológico incompleto. La termorregulación es un factor crucial en sus primeros días de vida, ya que son extremadamente sensibles a la hipotermia o al sobrecalentamiento, condiciones que pueden afectar su crecimiento, salud e incluso poner en riesgo su vida. Para contrarrestar este problema, las incubadoras neonatales ofrecen un ambiente térmico controlado que imita las condiciones protectoras del útero materno. Estos dispositivos mantienen una temperatura óptima (entre 36.5°C y 37.5°C), regulan la humedad y, en muchos casos, reducen la exposición a agentes infecciosos, garantizando un entorno seguro para el desarrollo del bebé.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            BarChartTemperatura(),
          ],
        ),
      ),
    );
  }
}
