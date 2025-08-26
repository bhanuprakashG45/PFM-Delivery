import 'package:flutter/material.dart';

class MaterialTheme {
  final TextTheme textTheme;
  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFD32F2F), // Vibrant red
      surfaceTint: Color(0xFF9A1D1D), // Darker red for surface tint
      onPrimary: Color(0xFFFFFFFF), // White for contrast on red
      primaryContainer: Color(0xFFFFDAD6), // Light red/pink container
      onPrimaryContainer: Color(0xFF68000A), // Dark red for text/icons
      secondary: Color(0xFF6B5B5B), // Unchanged neutral grayish secondary
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFF3D9DC),
      onSecondaryContainer: Color(0xFF4A3C3D),
      tertiary: Colors.grey.shade300,
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFFFDDB8),
      onTertiaryContainer: Color(0xFF3F2A0C),
      error: Color(0xFFBA1A1A), // Unchanged error
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFFFDAD6),
      onErrorContainer: Color(0xFF93000A),
      surface: Color(0xFFFFF7F8), // Unchanged surface
      onSurface: Color(0xFF1F1A1B),
      onSurfaceVariant: Color(0xFF4F4344),
      outline: Color(0xFF827374),
      outlineVariant: Color(0xFFD5C2C3),
      shadow: Color(0x99000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF352F30),
      inversePrimary: Color(0xFFFFB3B3), // Light red for inverse
      primaryFixed: Color(0xFFFFDAD6), // Light red container
      onPrimaryFixed: Color(0xFF3B000D), // Dark red for contrast
      primaryFixedDim: Color(0xFFFFB3B3), // Dimmed red
      onPrimaryFixedVariant: Color(0xFF8B1E2E), // Darker red variant
      secondaryFixed: Color(0xFFF3D9DC),
      onSecondaryFixed: Color(0xFF2A1618),
      secondaryFixedDim: Color(0xFFD7BEC0),
      onSecondaryFixedVariant: Color(0xFF534243),
      tertiaryFixed: Color(0xFFFFDDB8),
      onTertiaryFixed: Color(0xFF281500),
      tertiaryFixedDim: Color(0xFFE8BE8F),
      onTertiaryFixedVariant: Color(0xFF5D401B),
      surfaceDim: Color(0xFFE4D6D7),
      surfaceBright: Color(0xFFFFF7F8),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFFFF0F1),
      surfaceContainer: Color(0xFFFAEAEB),
      surfaceContainerHigh: Color(0xFFF4E4E5),
      surfaceContainerHighest: Color(0xFFEEDFE0),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF348B5F),
      surfaceTint: Color(0xff3572EF), // Surface tint for dark theme
      onPrimary: Color(0xFFB3B3B3), // Text color on primary
      primaryContainer: Color(
        0xFF1f1f1f,
      ), // Lightened primary container color for dark theme
      // primaryContainer:
      // Color(0xFF4D4D50),
      onPrimaryContainer: Colors.white, // Text color on primary container
      secondary: Color(0xFFFFFFFF), // Secondary color
      onSecondary: Colors.white, // Text color on secondary
      secondaryContainer: Color(0xFF4D4D50), // Secondary container color
      onSecondaryContainer: Colors.white, // Text color on secondary container
      tertiary: Color(0xFF838282), // Tertiary color
      onTertiary: Colors.white, // Text color on tertiary
      tertiaryContainer: Color(
        0xFF1f1f1f,
      ), // Lightened tertiary container color
      onTertiaryContainer: Colors.grey[600], // Text color on tertiary container
      error: Color(0xFFB00020), // Error color
      onError: Colors.white, // Text color on error
      errorContainer: Color(0xFFFFDAD6), // Error container color
      onErrorContainer: Color(0xFFB00020), // Text color on error container
      surface: Color(0xff121212), // Dark theme scaffold background color
      // surface: Color(0xFF1C1A1A),
      onSurface: Colors.white, // Text color on surface
      onSurfaceVariant: Color(0xFFB0B0B0), // On surface variant
      outline: Color(0xFF6C6C6C), // Outline color
      outlineVariant: Color(0xFF9E9E9E), // Outline variant
      shadow: Color(0xFF000000), // Shadow color
      scrim: Color(0xFF000000), // Scrim color
      inverseSurface: Color(0xFF2C2C2C), // Inverse surface color
      inversePrimary: Color(0xff3572EF), // Inverse primary color
      primaryFixed: Color(0xff3572EF), // Fixed primary color
      onPrimaryFixed: Colors.black, // Text color on fixed primary
      // primaryFixedDim: Colors.blue.withOpacity(0.8), // Dimmed primary color
      onPrimaryFixedVariant: Color(0xFF6C63FF), // Fixed primary variant color
      secondaryFixed: Color(0xFF4D4D50), // Fixed secondary color
      onSecondaryFixed: Colors.white, // Text color on fixed secondary
      secondaryFixedDim: Color(0xFF6C6C6C), // Dimmed fixed secondary color
      onSecondaryFixedVariant: Color(
        0xFF9E9E9E,
      ), // Fixed secondary variant color
      tertiaryFixed: Color(0xFFB3B3B3), // Fixed tertiary color
      onTertiaryFixed: Colors.black, // Text color on fixed tertiary
      tertiaryFixedDim: Color(0xFF838282), // Dimmed fixed tertiary color
      onTertiaryFixedVariant: Color(0xFF9E9E9E), // Fixed tertiary variant color
      surfaceDim: Color(0xFF2C2C2C), // Dimmed surface color
      surfaceBright: Color(0xFF3C3C3C), // Bright surface color for dark theme
      surfaceContainerLowest:
          Colors.black12, // Lowest container surface in dark theme
      surfaceContainerLow: Colors.black, // Low container surface in dark theme
      surfaceContainer: Color(
        0xFF5C5C5C,
      ), // Medium container surface in dark theme
      surfaceContainerHigh: Color(
        0xFF6C6C6C,
      ), // High container surface in dark theme
      surfaceContainerHighest: Color(
        0xFF7C7C7C,
      ), // Highest container surface in dark theme
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
