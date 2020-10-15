# encoding: utf-8

Gem::Specification.new do |s|
  s.name          = "Material_Theme_For_Jekyll"
  s.version       = "1.0"
  s.license       = "CC0-1.0"
  s.authors       = ["Sky"]
  s.email         = ["2880880@qq.com"]
  s.homepage      = "https://nishikinosky.github.io"
  s.summary       = "Snow & Sky"

  s.files         = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r{^((_includes|_layouts|_sass|assets)/|(LICENSE|README|index|about|contact|404)((\.(txt|md|markdown)|$)))}i)
  end

  s.platform      = Gem::Platform::RUBY
  s.add_runtime_dependency "jekyll", "~> 3.3"
end
