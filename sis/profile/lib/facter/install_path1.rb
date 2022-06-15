# install_pathi1.rb

Facter.add('install_path1') do
  setcode do
    Facter::Core::Execution.execute('/usr/bin/test -d /opt/tomcat803')
  end
end
