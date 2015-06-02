Pod::Spec.new do |s|
  s.name         = "Functional"
  s.version      = "0.0.3"
  s.summary      = "Functional snippets"
  s.description  = "Functional snippets and helpers"
  s.homepage     = "https://github.com/ilidar/Functional"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Denys Kotelovych" => "" }
  s.source       = { :git => "https://github.com/ilidar/Functional.git", :tag => "0.0.3" }
  s.platform     = :ios, "8.3"
  s.source_files = "Functional", "Functional/*.{h,m}"
  s.requires_arc = true
end
