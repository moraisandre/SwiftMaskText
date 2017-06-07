Pod::Spec.new do |spec|
  spec.name = "SwiftMaskText"
  spec.version = "1.0.0"

  spec.homepage = "http://andremorais.com.br/code/swiftmasktext/"
  spec.summary = "A Swift plugin that allow add mask to UITextField."

  spec.author = "André Morais"
  spec.license = { :type => "MIT", :file => "LICENSE" }

  spec.ios.deployment_target = '8.0'
  spec.source       = { :git => "https://github.com/andre991/SwiftMaskText", :tag => spec.version }

  spec.source_files = 'SwiftMaskText/Source/*.swift'
  spec.module_name  = 'SwiftMaskText'
  spec.requires_arc = true
end


