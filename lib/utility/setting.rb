require 'json'
module QingCloudServer
  module Utility

      CONFIG_FILE_PATH = "#{Dir.home}/.qingcloudserver/qingcloud.json"

      def self.read_config_file
        config_json_file = ""
        File.open(CONFIG_FILE_PATH) {|file| config_json_file = file.read } if File.exist?(CONFIG_FILE_PATH)
        JSON.parse(config_json_file)
      end

  end
end
