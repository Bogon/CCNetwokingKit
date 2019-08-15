#
# Be sure to run `pod lib lint CCNetwokingKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CCNetwokingKit'
  s.version          = '1.0.0'
  s.summary          = 'CCNetwokingKit 是通用的网络层框架。带有缓存。'
  s.swift_version    = '4.0'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
CCNetwokingKit 是通用的网络层框架。
自带缓存功能，可用于所有项目的网络层框架。
                       DESC

  s.homepage         = 'https://github.com/Bogon/CCNetwokingKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Bogon' => 'zhangqixcu@gmail.com' }
  s.source           = { :git => 'https://github.com/Bogon/CCNetwokingKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'CCNetwokingKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CCNetwokingKit' => ['CCNetwokingKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  # Rx
  s.dependency 'RxSwift', '~> 5.0.0'                # RxSwift is a Swift implementation of Reactive Extensions
  s.dependency 'RxCocoa', '~> 5.0.0'                # RxSwift Cocoa extensions
  s.dependency 'RxBlocking', '~> 5.0.0'             # RxSwift Blocking operatos
  s.dependency 'RxAlamofire', '~> 5.0.0'            # RxSwift HTTP networking in Swift Alamofire
  s.dependency 'NSObject+Rx', '~> 5.0.0'            # Handy RxSwift extensions on NSObject.
  
  # Networking
  s.dependency 'Alamofire', '~> 4.8.1'              # Elegant HTTP Networking in Swift
  s.dependency 'Moya', '~> 14.0.0-alpha.1'          # Network abstraction layer written in Swift
  s.dependency 'Moya/RxSwift', '~> 14.0.0-alpha.1'  # Network abstraction layer written in Swift
  s.dependency 'ObjectMapper', '~> 3.3.0'           # Simple JSON Object mapping written in Swift
  s.dependency 'SwiftyJSON', '~> 4.1.0'             # SwiftyJSON makes it easy to deal with JSON data in Swift
  s.dependency 'PromiseKit'                         # Promises for Swift & ObjC.
  s.dependency 'ReachabilitySwift'                  # Replacement for Apple's Reachability re-written in Swift
  
  # Logging
  s.dependency 'XCGLogger', '~> 7.0.0'              # A debug log module for use in Swift projects.
  
  # Data Store
  s.dependency 'AwesomeCache', '~> 5.0'
  
  # UI&Foundation Extention
  s.dependency 'SwifterSwift', '~> 4.6.0'           # A handy collection of more than 500 native Swift extensions to boost your productivity.
  
  # Data persistence
  s.dependency 'FMDB', '~> 2.7.5'                   # A Cocoa / Objective-C wrapper around SQLite.
  s.dependency 'LKDBHelper', '~> 2.5.1'             # an automatic database operation thread-safe and not afraid of recursive deadlock
  s.dependency 'KeychainAccess', '~> 3.1.2'         # KeychainAccess
  
  # System And Security
  s.dependency 'DeviceKit', '~> 2.0.0'              # 设备信息管理和获取
  s.dependency 'CryptoSwift', '~> 0.14.0'           # Cryptography in Swift.
  
  # Anch
 
  
end
