lib = File.expand_path("../lib", __FILE__)
puts lib

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

puts __FILE__
require 'version'
Gem::Specification.new do |spec|
  spec.name = "qingcloudserver"
  spec.version = QingCloudServer::VERSION
  spec.authors = ["gao yuehua"]
  spec.email = ["0x00evil@gmail.com"]

  spec.summary = "sdk for QingCloud"
  spec.description = "another sdk for QingCloud servers"
  spec.homepage = "git@github.com:0x00evil/qingcloud-server-sdk.git"
  spec.license = "MIT"

  spec.require_paths = ["lib"]

  spec.required_ruby_version = "> 2.15"
end
