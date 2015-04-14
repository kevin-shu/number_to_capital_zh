# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'number_to_zh_cn/version'

Gem::Specification.new do |spec|
  spec.name          = "number_to_zh_cn"
  spec.version       = NumberToZhCn::VERSION
  spec.authors       = ["liugang"]
  spec.email         = ["501225658@qq.com"]
  spec.summary       = %q{数字,浮点数,金额转换 中文大写字体}
  spec.description   = %q{数字,浮点数,金额转换 中文大写字体.}
  spec.homepage      = "https://github.com/liuganggang/number_to_capital_zh"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
