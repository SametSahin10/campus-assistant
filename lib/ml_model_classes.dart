class MLModelClasses {
  static const aKapisiKuzey = 0;
  static const aKapisiDogu = 1;
  static const aKapisiGuney = 2;
  static const aKapisiBati = 3;
  static const havuzKuzey = 4;
  static const havuzDogu = 5;
  static const havuzGuney = 6;
  static const havuzBati = 7;
  static const iletisimKuzey = 8;
  static const iletisimDogu = 9;
  static const iletisimGuney = 10;
  static const iletisimBati = 11;

  static String convertIntToClass(int input) {
    switch (input) {
      case aKapisiKuzey:
        return 'A Kapısı Kuzey';
      case aKapisiDogu:
        return 'A Kapısı Doğu';
      case aKapisiGuney:
        return 'A Kapısı Güney';
      case aKapisiBati:
        return 'A Kapısı Batı';
      case havuzKuzey:
        return 'Havuz Kuzey';
      case havuzDogu:
        return 'Havuz Doğu';
      case havuzGuney:
        return 'Havuz Güney';
      case havuzBati:
        return 'Havuz Batı';
      case iletisimKuzey:
        return 'İletişim Kuzey';
      case iletisimDogu:
        return 'İletişim Doğu';
      case iletisimGuney:
        return 'İletişim Güney';
      case iletisimBati:
        return 'İletişim Batı';
      default:
        return 'Unknown location';
    }
  }
}