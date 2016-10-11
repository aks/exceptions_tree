# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'exceptions_tree/version'

Gem::Specification.new do |spec|
  spec.name          = "exceptions_tree"
  spec.version       = ExceptionsTree::VERSION
  spec.authors       = ["Alan Stebbens"]
  spec.email         = ["aks@stebbens.org", "alan.stebbens@procore.com"]

  spec.summary       = %q{Adds a rake task to show the currently configured Exception hierarchy.}
  spec.description   = %q{\
  Provides `rake task exceptions` or `display_exceptions` script which display the 
  currently configured Exceptions hierarchy.
  }
  spec.homepage      = "https://github.com/aks/exceptions_tree.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against " \
  #    "public gem pushes."
  #end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  #spec.add_development_dependency "pry-byebug" # only when debugging
end
