# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "colos/version"

Gem::Specification.new do |s|
  s.name = "colos"
  s.version = Colos::VERSION
  s.authors = ["Yuri Artemev"]
  s.email = ["i@artemeff.com"]
  s.homepage = "http://github.com/artemeff/colos"
  s.summary = %q{String to color}
  s.description = %q{Convert Ruby string to color}
  s.files = ["lib/colos.rb", "lib/colos/version.rb"]

  s.add_dependency 'cityhash', '~> 0.7.0'
end
