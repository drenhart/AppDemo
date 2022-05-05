Pod::Spec.new do |spec|

  spec.name         = "ApiModelSerialize"
  spec.version      = "0.0.1"
  spec.summary      = "ApiModelSerialize api"
  spec.description  = "ApiModelSerialize"
  spec.homepage     = "http://confluence.zzyn.net:8090/"
  spec.license      = "MIT"
  spec.author       = { "drenhart" => "drenhart@163.com" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :path => ".", :tag => "#{spec.version}" }
  spec.source_files  = "ApiModelSerialize/Source/**/*.{swift}"
  spec.dependency "SwiftyJSON"
  spec.dependency "Common"
end