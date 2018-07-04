# frozen_string_literal: true

RSpec.describe Facturama::Requestor do
  before do
    # This is needed because other tests may cause a configuration to be set.
    Facturama.class_exec { self.configuration = nil }
  end

  describe '#initialize' do
    it 'fails if no configuration block has been called' do
      expect do
        Facturama::Requestor.new
      end.to raise_error('Facturama.configure has not been called!')
    end

    context 'With configuration' do
      it 'fails if an user is not configured' do
        Facturama.configure do |config|
        end

        expect do
          Facturama::Requestor.new
        end.to raise_error('User has not been set!')
      end

      it 'fails if a password is not configured' do
        Facturama.configure do |config|
          config.user = 'my_user'
        end

        expect do
          Facturama::Requestor.new
        end.to raise_error('Password has not been set!')
      end

      it 'does not fail if everything is configured' do
        Facturama.configure do |config|
          config.user = 'my_user'
          config.password = 'my_password'
        end

        expect do
          Facturama::Requestor.new
        end.to_not raise_error
      end
    end
  end
end
