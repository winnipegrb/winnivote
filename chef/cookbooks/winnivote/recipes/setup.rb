execute "install bundle" do
  cwd "/vagrant"
  command "/usr/local/rbenv/shims/bundle install --path vendor"
end
