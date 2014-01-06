Rails.application.routes.draw do

  mount BarclampLoadbalancer::Engine => "/barclamp_loadbalancer"
end
