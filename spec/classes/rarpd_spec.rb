require 'spec_helper'

describe 'rarpd' do
  let :facts do
    {
      osfamily: 'OpenBSD',
      os: { family: 'OpenBSD' },
    }
  end

  context 'with default parameters' do
    ethers_content = File.read('spec/fixtures/rarpd_ethers.empty')

    it { is_expected.to compile.with_all_deps }  # same as above except it will test all the dependencies
    it { is_expected.to contain_class('rarpd::config') }
    it { is_expected.to contain_class('rarpd::service') }
    it {
      is_expected.to contain_file('/etc/ethers').with(
        owner: 'root',
        group: '0',
        mode: '0644',
      ).with_content(ethers_content)
    }
    it {
      is_expected.to contain_service('rarpd').with(
        ensure: 'running',
        enable: 'true',
        flags: '-al',
      )
    }
  end

  context 'with custom parameters' do
    ethers_content = File.read('spec/fixtures/rarpd_ethers.multiline')
    let(:params) do
      {
        ethers: {
          node1: '00:11:22:33:44:55',
          node2: '66:77:88:99:aa:bb',
        },
        enable_yplookup: true,
        service_name: 'bula',
        service_ensure: 'stopped',
        service_flags: '-X',
        service_enable: false,
      }
    end

    it { is_expected.to compile.with_all_deps }  # same as above except it will test all the dependencies
    it { is_expected.to contain_class('rarpd::config') }
    it { is_expected.to contain_class('rarpd::service') }
    it {
      is_expected.to contain_file('/etc/ethers').with(
        owner: 'root',
        group: '0',
        mode: '0644',
      ).with_content(ethers_content)
    }
    it {
      is_expected.to contain_service('bula').with(
        'ensure' => 'stopped',
        'enable' => 'false',
        'flags'  => '-X',
      )
    }
  end
end
