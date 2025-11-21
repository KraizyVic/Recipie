/*
Made with hunger using flutter

Data source - Scraping

Disclaimer: Recipie does not host any of its contents and the dev is not liable for any issues that may arise from the data provided
Enjoy.
*/
import 'package:recipie/domain/entities/settings_page_entities.dart';

LookAndFeelEntity defaultLookAndFeel = LookAndFeelEntity(id: 0, themeMode: 0, isAmoledBackground: false, keepScreenOnOnRecipePage: false, seedColor: 0xFF0077D7, primaryColor: 0xFF0077D7, language: "English");
GeneralSettingsEntity defaultGeneralSettings = GeneralSettingsEntity(id: 0, pauseAutoUpdate: false, downloadOverWifiOnly: false, enableNotifications: false, pauseSearchHistory: false, pauseCookHistory: false, sendAnonymousStats: false, clearCacheOnExit: false, measurementSystem: "metric", defaultServings: 0, showTooltips: false, enableCloudBackup: false, syncAcrossDevices: false);

class ColorsEntity{
  String colorName;
  int colorValue;

  ColorsEntity({required this.colorName, required this.colorValue});
}

List<ColorsEntity> colorsList = [
  ColorsEntity(colorName: "Agility Blue", colorValue: 0xFF0077D7),
  ColorsEntity(colorName: "Ruby Red", colorValue: 0xFFE0115F),
  ColorsEntity(colorName: "Emerald Green", colorValue: 0xFF50C878),
  ColorsEntity(colorName: "Sapphire Blue", colorValue: 0xFF0F52BA),
  ColorsEntity(colorName: "Amethyst Purple", colorValue: 0xFF9966CC),
  ColorsEntity(colorName: "Topaz Yellow", colorValue: 0xFFFFC87C),
  ColorsEntity(colorName: "Peridot Green", colorValue: 0xFFE6E200),
  ColorsEntity(colorName: "Opal White", colorValue: 0xFFF8F8FF),
  ColorsEntity(colorName: "Turquoise Blue", colorValue: 0xFF40E0D0),
  ColorsEntity(colorName: "Aquamarine Blue", colorValue: 0xFF7FFFD4),
  ColorsEntity(colorName: "Zircon Blue", colorValue: 0xFF5D8AA8),
  ColorsEntity(colorName: "Tanzanite Blue", colorValue: 0xFF4D489C),
  ColorsEntity(colorName: "Morganite Pink", colorValue: 0xFFEA9999)
];