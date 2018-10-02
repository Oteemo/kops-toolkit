require 'dockerspec/serverspec'

describe 'My Dockerfile' do
  describe docker_build('.') do
    it { should have_label "maintainer" => 'gmead@oteemo.com' }

    describe docker_run(described_image) do

      describe file('/usr/local/bin/kops') do
        it {should exist}
      end
      describe command('/usr/local/bin/kops version') do
        its(:exit_status) { should eq 0}
      end

      describe file('/usr/local/bin/kubectl') do
        it {should exist}
      end
      describe command('/usr/local/bin/kubectl version --client=true') do
        its(:exit_status) { should eq 0 }
      end

      describe file('/usr/local/bin/helm') do
        it {should exist}
      end
      describe command('/usr/local/bin/helm version -c') do
        its(:exit_status) {should eq 0}
      end

      describe file('/usr/local/bin/helmfile') do
        it {should exist}
      end
      describe command('/usr/local/bin/helmfile --version') do
        its(:exit_status) {should eq 0}
      end

      describe file('/usr/local/bin/terraform') do
        it {should exist}
      end
      describe command('/usr/local/bin/terraform --version') do
        its(:exit_status) {should eq 0}
      end

      describe file('/usr/local/bin/cfssl') do
        it {should exist}
      end
      describe command('/usr/local/bin/cfssl info --help') do
        # this will fail, but that is okay.  expected exit code is 2
        its(:exit_status) {should eq 2}
      end

      describe command('jq --version') do
        its(:exit_status) {should be 0}
      end
    end
  end
end
