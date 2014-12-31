class DataParser
  attr_reader :data

  def initialize(file)
    @emails = Array.new
    @data = YAML.load_file(file)
  end

  def collect_emails
    data.each do |_, email|
      address = email.split('@').first
      address_parts = address.split('.')
      domain_name = email.split('@').last
      @emails << [domain_name, address_parts]
    end
    @emails
  end
end
