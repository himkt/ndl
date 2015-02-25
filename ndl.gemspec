# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ndl/version'

Gem::Specification.new do |spec|
  spec.name          = "ndl"
  spec.version       = Ndl::VERSION
  spec.authors       = ["himkt"]
  spec.email         = ["s1311536@u.tsukuba.ac.jp"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  end

  spec.summary       = %q{ndl tool}
  spec.description   = %q{easy tool to access ndl API}
  spec.homepage      = "https://github.com/himkt/ndl"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
