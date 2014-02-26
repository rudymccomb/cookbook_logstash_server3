require 'spec_helper'

describe 'verifi_skeleton::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'example skeleton test' do
    expect(chef_run).to include_recipe('verifi_skeleton::default')
  end
end
