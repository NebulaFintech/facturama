# frozen_string_literal: true

RSpec.describe Facturama::Csd do
  let(:configuration) { YAML.load_file(file_fixture('configuration.yml')) rescue {} }
  let(:sample_csd) { YAML.load_file(file_fixture('AAA010101AAA.yml')) }

  before do
    Facturama.configure do |config|
      config.api_base = configuration['api_base']
      config.user = configuration['user']
      config.password = configuration['password']
    end
    begin
      Facturama::Csd.new(sample_csd).delete
    rescue StandardError
      nil
    end
  end

  context 'when handling CSDs' do
    it 'creates a CSD and deletes it' do
      csd = Facturama::Csd.new(sample_csd)
      expect(csd).to be_a(Facturama::Csd)
      csd.save
      expect(csd).to be_a(Facturama::Csd)
      csd.delete
      expect(csd).to be_a(Facturama::Csd)
    end
  end
end
