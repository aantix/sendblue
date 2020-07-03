
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sendblue/version"

Gem::Specification.new do |spec|
  spec.name          = "SendBlue"
  spec.version       = Sendblue::VERSION
  spec.authors       = ["Jim Jones"]
  spec.email         = ["jim.jones1@gmail.com"]

  spec.summary       = %q{Simple client wrapper for the SendBlue.co service.}
  spec.description   = %q{Allows for the sending of messages through the SendBlue service.}
  spec.homepage      = "https://www.github.com/aantix/sendblue"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", "~> 6.0"
  spec.add_development_dependency "webmock", "~> 3.8"
end
