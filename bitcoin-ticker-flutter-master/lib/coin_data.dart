const List<String> currenciesList = [
  'USD',
  'EUR',
  'ALTIN',
  'IMKB100'
];

enum DovizEnum {
  USD,
  EUR,
  ALTIN,
  IMKB100
}

class Calculate {

  double exchange(DovizEnum doviz)
  {
    if(doviz==DovizEnum.USD) return 5.66;
    else if(doviz==DovizEnum.EUR) return 6.23;
    else if (doviz==DovizEnum.ALTIN) return 288.34;
    else if(doviz== DovizEnum.IMKB100) return 98.998;

    return 0;
  }

}
