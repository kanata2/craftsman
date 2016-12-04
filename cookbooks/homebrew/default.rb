execute 'Install Homebrew' do
  not_if 'test $(which brew)'
  command '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
end

node[:homebrew][:brew].each do |pkg|
  package pkg do
    action :install
    only_if "brew info #{pkg} | grep -qi 'Not Installed'"
  end
end
