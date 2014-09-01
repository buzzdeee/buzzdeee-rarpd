require 'spec_helper'
describe 'rarpd' do

  context 'with defaults for all parameters' do
    it { should contain_class('rarpd') }
  end
end
