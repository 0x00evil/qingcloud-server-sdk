require_relative '../lib/qingcloud_server'

connector = QingCloudServer::Client::Connector.init("NULYIYWTTUXRAGENKRQM", "SKw7I862utQqhH98jTsKaxyWMybe2jrY0cF8EgE0")
service = QingCloudServer::Client::Service.new(connector)

# tj = status_N: ["running"]
# tj = instances_N: ["i-j7rdjua9"]
# service.describe_instances(status_N: ["running"], zone:'pek2', offset: 10, limit: 100, verbose: 1)

# puts "response.class is {service.response.class}"
# puts service.response

# service.run_instances(image_id: "img-e9stua0m", login_mode: "passwd", login_passwd: "Sillyboy12$", zone: "pek2", cpu:1, memory: 1024)
# puts "run_instances #{service.response}"

# service.terminate_instances(instances_N:["i-29stv83u"], zone: "pek2")
# puts "terminate_instances #{service.response}"


# service.stop_instances(instances_N: ["i-j7rdjua9"], zone: "pek2")

# service.restart_instances(instances_N: ["i-j7rdjua9"], zone: "pek2")
# puts service.response

# service.resize_instances(instances_N: ["i-j7rdjua9"], cpu: 1, memory: 1024, zone: "pek2")
# puts service.response

# service.start_instances(instances_N: ["i-j7rdjua9"], zone: "pek2")
# puts service.response

service.modify_instance_attributes(instance: "i-j7rdjua9", instance_name: "centos_test_yuehua", zone: "pek2")
