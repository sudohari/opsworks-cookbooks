define :deploy_secrets do
  Chef::Log.info "wow here"
  Chef::Log.info params.inspect

  directory "#{params[:path]}/shared/config/credentials" do
    group params[:group]
    owner params[:user]
    mode 0770
    action :create
    recursive true
  end

  template "#{params[:deploy_to]}/shared/config/credentials/#{params[:environment]}.key" do
    cookbook "deploy"
    source "environment.key.erb"
    mode "0660"
    owner params[:user]
    group params[:group]
  end
end