# install_path2.rb

Facter.add('install_path2') do
  setcode do
    Facter::Core::Execution.execute('/usr/bin/test -d /opt/tomcat802')
  end
end

