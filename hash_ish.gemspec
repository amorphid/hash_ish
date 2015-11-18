# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hash_ish/version'

Gem::Specification.new do |spec|
  spec.name          = 'hash_ish'
  spec.version       = HashIsh::VERSION
  spec.authors       = ['Michael Pope']
  spec.email         = ['mpope.cr@gmail.com']

  spec.summary       = %q{A Hashie::Mash knockoff}
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/amorphid/hash_ish'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'json', '~> 1.8'
  spec.add_runtime_dependency 'srm', '~> 0.3'
end

