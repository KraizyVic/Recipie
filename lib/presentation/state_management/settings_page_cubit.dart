
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipie/core/constants.dart';
import 'package:recipie/data/models/settings_page_model.dart';
import 'package:recipie/domain/entities/settings_page_entities.dart';
import 'package:recipie/domain/use_cases/settings_page_use_cases.dart';

import '../../core/dependency_injector.dart';

class LookAndFeelCubit extends Cubit<LookAndFeelEntity> {
  LookAndFeelCubit() : super(defaultLookAndFeel) {
    _loadLookAndFeel();
  }

  Future<void> _loadLookAndFeel() async {
    final lookAndFeel = await sl<ReadLookAndFeel>().readLookAndFeel(0);
    if (lookAndFeel != null) {
      emit(lookAndFeel);
    }else{
     sl<CreateLookAndFeel>().createLookAndFeel(defaultLookAndFeel);
     emit(defaultLookAndFeel);
    }
  }

  Future<void> changeTheme(int themeMode) async {
    final lookAndFeel = await sl<ReadLookAndFeel>().readLookAndFeel(0);
    if (lookAndFeel != null) {
      LookAndFeelModel looks = LookAndFeelModel.toLookAndFeelModel(lookAndFeel).copyWith(themeMode: themeMode);
      await sl<UpdateLookAndFeel>().updateLookAndFeel(looks.toLookAndFeelEntity());
      emit(await sl<ReadLookAndFeel>().readLookAndFeel(0) ?? defaultLookAndFeel);
    }
  }

  Future<void> setAppColor(int color) async{
    final lookAndFeel = await sl<ReadLookAndFeel>().readLookAndFeel(0);
    if (lookAndFeel != null) {
      LookAndFeelModel looks = LookAndFeelModel.toLookAndFeelModel(lookAndFeel).copyWith(primaryColor: color);
      await sl<UpdateLookAndFeel>().updateLookAndFeel(looks.toLookAndFeelEntity());
      emit(await sl<ReadLookAndFeel>().readLookAndFeel(0) ?? defaultLookAndFeel);
    }
  }

  Future<void> setAmoledBackground(bool isAmoled) async {
    final lookAndFeel = await sl<ReadLookAndFeel>().readLookAndFeel(0);
    if (lookAndFeel != null) {
      LookAndFeelModel looks = LookAndFeelModel.toLookAndFeelModel(lookAndFeel).copyWith(isAmoledBackground: isAmoled);
      await sl<UpdateLookAndFeel>().updateLookAndFeel(looks.toLookAndFeelEntity());
      emit(await sl<ReadLookAndFeel>().readLookAndFeel(0) ?? defaultLookAndFeel);
    }
  }

  Future<void> setKeepScreenOn(bool isKeepScreenOn) async {
    final lookAndFeel = await sl<ReadLookAndFeel>().readLookAndFeel(0);
    if (lookAndFeel != null) {
      LookAndFeelModel looks = LookAndFeelModel.toLookAndFeelModel(lookAndFeel).copyWith(keepScreenOnOnRecipePage: isKeepScreenOn);
      await sl<UpdateLookAndFeel>().updateLookAndFeel(looks.toLookAndFeelEntity());
      emit(await sl<ReadLookAndFeel>().readLookAndFeel(0) ?? defaultLookAndFeel);
    }
  }
}