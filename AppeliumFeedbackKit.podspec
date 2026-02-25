Pod::Spec.new do |s|
    s.name             		= 'AppeliumFeedbackKit'
	s.version				= '4.21.0'
    s.summary          		= 'Bug reporting and feedback for mobile apps. Learn more at https://www.appelium.com'
    s.homepage         		= 'https://www.appelium.com/'
    s.cocoapods_version     = '>= 1.16.0'

    s.author           		= { 'Appelium' => 'support@appelium.com' }
    s.license      			= { :type => 'Commercial', :file => 'LICENSE.md' }

    s.ios.deployment_target = '15.0'
    s.tvos.deployment_target = '15.0'
    s.swift_versions        = ['5.10']
    s.source       			= { :http => "https://api.appelium.com/files/public/sdks/AppeliumFeedbackKit/#{s.version}.zip" }
    s.library      			= 'z'
    s.frameworks   			= 'AVFoundation', 'CoreGraphics', 'SystemConfiguration', 'UIKit', 'CoreVideo'
    s.xcconfig    			= { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/AppeliumFeedbackKit/"' }
    s.requires_arc 			= true
    s.vendored_frameworks	= 'AppeliumFeedbackKit.xcframework'
    s.xcconfig 				= { 'EXCLUDED_ARCHS' => 'x86_64' }
end
