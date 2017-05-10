Pod::Spec.new do |s|
  s.name         = "Stellar"
  s.version      = "0.66"
  s.summary      = "An Awesome Physical animation library base on UIDynamic. "
  s.description  = "A fantastic Physical animation library for swift(Not Just Spring !!!), it is base on UIDynamic and extension to it, friendly APIs make you use it or custom your own animation very easily!"
  s.homepage     = "https://github.com/AugustRush/Stellar"
  s.license      = "LICENSE"
  s.author             = { "AugustRush" => "819373341@qq.com" }
  s.source       = { :git => "https://github.com/AugustRush/Stellar.git", :tag => "0.66" }
  s.source_files = "Sources", "Sources/*.swift"
  s.platform     = :ios, "8.0"
  s.frameworks = "UIKit", "Foundation"
end
