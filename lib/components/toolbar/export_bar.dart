
import 'package:flutter/material.dart';

class ExportBar extends StatelessWidget {
  const ExportBar({
    Key? key,
    required this.toggleExportBar,
    required this.exportAsPdf,
    required this.exportAsPng,
  }) : super(key: key);

  final VoidCallback toggleExportBar;

  final Future Function()? exportAsPdf;
  final Future Function()? exportAsPng;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Text("Export as:"),
              const SizedBox(width: 8),

              TextButton(
                onPressed: exportAsPdf == null ? null : () {
                  exportAsPdf?.call().then((_) {
                    toggleExportBar();
                  });
                },
                child: const Text("PDF"),
              ),
              TextButton(
                onPressed: exportAsPng == null ? null : () {
                  exportAsPng?.call().then((_) {
                    toggleExportBar();
                  });
                },
                child: const Text("PNG"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
