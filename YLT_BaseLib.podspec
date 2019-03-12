#
# Be sure to run `pod lib lint YLT_BaseLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YLT_BaseLib'
  s.version          = '0.3.28'
  s.summary          = 'YLT_BaseLib 基础类库.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
平时使用的基础方法的类库
                       DESC

  s.homepage         = 'https://github.com/YLTTeam/YLT_BaseLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xphaijj0305@126.com' => 'xiangph@qtec.cn' }
  s.source           = { :git => 'https://github.com/YLTTeam/YLT_BaseLib.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YLT_BaseLib/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YLT_BaseLib' => ['YLT_BaseLib/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit', 'CoreTelephony'
  s.dependency 'MJExtension'
  s.dependency 'FMDB'
  s.dependency 'FastCoding'
  
end
