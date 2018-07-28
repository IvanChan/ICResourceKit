#
# Be sure to run `pod lib lint ICResourceKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ICResourceKit'
  s.version          = '0.6.1'
  s.summary          = 'A Theme/Language/Region manager with UIKit extensions.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
ThemeManager & multi-language resource manager, with UIKit extensions for property in different theme or language/region.
                       DESC

  s.homepage         = 'https://github.com/IvanChan/ICResourceKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '_ivanC' => 'aintivanc@icloud.com' }
  s.source           = { :git => 'https://github.com/IvanChan/ICResourceKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ICResourceKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ICResourceKit' => ['ICResourceKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'GDataXML-HTML'
  s.dependency 'ICObserver'
  s.dependency 'ICFoundation'

end
