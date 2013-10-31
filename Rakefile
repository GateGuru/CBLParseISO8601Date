namespace :test do
  task :prepare do
    system(%Q{mkdir -p "Tests/Tests.xcodeproj/xcshareddata/xcschemes" && cp Tests/Schemes/*.xcscheme "Tests/Tests.xcodeproj/xcshareddata/xcschemes/"})
  end
  task :ios => :prepare do
    $ios_success = system(" xcodebuild -project Tests/Tests.xcodeproj -scheme CBLParseISO8601DateTests -sdk iphonesimulator test")
  end
end

desc "Run the CBLParseISO8601Date Tests for iOS"
task :test => ['test:ios'] do
  puts "\033[0;31m! iOS unit tests failed" unless $ios_success
  if $ios_success
    puts "\033[0;32m** All tests executed successfully **\033[m"
  else
    exit(-1)
  end
end

task :default => 'test'