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

  context 'when performing valid requests' do

    let(:csd) { Facturama::Csd.new(sample_csd) }

    it 'creates a CSD and deletes it' do
      csd.save
      expect(csd).to be_a(Facturama::Csd)
      puts csd.inspect
      csd.delete
      expect(csd).to be_a(Facturama::Csd)
    end
  end

  context 'when handling errors' do
    it 'throws a runtime error' do
      expect do
        Facturama::Csd.create(id: 'id')
      end.to raise_error('The request is invalid.')
    end
  end
end
