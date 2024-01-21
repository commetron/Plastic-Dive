import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'plastidex_viewmodel.dart';

class PlastidexView extends StackedView<PlastidexViewModel> {
  const PlastidexView({super.key});

  @override
  Widget builder(
    BuildContext context,
    PlastidexViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Plastidex'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  PlastidexViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PlastidexViewModel();
}
