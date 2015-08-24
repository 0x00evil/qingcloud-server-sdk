require_relative '../lib/qingcloud_server'

connector = QingCloudServer::Client::Connector.init("NULYIYWTTUXRAGENKRQM", "SKw7I862utQqhH98jTsKaxyWMybe2jrY0cF8EgE0")
service = QingCloudServer::Client::Service.new(connector)

service.describe_instances(status_N: ["running"], zone:'pek2', offset: 10, limit: 100, verbose: 1)

puts service.response
