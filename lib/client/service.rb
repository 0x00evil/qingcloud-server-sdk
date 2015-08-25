module QingCloudServer
  module Client
    class Service < ServiceFoudation

      def describe_instances(
            instances_N: [],
            image_id_N: [],
            instance_type: [],
            status_N: [],
            search_word: nil,
            verbose: nil,
            offset: nil,
            limit: nil,
            zone:
          )eval(make_action_and_params)
      end

      def run_instances(
            image_id:,
            instance_type: nil,
            cpu: nil,
            memory: nil,
            count: 1,
            instance_name: nil,
            login_mode:,
            login_pair: nil,
            login_passwd: nil,
            vxnets_N: [],
            security_group: nil,
            volumes_N: [],
            need_newsid: nil,
            need_userdata: nil,
            user_data_type: nil,
            user_data_value: nil,
            user_data_path: nil,
            user_data_file: nil,
            zone:)eval(make_action_and_params)
      end

      def terminate_instances(
            instances_N:,
            zone:
          )eval(make_action_and_params)
      end

      def start_instances(
            instances_N:,
            zone:
          )eval(make_action_and_params)
      end

      def stop_instances(
            instances_N:,
            force: nil,
            zone:
          )eval(make_action_and_params)
      end

      def restart_instances(
            instances_N:,
            zone:
          )eval(make_action_and_params)
      end

      def resize_instances(
            instances_N:,
            instance_type: nil,
            cpu: nil,
            memory: nil,
            zone:
          )eval(make_action_and_params)
      end

      def modify_instance_attributes(
            instance:,
            instance_name: nil,
            description: nil,
            zone:
          )eval(make_action_and_params)
      end
    end
  end
end
