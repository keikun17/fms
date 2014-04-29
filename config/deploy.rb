set :application, "fms"


set :scm, :git
set :repository,  "git@git.batnag.org:fms.git"
set :branch, "master"

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

server "fms.batnag.org", :app, :web, :db, :primary => true
set :user, "deploy"
set :ssh_options, { :forward_agent => true }
set :use_sudo, false
set :deploy_to, "/home/#{user}/#{application}"
set :rails_env, "production"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# bundler
namespace :bundler do
  task :install do
    run("gem install bundler --source=http://gemcutter.org")
  end
  
  task :symlink_vendor do
  shared_gems = File.join(shared_path, 'vendor/bundler_gems')
  release_gems = "#{release_path}/vendor/bundler_gems/"
    %w(cache gems specifications).each do |sub_dir|
      shared_sub_dir = File.join(shared_gems, sub_dir)
      run("mkdir -p #{shared_sub_dir} && mkdir -p #{release_gems} && ln -s #{shared_sub_dir} #{release_gems}/#{sub_dir}")
    end
  end

  task :bundle_new_release do
    bundler.symlink_vendor
    rails_env = variables[:rails_env] || 'production'
    run("cd #{release_path} && gem bundle --only #{rails_env}")
  end
end

after 'deploy:update_code', 'bundler:bundle_new_release'
