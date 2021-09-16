Pod::Spec.new do |s|  
    s.name             		= 'AppeliumFeedback'
	s.version				= '2.8.2'
    s.summary          		= 'Bug reporting and feedback for mobile apps. Learn more at https://www.appelium.com'
    s.homepage         		= 'https://www.appelium.com/'
    s.cocoapods_version     = '>= 1.10.0'

    s.author           		= { 'Appelium' => 'support@appelium.com' }
    s.license      			= { :type => 'Commercial', :file => 'LICENSE.md' }

    s.platform     			= :ios, '11.0'
    s.swift_versions        = ['5']
    s.source       			= { :http => "https://github.com/Appelium/AppeliumFeedback/releases/download/#{s.version}/AppeliumFeedback.xcframework.zip" }
    s.library      			= 'z'
    s.frameworks   			= 'AVFoundation', 'CoreGraphics', 'SystemConfiguration', 'UIKit', 'CoreVideo'
    s.xcconfig    			= { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/AppeliumFeedback/"' }
    s.requires_arc 			= true
    s.vendored_frameworks	= 'AppeliumFeedback.xcframework'
end  
