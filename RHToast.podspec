#
#  Be sure to run `pod spec lint RHToast.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "RHToast"
  s.version      = "1.0.0"
  s.summary      = "RHToast 是一款简单的toast弹框"
  s.homepage     = "https://github.com/guorenhao/RHToast"
  s.license      = "MIT"
  s.author       = {"Abner_G" => "grh_1990@126.com"}
  s.platform     = :ios, "8.0"   
  s.source       = {:git => "https://github.com/guorenhao/RHToast.git", :tag => s.version}
  s.source_files = "RHToast/*.{h,m}"
  s.frameworks   = "UIKit"
  s.requires_arc = true

end
