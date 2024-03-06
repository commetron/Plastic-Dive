// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import '../ui/dialogs/infocean_details/infocean_details_dialog.dart';
import 'app.locator.dart';

enum DialogType {
  infoceanDetails,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoceanDetails: (context, request, completer) => InfoceanDetailsDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
