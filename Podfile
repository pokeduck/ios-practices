# Uncomment the next line to define a global platform for your project
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '15.0'

target 'ios-practices' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!
  
  pod 'Then'
  pod 'R.swift'
  pod 'Moya/RxSwift'
  pod 'RxCocoa'
  pod 'HBDNavigationBar', '~> 1.9.5'
  pod 'SnapKit'
  pod 'BadgeSwift', '~> 8.0'
  pod 'UIFontComplete', '<= 5.0.0'
  pod 'NSObject+Rx'
  
  pod 'LookinServer', :configurations => ['Debug']

end

post_install do |pi|
    pi.pods_project.targets.each do |t|
        t.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
        end
    end
end
