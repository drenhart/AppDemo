Pod::Spec.new do |spec|

  spec.name         = "Common"
  spec.version      = "0.0.1"
  spec.summary      = "Common api"
  spec.description  = "Common library"
  spec.homepage     = "http://confluence.zzyn.net:8090/"
  spec.license      = "MIT"
  spec.author       = { "drenhart" => "drenhart@163.com" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :path => ".", :tag => "#{spec.version}" }
  spec.source_files = "Common/Source/**/*.{swift}"
  spec.resource = "Common/Resource/**"

  spec.dependency "Alamofire"
end