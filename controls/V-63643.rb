# -*- encoding : utf-8 -*-

control 'V-63643' do
  title 'Outgoing secure channel traffic must be encrypted when possible.'
  desc  "Requests sent on the secure channel are authenticated, and sensitive
        information (such as passwords) is encrypted, but not all information is
        encrypted.  If this policy is enabled, outgoing secure channel traffic will be
        encrypted."

  impact 0.5

  tag severity: 'medium'
  tag gtitle: 'WN10-SO-000040'
  tag gid: 'V-63643'
  tag rid: 'SV-78133r1_rule'
  tag stig_id: 'WN10-SO-000040'
  tag fix_id: 'F-69573r1_fix'
  tag cci: %w[CCI-002418 CCI-002421]
  tag nist: ['SC-8', 'SC-8 (1)', 'Rev_4']
  tag false_negatives: nil
  tag false_positives: nil
  tag documentable: false
  tag mitigations: nil
  tag severity_override_guidance: false
  tag potential_impacts: nil
  tag third_party_tools: nil
  tag mitigation_controls: nil
  tag responsibility: nil
  tag ia_controls: nil

  desc "check", "If the following registry value does not exist or is not
      configured as specified, this is a finding:

      Registry Hive: HKEY_LOCAL_MACHINE
      Registry Path: \\SYSTEM\\CurrentControlSet\\Services\\Netlogon\\Parameters\\

      Value Name: SealSecureChannel

      Value Type: REG_DWORD
      Value: 1"

  desc "fix", "Configure the policy value for Computer Configuration >> Windows
      Settings >> Security Settings >> Local Policies >> Security Options >> \"Domain
      member: Digitally encrypt secure channel data (when possible)\" to \"Enabled\"."

  describe registry_key('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters') do
    it { should have_property 'SealSecureChannel' }
    its('SealSecureChannel') { should cmp 1 }
  end
end

