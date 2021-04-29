import 'dart:ui';

class Utilities {
  static String inicialesUsuario(String nombre, String apellidos) {
    final String n1 = nombre.substring(0, 1).toUpperCase();
    final String n2 = apellidos.substring(0, 1).toUpperCase();
    //apellidos = apellidos == "" ? nombre.substr(0, 3) : apellidos;
    return '$n1$n2';
  }

  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
