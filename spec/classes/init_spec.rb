require 'spec_helper'
#require 'puppetlabs_spec_helper/module_spec_helper'
describe 's3datacopy' do
  context 'with default values for all parameters' do
    it { should contain_class('s3datacopy') }
  end
end
