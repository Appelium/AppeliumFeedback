Pod::Spec.new do |s|  
    s.name             		= 'AppeliumFeedback'
	s.version				= '2.0.0'
    s.summary          		= 'Bug reporting and feedback for mobile apps. Learn more at https://www.appelium.com'
    s.homepage         		= 'https://www.appelium.com/'

    s.author           		= { 'Appelium' => 'support@appelium.com' }
    s.license      			= { :type => 'Commercial', :file => 'LICENSE.md' }

    s.platform     			= :ios, '10.0'
    s.source       			= { :http => "https://github.com/Appelium/AppeliumFeedback/releases/download/#{s.version}/AppeliumFeedback.framework.zip" }
    s.library      			= 'z'
    s.frameworks   			= 'AVFoundation', 'CoreGraphics', 'SystemConfiguration', 'UIKit', 'CoreVideo'
    s.xcconfig    			= { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/AppeliumFeedback/"' }
    s.requires_arc 			= true
    s.vendored_frameworks	= 'AppeliumFeedback.framework'
end  
