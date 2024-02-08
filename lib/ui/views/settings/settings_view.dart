import 'package:flutter/material.dart';
import 'package:plasticdiver/ui/common/ui_helpers.dart';
import 'package:plasticdiver/ui/validators/form_validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'settings_view.form.dart';
import 'settings_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'username', validator: FormValidators.usernameValidator),
])
class SettingsView extends StackedView<SettingsViewModel> with $SettingsView {
  const SettingsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          children: [
            verticalSpaceLarge,
            Text(
              'Username',
              style: Theme.of(context).textTheme.headline6,
            ),
            verticalSpaceSmall,
            TextFormField(
              controller: usernameController,
              focusNode: usernameFocusNode,
              decoration: const InputDecoration(
                hintText: 'Enter your username',
              ),
            ),
            verticalSpaceMedium,
            ElevatedButton(
              onPressed: () => viewModel.updateUsername(),
              child: const Text('Update'),
            ),
            verticalSpaceMedium,
            ElevatedButton(
              onPressed: () => viewModel.clearSettings(),
              child: const Text('Clear settings'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();

  @override
  void onViewModelReady(SettingsViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(SettingsViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
