[![Release](https://img.shields.io/github/release/moraisandre/SwiftMaskText.svg)](https://github.com/moraisandre/SwiftMaskText/releases)
[![GitHub issues](https://img.shields.io/github/issues/moraisandre/SwiftMaskText.svg)](https://github.com/moraisandre/SwiftMaskText/issues)
[![GitHub license](https://img.shields.io/github/license/moraisandre/SwiftMaskText.svg)](https://github.com/moraisandre/SwiftMaskText/blob/master/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/moraisandre/SwiftMaskText.svg)](https://github.com/moraisandre/SwiftMaskText/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/moraisandre/SwiftMaskText.svg)](https://github.com/moraisandre/SwiftMaskText/network)

![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg)
[![Pod Compatible](https://img.shields.io/badge/pod-v1.0.5-orange.svg)](https://cocoapods.org/pods/SwiftMaskText)

# SwiftMaskText
Another Swift plugin that allow add mask to UITextField

![App Preview](https://github.com/moraisandre/SwiftMaskText/blob/master/Assets/appPreview.png)

### Why to use it?
  * Because it's simples and fast
  * Configuration is through Settings Panel
  * Works with Swift 4.0

## Mask Configuration
### Mask Symbols

| Characters | Format |
|:------------:|:------------------------------:|
| N | Number only [0-9] |
| C | Characters [A-Z] (Always upper case) |
| c | Characters [a-z] (Always lower case) |
| X | Characters [a-Z] |
| U | Characters + Numbers [A-Z] + [0-9] (Always upper case) |
| u | Characters + Numbers [a-z] + [0-9] (Always lower case) |
| % | Characters + Numbers [a-Z] + [0-9] |
| * | Any character (Including special ones) |

### Some examples

#### Internacional examples

| Field | Mask |
|:------------:|:------------------------------:|
| SSN | NNN-NN-NNNN |
| Telephone | +NN (NNN) NNN-NNNN |
| Credit Card | NNNN-NNNN-NNNN-NNNN |

#### Brazilian examples

| Field | Mask |
|:------------:|:------------------------------:|
| Telephone | +NN (0NN) NNNNN-NNNN |
| CPF | NNN.NNN.NNN-NN |
| RG | NN.NNN.NNN-% |
| CEP | NNNNN-NNN |


## How to use it?
#### Using Carthage

  ```
  github "moraisandre/SwiftMaskText"
  ```
#### Using CocoaPods

  ```
  pod ‘SwiftMaskText’
  ```
#### Copy files to your project

1. Add the *SwiftMaskField* folder to your project, it contains 2 files. Be sure that *'Copy items if needed'* is checked.
    ![Copy Items If Needed](https://github.com/moraisandre/SwiftMaskText/blob/master/Assets/CopyItemsIfNeeded.png)

2. In your *ViewController* add an *UITextField* object. In 'Settings Panel' -> 'Identity inspector' set Class to *'SwiftMaskField'*
    ![Custom Class](https://github.com/moraisandre/SwiftMaskText/blob/master/Assets/customClass.png)


3. Now go into 'Settings Panel' -> 'Attributes inspector' and set the Mask that you want it to
    ![Swift Mask Field](https://github.com/moraisandre/SwiftMaskText/blob/master/Assets/swiftMaskField.png)

4. Done!

## More info
### Author
*André Morais*

Website: [moraisandre.com/swiftmasktext](http://moraisandre.com/swiftmasktext/)

E-mail: [morais@andremorais.com.br](mailto:morais@andremorais.com.br?Subject=GitHub%20doubt)

### License
Under the [MIT license](http://www.opensource.org/licenses/MIT).