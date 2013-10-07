package "vim-common"
package "sysstat"
package "strace"
package "lsof"
package "screen"

execute "update apt cache" do
  command "apt-get update && touch /tmp/.updated_apt"
  action :run
#  creates "/tmp/.updated_apt"
end
