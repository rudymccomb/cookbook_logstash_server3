require 'spec_helper'

describe '_logstash_server3_rm::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'example logstash_server3_rm test' do
    expect(chef_run).to include_recipe('_logstash_server3_rm::default')
  end
end
