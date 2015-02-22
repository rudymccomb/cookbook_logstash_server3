require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

# this is provided as a sample test, this should be removed from the non-logstash_server3_rm cookbook you are creating

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe 'SSH Daemon' do

  it 'is listening on port 22' do
    expect(port(22)).to be_listening
  end

  it 'has a running service of sshd' do
    expect(service('sshd')).to be_running
  end

end
