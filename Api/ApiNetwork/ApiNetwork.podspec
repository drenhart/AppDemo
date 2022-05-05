Pod::Spec.new do |spec|

  spec.name         = "ApiNetwork"
  spec.version      = "0.0.1"
  spec.summary      = "ApiNetwork api"
  spec.description  = "ApiNetwork"
  spec.homepage     = "http://confluence.zzyn.net:8090/"
  spec.license      = "MIT"
  spec.author       = { "drenhart" => "drenhart@163.com" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :path => ".", :tag => "#{spec.version}" }
  spec.source_files  = "ApiNetwork/**/*.{swift}"
  spec.dependency "Alamofire"
  spec.dependency "Common"
end