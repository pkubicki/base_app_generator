# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "base_app_generator/version"

Gem::Specification.new do |s|
  s.name        = "base_app_generator"
  s.version     = BaseAppGenerator::VERSION
  s.authors     = ["Paweł Kubicki"]
  s.email       = ["pawel.kubicki@gmail.com"]
  s.homepage    = "http://github.com/pkubicki/base_app_generator"
  s.summary     = %q{Rails 3 basic application generator}
  s.description = %q{Rails 3 basic applicatin generator with set of my favorite gems, collection of generators and some basic functionality.}

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
