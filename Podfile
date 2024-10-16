platform :ios, '13.0'


def ui
  pod 'Kingfisher', '~> 5.0'
  pod 'NVActivityIndicatorView', '4.8.0'
end

def network
  pod 'ReachabilitySwift'
  pod 'Moya', '13.0.0'
end

def utility
  pod 'RxSwift', '6.2.0'
  pod 'RxCocoa', '6.2.0'
  pod 'Action', '5.0.0'
  pod 'RxDataSources', '~> 5.0'
  pod "RxGesture"
  pod 'CryptoSwift', '~> 1.6.0'
end

def testing
  pod "SwiftyMocky"
end

target 'StarterApp' do
  
  use_frameworks!
  
  ui
  network
  utility
  testing
  
  target 'StarterAppTests' do
    inherit! :search_paths
    ui
    network
    utility
    testing
  end
  
  target 'StarterAppUITests' do
    # Pods for testing
    testing
  end
  
  post_install do |installer|
    installer.generated_projects.each do |project|
      project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        end
      end
    end
  end
  
end
