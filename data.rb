class DataCollector
  attr_reader :data, :known_domains

  def initialize
    @known_domains = {}
    @data = {
      "John Ferguson" => "john.ferguson@alphasights.com",
      "Damon Aw" => "damon.aw@alphasights.com",
      "Linda Li" => "linda.li@alphasights.com",
      "Larry Page" => "larry.p@google.com",
      "Sergey Brin" => "s.brin@google.com",
      "Steve Jobs" => "s.j@apple.com",
    }
    collect_known_domains
  end

  def collect_known_domains
    data.each do |_, email|
      parse_email_address(email)
      assess_format
      if known_domains.has_key? @domain
        check_for_conflicting_data
      else
        known_domains[@domain] = @format
      end
    end
  end

  private

  def parse_email_address(email)
    address = email.split('@').first
    @names = address.split('.')
    @domain = email.split('@').last
  end

  def first_is_initial?
    @names[0].length == 1
  end

  def last_is_initial?
    @names[1].length == 1
  end

  def assess_format
    if first_is_initial? && last_is_initial?
      @format = :first_initial_dot_last_initial
    elsif first_is_initial?
      @format = :first_initial_dot_last_name
    elsif last_is_initial?
      @format = :first_name_dot_last_initial
    else
      @format = :first_name_dot_last_name
    end
  end

  def check_for_conflicting_data
    if @known_domains[@domain] != @format
      @known_domains[@domain] = "Conflicting Data"
    end
  end
end
