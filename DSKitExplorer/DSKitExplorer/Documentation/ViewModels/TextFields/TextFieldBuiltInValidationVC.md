**DSKit** contains built-in validation, you can easily add any validation you need for your form using these three properties:

1. validateMinimumLength
2. validateMaximumLength
3. validationPattern

Regular expressions snippet:

```swift
let patternNumbers = "^[0-9]*$"
let patternLetters = "^[a-zA-Z]*$"
let patternNameUmlaute = "^[\\ü\\ö\\ä\\Ä\\Ü\\Ö\\ß\\u0600-\\u06FFa-zA-Z\\s\\'\\-]*$"
let patternName = "^[\\u0600-\\u06FFa-zA-Z\\s\\'\\-]*$"
let patternLettersAndSpaces = "^[\\u0600-\\u06FFa-zA-Z\\s]*$"
let patternLettersAndNumbers = "^[a-zA-Z0-9]*$"
let patternLettersNumbersAndSpaces = "^[\\u0600-\\u06FFa-zA-Z0-9\\s]*$"
let patternAddressUmlaute = "^[\\ü\\ö\\ä\\Ä\\Ü\\Ö\\ß\\u0600-\\u06FFa-zA-Z0-9\\s\\'\\-]*$"
let patternAddress = "^[\\u0600-\\u06FFa-zA-Z0-9\\s\\'\\-]*$"
let patternEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
let patternPhoneNumber = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
let patternPhoneNumber2 = "(\\+?( |-|\\.)?\\d{1,3}( |-|\\.)?)?(\\(?\\d{1,5}\\)?|\\d{1,5})( |-|\\.)?(\\d{1,4}( |-|\\.)?\\d{3,4})"
let patternMin8Max20CharsAtLeastOneDigitAtLeastOneLetter = "^(?=.*\\d)((?=.*[a-z])|(?=.*[A-Z])).*$"
let patternCityNameUmlaute = "^[\\ü\\ö\\ä\\Ä\\Ü\\Ö\\ß\\u0600-\\u06FFa-zA-Z\\s\\'\\-]*$"
let patternCityName = "^[\\u0600-\\u06FFa-zA-Z\\s\\'\\-]*$"
```
