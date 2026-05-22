enum LanguageType {
  ru(label: 'RU', code: 'ru'),
  en(label: 'EN', code: 'en');

  final String label;
  final String code;

  const LanguageType({required this.label, required this.code});
}
