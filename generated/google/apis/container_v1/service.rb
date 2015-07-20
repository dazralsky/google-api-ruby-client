# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module ContainerV1
      # Google Container Engine API
      #
      # The Google Container Engine API is used for building and managing container
      #  based applications, powered by the open source Kubernetes technology.
      #
      # @example
      #    require 'google/apis/container_v1'
      #
      #    Container = Google::Apis::ContainerV1 # Alias the module
      #    service = Container::ContainerService.new
      #
      # @see https://cloud.google.com/container-engine/
      class ContainerService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://container.googleapis.com/', '')
        end
        
        # Lists all clusters owned by a project in either the specified zone or all
        # zones.
        # @param [String] project_id
        #   The Google Developers Console [project ID](https://console.developers.google.
        #   com/project) or [project number](https://developers.google.com/console/help/
        #   project-number)
        # @param [String] zone
        #   The name of the Google Compute Engine [zone](/compute/docs/zones#available) in
        #   which the cluster resides, or "-" for all zones.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContainerV1::ListClustersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContainerV1::ListClustersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_zone_clusters(project_id, zone, fields: nil, quota_user: nil, options: nil, &block)
          path = 'v1/projects/{projectId}/zones/{zone}/clusters'
          command =  make_simple_command(:get, path, options)
          command.response_representation = Google::Apis::ContainerV1::ListClustersResponse::Representation
          command.response_class = Google::Apis::ContainerV1::ListClustersResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['zone'] = zone unless zone.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a specific cluster.
        # @param [String] project_id
        #   The Google Developers Console A [project ID](https://console.developers.google.
        #   com/project) or [project number](https://developers.google.com/console/help/
        #   project-number)
        # @param [String] zone
        #   The name of the Google Compute Engine [zone](/compute/docs/zones#available) in
        #   which the cluster resides.
        # @param [String] cluster_id
        #   The name of the cluster to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContainerV1::Cluster] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContainerV1::Cluster]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_zone_cluster(project_id, zone, cluster_id, fields: nil, quota_user: nil, options: nil, &block)
          path = 'v1/projects/{projectId}/zones/{zone}/clusters/{clusterId}'
          command =  make_simple_command(:get, path, options)
          command.response_representation = Google::Apis::ContainerV1::Cluster::Representation
          command.response_class = Google::Apis::ContainerV1::Cluster
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['zone'] = zone unless zone.nil?
          command.params['clusterId'] = cluster_id unless cluster_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a cluster, consisting of the specified number and type of Google
        # Compute Engine instances, plus a Kubernetes master endpoint. By default, the
        # cluster is created in the project's [default network]('/compute/docs/
        # networking#networks_1'). One firewall is added for the cluster. After cluster
        # creation, the cluster creates routes for each node to allow the containers on
        # that node to communicate with all other instances in the cluster. Finally, an
        # entry is added to the project's global metadata indicating which CIDR range is
        # being used by the cluster.
        # @param [String] project_id
        #   The Google Developers Console [project ID](https://console.developers.google.
        #   com/project) or [project number](https://developers.google.com/console/help/
        #   project-number)
        # @param [String] zone
        #   The name of the Google Compute Engine [zone](/compute/docs/zones#available) in
        #   which the cluster resides.
        # @param [Google::Apis::ContainerV1::CreateClusterRequest] create_cluster_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContainerV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContainerV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_cluster(project_id, zone, create_cluster_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          path = 'v1/projects/{projectId}/zones/{zone}/clusters'
          command =  make_simple_command(:post, path, options)
          command.request_representation = Google::Apis::ContainerV1::CreateClusterRequest::Representation
          command.request_object = create_cluster_request_object
          command.response_representation = Google::Apis::ContainerV1::Operation::Representation
          command.response_class = Google::Apis::ContainerV1::Operation
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['zone'] = zone unless zone.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update settings of a specific cluster.
        # @param [String] project_id
        #   The Google Developers Console [project ID](https://console.developers.google.
        #   com/project) or [project number](https://developers.google.com/console/help/
        #   project-number)
        # @param [String] zone
        #   The name of the Google Compute Engine [zone](/compute/docs/zones#available) in
        #   which the cluster resides.
        # @param [String] cluster_id
        #   The name of the cluster to upgrade.
        # @param [Google::Apis::ContainerV1::UpdateClusterRequest] update_cluster_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContainerV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContainerV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_cluster(project_id, zone, cluster_id, update_cluster_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          path = 'v1/projects/{projectId}/zones/{zone}/clusters/{clusterId}'
          command =  make_simple_command(:put, path, options)
          command.request_representation = Google::Apis::ContainerV1::UpdateClusterRequest::Representation
          command.request_object = update_cluster_request_object
          command.response_representation = Google::Apis::ContainerV1::Operation::Representation
          command.response_class = Google::Apis::ContainerV1::Operation
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['zone'] = zone unless zone.nil?
          command.params['clusterId'] = cluster_id unless cluster_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the cluster, including the Kubernetes endpoint and all worker nodes.
        # Firewalls and routes that were configured during cluster creation are also
        # deleted.
        # @param [String] project_id
        #   The Google Developers Console [project ID](https://console.developers.google.
        #   com/project) or [project number](https://developers.google.com/console/help/
        #   project-number)
        # @param [String] zone
        #   The name of the Google Compute Engine [zone](/compute/docs/zones#available) in
        #   which the cluster resides.
        # @param [String] cluster_id
        #   The name of the cluster to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContainerV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContainerV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_zone_cluster(project_id, zone, cluster_id, fields: nil, quota_user: nil, options: nil, &block)
          path = 'v1/projects/{projectId}/zones/{zone}/clusters/{clusterId}'
          command =  make_simple_command(:delete, path, options)
          command.response_representation = Google::Apis::ContainerV1::Operation::Representation
          command.response_class = Google::Apis::ContainerV1::Operation
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['zone'] = zone unless zone.nil?
          command.params['clusterId'] = cluster_id unless cluster_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all operations in a project in a specific zone or all zones.
        # @param [String] project_id
        #   The Google Developers Console [project ID](https://console.developers.google.
        #   com/project) or [project number](https://developers.google.com/console/help/
        #   project-number)
        # @param [String] zone
        #   The name of the Google Compute Engine [zone](/compute/docs/zones#available) to
        #   return operations for, or "-" for all zones.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContainerV1::ListOperationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContainerV1::ListOperationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_zone_operations(project_id, zone, fields: nil, quota_user: nil, options: nil, &block)
          path = 'v1/projects/{projectId}/zones/{zone}/operations'
          command =  make_simple_command(:get, path, options)
          command.response_representation = Google::Apis::ContainerV1::ListOperationsResponse::Representation
          command.response_class = Google::Apis::ContainerV1::ListOperationsResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['zone'] = zone unless zone.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified operation.
        # @param [String] project_id
        #   The Google Developers Console [project ID](https://console.developers.google.
        #   com/project) or [project number](https://developers.google.com/console/help/
        #   project-number)
        # @param [String] zone
        #   The name of the Google Compute Engine [zone](/compute/docs/zones#available) in
        #   which the cluster resides.
        # @param [String] operation_id
        #   The server-assigned `name` of the operation.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContainerV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContainerV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_zone_operation(project_id, zone, operation_id, fields: nil, quota_user: nil, options: nil, &block)
          path = 'v1/projects/{projectId}/zones/{zone}/operations/{operationId}'
          command =  make_simple_command(:get, path, options)
          command.response_representation = Google::Apis::ContainerV1::Operation::Representation
          command.response_class = Google::Apis::ContainerV1::Operation
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['zone'] = zone unless zone.nil?
          command.params['operationId'] = operation_id unless operation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
        end
      end
    end
  end
end
