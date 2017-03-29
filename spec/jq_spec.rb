require "spec_helper_#{ENV['SPEC_TARGET_BACKEND']}"

describe package('jq') do
  it { should be_installed }
end

describe command('which jq') do
  its(:exit_status) { should eq 0 }
end

describe command('echo \'{"key": "value"}\' | jq .key') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /"value"/ }
end
