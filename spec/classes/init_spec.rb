require 'spec_helper'
describe 'nagioscontroller' do

  context 'with defaults for all parameters' do
    it { should contain_class('nagioscontroller') }
  end
end
