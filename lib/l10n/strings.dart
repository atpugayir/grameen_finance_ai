class AppStrings {
  static String currentLang = 'en';

  static final Map<String, Map<String, String>> _values = {
    'en': {
      'welcome': 'Welcome',
      'assistant': 'AI Assistant',
      'learn': 'Learn & Listen',
      'diary': 'Money Diary',
      'invest': 'Investment Hub',
      'expense': 'Expense',
      'income': 'Income',
    },
    'hi': {
      'welcome': 'नमस्ते',
      'assistant': 'एआई सहायक',
      'learn': 'सीखें और सुनें',
      'diary': 'खर्च डायरी',
      'invest': 'निवेश जानकारी',
      'expense': 'खर्च',
      'income': 'आय',
    },
    'bn': {
      'welcome': 'স্বাগতম',
      'assistant': 'এআই সহকারী',
      'learn': 'শিখুন ও শুনুন',
      'diary': 'খরচ ডায়েরি',
      'invest': 'বিনিয়োগ তথ্য',
      'expense': 'খরচ',
      'income': 'আয়',
    },
    'ta': {
      'welcome': 'வரவேற்பு',
      'assistant': 'ஏஐ உதவியாளர்',
      'learn': 'கற்றுக்கொள்ளவும் கேளுங்கள்',
      'diary': 'செலவு பதிவு',
      'invest': 'முதலீட்டு தகவல்',
      'expense': 'செலவு',
      'income': 'வருமானம்',
    },
    'mr': {
      'welcome': 'स्वागत',
      'assistant': 'एआय सहाय्यक',
      'learn': 'शिका आणि ऐका',
      'diary': 'खर्च वही',
      'invest': 'गुंतवणूक माहिती',
      'expense': 'खर्च',
      'income': 'उत्पन्न',
    },
    'pa': {
      'welcome': 'ਜੀ ਆਇਆਂ ਨੂੰ',
      'assistant': 'ਏਆਈ ਸਹਾਇਕ',
      'learn': 'ਸਿੱਖੋ ਅਤੇ ਸੁਣੋ',
      'diary': 'ਖਰਚ ਡਾਇਰੀ',
      'invest': 'ਨਿਵੇਸ਼ ਜਾਣਕਾਰੀ',
      'expense': 'ਖਰਚ',
      'income': 'ਆਮਦਨ',
    },
  };

  static String t(String key) {
    return _values[currentLang]?[key] ??
        _values['en']![key] ??
        key;
  }
}
