platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!

def ui_pods 
    pod 'KarrotFlex', :git => 'https://github.com/daangn/KarrotFlex', :branch => 'develop'
end 

def rx_pods
    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'RxDataSources'
    pod 'ReusableKit'
end

def pods
    # Logging
    pod 'CocoaLumberjack/Swift'

    # Architecture 
    pod 'ReactorKit'
    pod 'Then'
    
    #
    pod 'SwiftLint'
end


target 'ReactorKit-KarrotFlex-Example' do 
    pods 
    rx_pods
    ui_pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        end 
    end
end
