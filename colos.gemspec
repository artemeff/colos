# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "colos/version"

Gem::Specification.new do |s|
  s.name = "colos"
  s.version = Colos::VERSION
  s.date = "2013-01-15"
  s.authors = ["Yuri Artemev"]
  s.email = ["i@artemeff.com"]
  s.homepage = "http://github.com/artemeff/colos"
  s.summary = %q{string to color}
  s.description = %q{convert ruby string to color}
  s.files = ["lib/colos.rb", "lib/colos/version.rb"]
end