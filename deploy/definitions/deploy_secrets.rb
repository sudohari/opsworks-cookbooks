define :deploy_secrets do
  Chef::Log.info "Params & Node"
  Chef::Log.info params.inspect
  Chef::Log.info node.inspect

  template "#{params[:path]}/current/config/credentials/#{params[:environment]}.key" do
    cookbook "deploy"
    source "environment.key.erb"
    mode "0660"
    owner params[:user]
    group params[:group]
  end
end