# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'n_2_w/version'

Gem::Specification.new do |spec|
  spec.name          = "n_2_w"
  spec.version       = N2W::VERSION
  spec.authors       = ["alexandros84"]
  spec.email         = ["alexandros.management@outlook.com"]

  spec.summary       = %q{"--Convert numeric data into friendly, human-like verbal expressions that match 
the occasion!"}
  spec.description   = %q{"--Convert numeric data into friendly, human-like verbal expressions that match 
the occasion!"}
  spec.homepage      = "https://github.com/alexandros84/n_2_w"
  spec.license       = "MIT"

  

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
