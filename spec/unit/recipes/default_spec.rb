require 'spec_helper'

describe 'cookbook_logstash_server3::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'example logstash_server3_rm test' do
    expect(chef_run).to include_recipe('cookbook_logstash_server3::default')
  end
end
