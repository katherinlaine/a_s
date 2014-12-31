class AddressAssembler
  attr_reader :query, :known_domains

  def initialize(query, known_domains)
    @query = query
    @known_domains = known_domains
    @first = @query.first_name
    @last = @query.last_name
    @domain = @query.domain
    set_up_formats
  end

  def build_address
    unless check_for_conflicting_data
      prepare_parts
      assemble
    end
  end

  private

  def set_up_formats
    @possible_formats = {
      first_name_dot_last_name: [@first, @last],
      first_initial_dot_last_initial: [@first[0], @last[0]],
      first_initial_dot_last_name: [@first[0], @last],
      first_name_dot_last_initial: [@first, @last[0]]
    }
  end

  def check_for_conflicting_data
    if known_domains[@domain] == "Conflicting Data"
      puts "Unable to determine format due to conflicting data."
      true
    end
  end

  def prepare_parts
    format = known_domains[@domain]
    formatting = @possible_formats[format]
    @first_name = formatting[0]
    @last_name = formatting[1]
  end

  def assemble
    full_address = @first_name + "." + @last_name + '@' + @domain
    puts full_address
  end
end
