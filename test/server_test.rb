require_relative '../lib/qingcloud_server'

connector = QingCloudServer::Client::Connector.init("NULYIYWTTUXRAGENKRQM", "SKw7I862utQqhH98jTsKaxyWMybe2jrY0cF8EgE0")
service = QingCloudServer::Client::Service.new(connector)

service.describe_instances(instances_N:['i-j7rdjua9'],zone:'pek2')
