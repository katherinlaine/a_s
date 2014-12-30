class Main
  def initialize
    @known_domains = Array.new
    @data = {
      "John Ferguson" => "john.ferguson@alphasights.com",
      "Damon Aw" => "damon.aw@alphasights.com",
      "Linda Li" => "linda.li@alphasights.com",
      "Larry Page" => "larry.p@google.com",
      "Sergey Brin" => "s.brin@google.com",
      "Steve Jobs" => "s.j@apple.com"
    }
  end

  def collect_domains
    @data.each do |name, email|
      domain = email.split('@').last
      unless @known_domains.include? domain
        @known_domains << domain
      end
    end
    binding.pry
  end

  def get_user_input
    print "First Name: "
    @first_name = gets.chomp
    print "Last Name: "
    @last_name = gets.chomp
    print "Domain: "
    @domain = gets.chomp
  end

end

round = Main.new
round.collect_domains
round.get_user_input
