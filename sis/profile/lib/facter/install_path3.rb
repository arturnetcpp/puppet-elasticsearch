# install_path3.rb

Facter.add('install_path3') do
  setcode do
    Facter::Core::Execution.execute('/usr/bin/test -d /opt/tomcat801')
  end
end

