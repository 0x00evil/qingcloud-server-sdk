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
    end
  end
end
