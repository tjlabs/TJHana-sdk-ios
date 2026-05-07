
Pod::Spec.new do |s|
  s.name             = 'TJHanaSDK'
  s.version          = '0.1.0'
  s.summary          = 'A short description of TJHanaSDK.'
  s.swift_version    = '5.0'
  s.description      = "TJLabs HanaSDK for iOS"

  s.homepage         = 'https://www.tjlabscorp.com'
  s.license          = { :type => 'TJLABS', :file => 'LICENSE' }
  s.author           = { 'tjlabs-dev' => 'dev@tjlabscorp.com' }
  s.source           = { :git => 'https://github.com/tjlabs/TJHana-sdk-ios.git', :tag => s.version.to_s }

  s.ios.deployment_target = '16.0'

  s.source_files = 'TJHanaSDK/Classes/**/*'
  s.vendored_frameworks = 'TJHanaSDK/Frameworks/*.xcframework'
  s.pod_target_xcconfig = { 'SWIFT_OPTIMIZATION_LEVEL' => '-Owholemodule' }
end
