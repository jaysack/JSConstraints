#
# Be sure to run `pod lib lint JSConstraints.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JSConstraints'
  s.version          = '0.1.2'
  s.summary          = 'Layout Framework for Swift UIKit'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  "JSConstraints is an Auto Layout Framework allowing you to write fast and concise UIKit constraints for your programmatic views created with Swift"
                       DESC

  s.homepage         = 'https://github.com/jaysack/JSConstraints'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jonathan Sack' => 'jonathan.sack91@gmail.com' }
  s.source           = { :git => 'https://github.com/jaysack/JSConstraints.git', :tag => s.version.to_s }
  s.frameworks = 'UIKit'
  s.ios.deployment_target = '11.0'
  s.source_files = 'JSConstraints/Classes/**/*'
  s.swift_version = '5.0'
  
  # s.resource_bundles = {
  #   'JSConstraints' => ['JSConstraints/Assets/*.png']
  # }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.dependency 'AFNetworking', '~> 2.3'
end
