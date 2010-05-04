user = 'lapresence'
password = "a37df06c"
application = "lapresence"
domain = 'lapresence.webfactional.com'


default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :keep_releases, 4 
set :rake, "/home/#{user}/webapps/#{application}/bin/rake"
set :webfaction_username, "#{user}"
set :user, user
set :domain, domain
set :application, "#{application}"
set :repository,  "#{user}@#{domain}:/home/#{user}/git/#{application}"
set :scm, :git
set :deploy_via, :checkout 
set :scm_command, "/home/#{user}/bin/git"
set :local_scm_command, "git"
set :scm_username, user
set :scm_password, "#{password}"
set :scm_passphrase, "#{password}"
set :use_sudo, false                                 
set :branch, "master"
set :scm_verbose, true
set :git_shallow_clone, 1
set :deploy_to, "/home/#{user}/webapps/#{application}/#{application}"
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

after "deploy:update", "deploy:cleanup" # OTHER WISE OLD RELEASES WILL NOT BE DELETED EVEN THOUGH KEEP IS SET

Dir[File.join(File.dirname(__FILE__), '..', 'vendor', 'gems', 'hoptoad_notifier-*')].each do |vendored_notifier|
  $: << File.join(vendored_notifier, 'lib')
end

require 'hoptoad_notifier/capistrano'
