default[:pound][:ssl_port] = 443
default[:pound][:ssl_proxy_port] = 81

default["loadbalancer"]["services"] = [
            { :service_type => "keystone",
              :service_instance => "default",
              :ssl => false,
              :external_port => 5000
            },
            { :service_type => "nova-ec2",
              :service_instance => "default",
              :ssl => false,
              :external_port => 8773
            },
            { :service_type => "nova-api",
              :service_instance => "default",
              :ssl => false,
              :external_port => 8774
            },
            { :service_type => "cinder",
              :service_instance => "default",
              :ssl => false,
              :external_port => 8776
            },
            { :service_type => "ceilometer",
              :service_instance => "default",
              :ssl => false,
              :external_port => 8777
            },
            { :service_type => "glance-api",
              :service_instance => "default",
              :ssl => false,
              :external_port => 9292
            },
            { :service_type => "quantum-api",
              :service_instance => "default",
              :ssl => false,
              :external_port => 9696
            }
            { :service_type => "swift",
              :service_instance => "default",
              :ssl => false,
              :external_port => 8080
            }
]

default["loadbalancer"]["params"] = {
    :user => "www-data",
    :group => "www-data",
    :loglevel => 1,
    :alive_timeout =>30
}

### 
# Crowbar would set these based on the services used.
default["loadbalancer"]["backend"] = [
    { :address =>"192.168.124.158", :port => 8080 },
    { :address =>"192.168.124.159", :port => 8080 } 
]

default["loadbalancer"]["listen"] = {
    :address => "192.168.124.157",
    :port => 80
}

default["node"]["keepalived"]["vrrp_instances"]= [
  { 
    :nopreempt          => false,     # omitted if false, included if true
    :advert_int         => nil, # Advertisement Interval (in seconds)
    :virtual_router_id  => 51,
    :master_priority    => 101,     # Priority to use on the Master
    :backup_priority    => 100,     # Priority to use on the Backup
    :backup_nodes       => [], # node names for backup hosts. These will
    :virtual_ipaddress  => ["192.168.124.157"],
  }
]
