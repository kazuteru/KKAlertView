#
# Be sure to run `pod lib lint KKAlertView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "KKAlertView"
  s.version          = "0.1.1"
  s.summary          = "KKAlertView contains Path like appearing animation and some functions."
  s.homepage         = "https://github.com/kazuteru/KKAlertView"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "kazuteru" => "kazuteru.koba@gmail.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/KKAlertView.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = ['KKAlertView/*.{swift}', 'KKAlertView/AnimationManager/*.{swift}']

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
