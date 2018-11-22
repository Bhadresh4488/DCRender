#
# Be sure to run `pod lib lint DCRender.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DCRender'
  s.version          = '0.1.0'
  s.summary          = 'DCRender for Custom Designable class for live rendering object.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/bhadresh4488/DCRender'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'bhadresh4488' => 'tushar.mistri@nexuslinkservices.in' }
  s.source           = { :git => 'https://github.com/bhadresh4488/DCRender.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DCRender/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DCRender' => ['DCRender/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
