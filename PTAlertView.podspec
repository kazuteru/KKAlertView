#
# Be sure to run `pod lib lint PTAlertView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PTAlertView"
  s.version          = "0.1.0"
s.summary          = "PTAlertView contains Path like appearing animation and some functions."
  s.homepage         = "https://github.com/kazuteru/PTAlertView"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "kazuteru" => "kazuteru.koba@gmail.com" }
  s.source           = { :git => "https://github.com/kazuteru/PTAlertView.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = ['PTAlertView/*.{swift}', 'PTAlertView/AnimationManager/*.{swift}']

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
