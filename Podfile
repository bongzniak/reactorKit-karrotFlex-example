platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!

def ui_pods 
    pod 'SnapKit'
end 

def rx_pods
    pod 'RxSwift', '~> 5.0'
    pod 'RxCocoa'
    pod 'RxDataSources'
end 

def pods
    # Logging
    pod 'CocoaLumberjack/Swift'

    # Architecture 
    pod 'ReactorKit'
    pod 'Then'
end


target 'appname' do 
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
