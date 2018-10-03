
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "masking_field/version"

Gem::Specification.new do |spec|
  spec.name          = "masking_field"
  spec.version       = MaskingField::VERSION
  spec.authors       = ["ShigekiDoumae"]
  spec.email         = ["shigeki.doumae@gmail.com"]

  spec.summary       = %q{Mask to columns}
  spec.description   = %q{DB data is column mask}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
