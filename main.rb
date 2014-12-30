class Main
  def initialize
    @known_domains = {}
    @data = {
      "John Ferguson" => "john.ferguson@alphasights.com",
      "Damon Aw" => "damon.aw@alphasights.com",
      "Linda Li" => "linda.li@alphasights.com",
      "Larry Page" => "larry.p@google.com",
      "Sergey Brin" => "s.brin@google.com",
      "Steve Jobs" => "s.j@apple.com"
    }
  end

  def collect_known_domains
    @data.each do |name, email|
      address = email.split('@').first
      @names = address.split('.')
      domain = email.split('@').last
      assess_format
      if @known_domains.has_key? domain
        if @known_domains[domain] != @format
          @known_domains[domain] = "Conflicting Data"
        end
      else
        @known_domains[domain] = @format
      end
    end
    binding.pry
  end

  def enter_query
    get_user_input
  end

  private

  def get_user_input
    print "First Name: "
    @first_name = gets.chomp
    print "Last Name: "
    @last_name = gets.chomp
    print "Domain: "
    @domain = gets.chomp
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

  def first_initial_dot_last_initial
    @first = @first_name[0]
    @last = @last_name[0]
  end

  def first_initial_dot_last_name
    @first = @first_name[0]
    @last = @last_name
  end

  def first_name_dot_last_initial
    @first = @first_name
    @last = @last_name[0]
  end

  def first_name_dot_last_name
    @first = @first_name
    @last = @last_name
  end

  def assemble
    full_address = @first + "." + last + '@' + @domain
    puts full_address
  end

end

round = Main.new
round.collect_known_domains
round.enter_query
