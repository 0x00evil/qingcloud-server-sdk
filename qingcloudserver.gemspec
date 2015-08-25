lib = File.expand_path("../lib", __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'version'
Gem::Specification.new do |spec|
  spec.name = "qingcloudserver"
  spec.version = QingCloudServer::VERSION
  spec.authors = ["gao yuehua"]
  spec.email = ["0x00evil@gmail.com"]

  spec.summary = "sdk for QingCloud"
  spec.description = "another sdk for QingCloud servers"
  spec.homepage = "https://github.com/0x00evil/qingcloud-server-sdk"
  spec.license = "MIT"

  spec.files = Dir["**/**"]

  spec.require_paths = ["lib"]

  spec.required_ruby_version = "> 2.1.5"
end
