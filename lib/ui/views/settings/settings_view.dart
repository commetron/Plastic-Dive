import 'package:flutter/material.dart';
import 'package:plasticdiver/ui/common/app_theme.dart';
import 'package:plasticdiver/ui/common/ui_helpers.dart';
import 'package:plasticdiver/ui/validators/form_validators.dart';
import 'package:plasticdiver/ui/widgets/common/game_button/game_button.dart';
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
    return Stack(
      children: [
        Image.asset(
          "assets/images/screens-backgrounds/home.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: SingleChildScrollView(
            padding: getResponsivePadding(context),
            child: Column(
              children: [
                Text(
                  'Username',
                  style: Theme.of(context).textTheme.titleLarge,
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
                Text(
                  'Sound',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                verticalSpaceSmall,
                Transform.scale(
                  scale: 1.5,
                  child: Switch(
                    value: viewModel.isSoundEnabled,
                    onChanged: viewModel.toggleSound,
                    thumbIcon: MaterialStateProperty.resolveWith(
                        (states) => states.contains(MaterialState.selected) ? const Icon(Icons.volume_up) : const Icon(Icons.volume_off)),
                  ),
                ),
              ],
            ),
          ),
          persistentFooterAlignment: AlignmentDirectional.center,
          persistentFooterButtons: [
            GameButton(
              onPressed: viewModel.clearSettings,
              size: 50,
              color: Colors.redAccent,
              child: const Text('CLEAR SETTINGS', style: buttonTextStyle),
            ),
            horizontalSpaceMedium,
            GameButton(
              onPressed: viewModel.updateUsername,
              size: 50,
              child: const Text('UPDATE', style: buttonTextStyle),
            ),
          ],
        ),
      ],
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
