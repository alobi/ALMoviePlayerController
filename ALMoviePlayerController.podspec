Pod::Spec.new do |s|
	s.name			= 'ALMoviePlayerController'
	s.version		= '0.4.0'
	s.summary		= 'A drop-in replacement for MPMoviePlayerController that exposes the UI elements and allows for maximum customization.'
	s.homepage		= 'https://github.com/owlcoding/ALMoviePlayerController'
	s.author		= { 'Anthony Lobianco' => 'anthony@lobian.co' }
	s.license 		= 'MIT'
	s.ios.deployment_target = '5.0'
	s.tvos.deployment_target = '9.0'
	s.ios.frameworks = 'QuartzCore', 'MediaPlayer'
	s.tvos.frameworks = 'QuartzCore', 'MediaPlayer'
	s.requires_arc	= true
	s.source		= { :git => 'https://github.com/owlcoding/ALMoviePlayerController.git', :tag => s.version.to_s }
	s.source_files	= 'ALMoviePlayerController/*.{h,m}'
	s.resources		= 'ALMoviePlayerController/Images/*.{png}'
end
