#
# Cookbook Name:: racquettrack_app
# Recipe:: default
#
# Copyright 2013, RacquetTrack Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

application "racquettrack_app" do
  path "/usr/local/racquettrack"
  owner "tomcat"
  group "tomcat"

  repository "/vagrant/racquettrack-web/target/racquettrack.war"
  revision "..."
  scm_provider Chef::Provider::File::Deploy

  java_webapp do
    #database_master_role "database_master"
    database do
      driver 'com.mysql.jdbc.Driver'
      database 'racquettrack_dev'
      host "192.168.32.1"
      port 3306
      username 'racquettrack_dev'
      password 'password1'
      max_active 1
      max_idle 2
      max_wait 3
    end
  end

  tomcat
end