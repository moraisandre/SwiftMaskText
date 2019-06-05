Pod::Spec.new do |spec|
  spec.name = 'SwiftMaskText'
  spec.version = '2.0.0'
  spec.homepage = 'https://github.com/moraisandre/SwiftMaskText'
  spec.summary = 'A Swift plugin that allow add mask to UITextField.'

  spec.description  = <<-DESC
  # SwiftMaskText

  Another Swift plugin that allow add mask to UITextField

  ![App Preview](https://github.com/moraisandre/SwiftMaskText/blob/master/Assets/appPreview.png)

  ### Why to use it?
    * Because it's simples and fast
    * Configuration is through Settings Panel
    * Works with Swift 4.2

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

    ```sh
    github "moraisandre/SwiftMaskText"
    ```
  #### Using CocoaPods

    ```sh
    pod 'SwiftMaskText'
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

  Website: www.moraisandre.com

  E-mail: [morais@andremorais.com.br](mailto:morais@andremorais.com.br?Subject=GitHub%20doubt)

  ### License
  Under the [MIT license](http://www.opensource.org/licenses/MIT).

                     DESC

  spec.author = 'Andre Morais'
  spec.license = { :type => 'MIT', :file => 'LICENSE' }

  spec.swift_version = '5.0'
  spec.ios.deployment_target = '10.0'
  spec.tvos.deployment_target = '10.0'
  spec.source       = { :git => 'https://github.com/moraisandre/SwiftMaskText.git', :tag => spec.version }

  spec.source_files = 'SwiftMaskText/Source/*.swift'
  spec.module_name  = 'SwiftMaskText'
  spec.requires_arc = true
end