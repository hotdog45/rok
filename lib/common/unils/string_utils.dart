class StringUtils {
  static String getPrice(int price) {
    if (price % 100 == 0) {
      return (price / 100.00).toStringAsFixed(0);
    } else if (price % 10 == 0) {
      return (price / 100.00).toStringAsFixed(1);
    }
    return (price / 100.00).toStringAsFixed(2);
  }

  static String getPriceByString(String price) {
    if (price.endsWith(".00")) {
      return price.substring(0, price.length - 3);
    } else if (price.endsWith("0")) {
      return price.substring(0, price.length - 1);
    }
    return price;
  }

  static String getPriceDot(int price) {
    return (price / 100.00).toStringAsFixed(2);
  }

  static String subStr(String str, int num) {
    return str.length > num ? str.substring(0, num) : str;
  }
}
