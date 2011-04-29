
  set :application, "photoshaft"
  set :domain, "67.202.53.148"
  role :app, domain
  role :web, domain
  role :db, domain, :primary => true
  set :deploy_to, "/home/ego/#{application}"
  set :user, "ego"
  # set :password, ""
  set :group, "root"
 
  set :scm, "git"
  set :repository, "git://github.com/egogo/ps.git"
  set :branch, "master"  
  set :deploy_via, :checkout
  set :git_shallow_clone, 1
  default_run_options[:pty] = true
  # ssh_options[:keys] = %w(/root/.ssh/id_dsa)
  
  namespace :deploy do
    desc "Restarting mod_rails with restart.txt"
    task :restart, :roles => :app, :except => { :no_release => true } do
      run "touch #{current_path}/tmp/restart.txt"
    end

    desc "Stop task is a deploy.web.disable with mod_rails"
    task :stop, :roles => :app do
      deploy.web.disable
    end

    desc "Start task is a deploy.web.enable with mod_rails"
    task :start, :roles => :app do
      deploy.web.enable
    end
  end  
  
  after "deploy:update_code",
                              :symlink_config_files,
                              :link_database,
                              :fix_public_dir_permission,
                              :fix_tmp_dir_permission,
                              "deploy:migrate"

  task :symlink_config_files do
    run "ln -nfs #{deploy_to}/#{shared_dir}/config/database.yml #{release_path}/config/database.yml"
    run "rm -rf #{release_path}/public/images/gallery"
    run "ln -s #{deploy_to}/#{shared_dir}/assets/gallery #{release_path}/public/images"
    sudo "chmod -R a+rw #{release_path}/public/images/gallery"
  end
 
  task :link_database do
    run "ln -nfs #{deploy_to}/#{shared_dir}/db/production.sqlite3 #{release_path}/db/production.sqlite3"
    run "chmod g+w #{release_path}/db/production.sqlite3"
  end
 
  task :fix_public_dir_permission do
    run "chgrp -R root #{release_path}/public"
    run "chmod -R g+w #{release_path}/public"
  end
 
  task :fix_tmp_dir_permission do
    run "chgrp -R root #{release_path}/tmp"
    sudo "chown -R root #{release_path}/tmp"
    sudo "chmod -R a+rw #{release_path}/tmp"
  end
  