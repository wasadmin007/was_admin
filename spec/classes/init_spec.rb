require 'spec_helper'
describe 'was_admin' do
  context 'with default values for all parameters' do
    it { should contain_class('was_admin') }
  end
end
