import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'infocean_viewmodel.dart';

class InfoceanView extends StackedView<InfoceanViewModel> {
  const InfoceanView({super.key});

  @override
  Widget builder(
    BuildContext context,
    InfoceanViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Infocean'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          padding: const EdgeInsets.all(10),
          children: List.generate(
            viewModel.plasticGarbage.length,
            (index) => _buildCard(context, viewModel, index),
          ),
        ),
      ),
    );
  }

  @override
  InfoceanViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      InfoceanViewModel();

  _buildCard(BuildContext context, InfoceanViewModel viewModel, int index) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            'assets/images/garbages/${viewModel.plasticGarbage[index].last}',
            height: 100,
            width: 100,
          ),
          Text(
            viewModel.plasticGarbage[index].first,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
