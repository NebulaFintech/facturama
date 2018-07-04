# frozen_string_literal: true

RSpec.describe Facturama::Cfdi do
  let(:configuration) { YAML.load_file(file_fixture('configuration.yml')) rescue {} }
  let(:cfi_request) { JSON.parse(File.read(file_fixture('cfdi_request.json'))) }
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

  let(:csd) { Facturama::Csd.new(sample_csd).save }

  before { csd }

  context 'when performing valid requests' do

    let(:cfdi) { Facturama::Cfdi.new(cfi_request) }

    xit 'creates a Cfdi and deletes it' do
      cfdi.save
      expect(Cfdi).to be_a(Facturama::Cfdi)
      cfdi2 = Facturama::Cfdi.find(Cfdi.id)
      expect(cfdi2.id).to eq(cfdi.id)
      expect(Facturama::Cfdi.all.count).to eq 1
      cfdi.delete
      expect(cfdi).to be_a(Facturama::Cfdi)
    end
  end

  context 'when handling errors' do
    it 'throws a runtime error' do
      expect do
        Facturama::Cfdi.create(id: 'id')
      end.to raise_error('The request is invalid.')
    end
  end
end
