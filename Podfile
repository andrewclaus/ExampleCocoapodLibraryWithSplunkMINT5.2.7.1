source 'https://github.com/CocoaPods/Specs.git'

# Uncomment this line to define a global platform for your project
platform :ios, '12.0'

target 'TSLogEvent' do
  # Uncomment this line if you're using Swift or would like to use dynamic frameworks
  use_modular_headers!

  pod 'Firebase/Crashlytics', '~> 8.2.0'
  pod 'Firebase/Analytics', '~> 8.2.0'
  pod 'Dynatrace', '~> 8.217'
  
  target 'TSLogEventSample' do
    inherit! :complete
  end
  
  target 'TSLogEventSampleTests' do
      inherit! :complete
  end

end
