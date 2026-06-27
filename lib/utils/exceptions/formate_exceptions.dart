class TFormatException implements Exception {
  final String message;

  const TFormatException([
    this.message =
        'An unexpected error occurred. Please check your input and try again.',
  ]);

  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  String get getMessage => message;

  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-format':
        return TFormatException(
          'The data format is invalid. Please check your input and try again.',
        );
      case 'missing-field':
        return TFormatException(
          'A required field is missing. Please fill in all required fields and try again.',
        );
      case 'invalid-type':
        return TFormatException(
          'The data type is invalid. Please check your input and try again.',
        );
      case 'out-of-range':
        return TFormatException(
          'The value is out of the acceptable range. Please check your input and try again.',
        );
      case 'invalid-value':
        return TFormatException(
          'The value provided is invalid. Please check your input and try again.',
        );
      case 'parsing-error':
        return TFormatException(
          'An error occurred while parsing the data. Please check your input and try again.',
        );
      case 'serialization-error':
        return TFormatException(
          'An error occurred while serializing the data. Please check your input and try again.',
        );
      case 'deserialization-error':
        return TFormatException(
          'An error occurred while deserializing the data. Please check your input and try again.',
        );
      case 'invalid-json':
        return TFormatException(
          'The JSON data is invalid. Please check your input and try again.',
        );
      case 'invalid-xml':
        return TFormatException(
          'The XML data is invalid. Please check your input and try again.',
        );
      case 'invalid-csv':
        return TFormatException(
          'The CSV data is invalid. Please check your input and try again.',
        );
      case 'invalid-yaml':
        return TFormatException(
          'The YAML data is invalid. Please check your input and try again.',
        );
      case 'invalid-binary':
        return TFormatException(
          'The binary data is invalid. Please check your input and try again.',
        );
      case 'invalid-encoding':
        return TFormatException(
          'The data encoding is invalid. Please check your input and try again.',
        );
      case 'invalid-encryption':
        return TFormatException(
          'The data encryption is invalid. Please check your input and try again.',
        );
      case 'invalid-decryption':
        return TFormatException(
          'The data decryption is invalid. Please check your input and try again.',
        );
      default:
        return const TFormatException();
    }
  }
  @override
  String toString() => message;
}
