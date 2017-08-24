Pod::Spec.new do |s|

  s.name         = "LRRouter"
  s.version      = "0.0.2"
  s.summary      = "LRRouter"
  s.description  = <<-DESC
					 LRRouter 路由 用于分离组件
                   DESC

  s.homepage     = "https://github.com/Wmileo/LRRouter"
  s.license      = "MIT"
  s.author       = { "leo" => "work.mileo@gmail.com" }

  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Wmileo/LRRouter.git", :tag => s.version.to_s }
  s.source_files = "LRRouter/LRRouter/*.{h,m}"

  s.requires_arc = true

end
