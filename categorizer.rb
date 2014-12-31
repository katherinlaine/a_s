class Categorizer
  attr_reader :known_domains

  def initialize(emails)
    @emails = emails
    @known_domains = {}
  end

  def refine_data
    @emails.each do |domain, address_parts|
      @address_parts = address_parts
      @format = assess_format
      add_to_known_domains(domain)
    end
    @known_domains
  end

  private

  def add_to_known_domains(domain)
    if known_domains.has_key? domain
      check_for_conflicting_data(domain)
    else
      known_domains[domain] = @format
    end
  end

  def assess_format
    if first_is_initial? && last_is_initial?
      :first_initial_dot_last_initial
    elsif first_is_initial?
      :first_initial_dot_last_name
    elsif last_is_initial?
      :first_name_dot_last_initial
    else
      :first_name_dot_last_name
    end
  end

  def first_is_initial?
    @address_parts[0].length == 1
  end

  def last_is_initial?
    @address_parts[1].length == 1
  end

  def check_for_conflicting_data(domain)
    if known_domains[domain] != @format
      known_domains[domain] = "Conflicting Data"
    end
  end
end
