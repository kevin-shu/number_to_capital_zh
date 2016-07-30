# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'number_to_zh_tw/version'

Gem::Specification.new do |spec|
  spec.name          = "number_to_zh_tw"
  spec.version       = NumberToZhTw::VERSION
  spec.authors       = [""]
  spec.email         = ["kevin78515@gmail.com"]
  spec.summary       = %q{數字,浮點數,金額轉換 中文大寫字體}
  spec.description   = %q{數字,浮點數,金額轉換 中文大寫字體.}
  spec.homepage      = "https://github.com/kevin-shu/number_to_capital_zh_tw"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
