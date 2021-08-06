Pod::Spec.new do |s|
  s.name             = "TSLogEvent"
  s.version          = "1.0.6"
  s.summary          = "Event Log framework for iOS."
  s.homepage         = "https://github.com/andrewclaus/ExampleCocoapodLibraryWithSplunkMINT5.2.7.1"
  s.license          = 'MIT license'
  s.author           = { "Claus, Andrew" => "andrewclaus@amrock.com" }
  s.source           = { :git => "https://github.com/andrewclaus/ExampleCocoapodLibraryWithSplunkMINT5.2.7.1.git", :tag => s.version }

  s.platform     = :ios, '12.0'
  s.swift_version = '5.0'

  s.static_framework = true

  s.source_files = s.name + "/**/*.{h,m,swift}"

  #uncomment these lines to get this CocoaPod to validate
  #s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  #s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  
  #uncomment this line to use the SplunkMint.framework found locally in the project
  s.vendored_frameworks = "SplunkMint.framework"
  s.frameworks = [
    "SystemConfiguration",
    "CoreTelephony",
    "WebKit",
    "CoreLocation"
  ]
  s.libraries = "z"

  #uncomment this line to use SplunkMint 5.2.7 from CocoaPods
  #s.dependency 'SplunkMint', '5.2.7'

end
