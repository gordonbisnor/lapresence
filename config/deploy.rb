require "bundler/capistrano"
require 'airbrake/capistrano'

user = 'lapresence'
password = "a37df06c"
application = "lap2"
domain = 'lapresence.webfactional.com'
path = "/home/#{user}/webapps/lap2/"

set :deploy_to, path

set :default_environment, {
  'GEM_PATH' => "#{path}/gems/bin",
  'GEM_HOME' => "#{path}/gems",
  'PATH' => "#{path}/bin:$PATH"
}

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :keep_releases, 4 
set :rake, "GEM_PATH=#{path}/gems:#{path}/gems/bin  #{path}/bin/rake"
set :webfaction_username, "#{user}"
set :user, user
set :domain, domain
set :application, "#{application}"
set :repository,  "#{user}@#{domain}:/home/#{user}/git/lapresence"
set :scm, :git
set :deploy_via, :remote_cache 
set :scm_command, "/home/#{user}/bin/git"
set :local_scm_command, "git"
set :scm_username, user
set :scm_password, "#{password}"
set :scm_passphrase, "#{password}"
set :use_sudo, false                                 
set :branch, "master"
set :scm_verbose, true
set :git_shallow_clone, 1
set :group_writable, false     
 
role :app, domain
role :web, domain
role :db,  domain, :primary => true

namespace :deploy do
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end
end

after "deploy:update", "deploy:cleanup"

desc "deploy the precompiled assets"
 task :deploy_assets, :except => { :no_release => true } do
    run_locally("rake RAILS_ENV=development assets:clean && rake RAILS_ENV=development assets:precompile")
    upload("public/assets", "#{release_path}/public/assets", :via =>
:scp, :recursive => true)
    run_locally "rm -rf public/assets"
 end

after 'deploy:update_code', 'deploy_assets'

