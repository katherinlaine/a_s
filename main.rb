require "./data"

class Main
  def initialize
    @data = DataParser.new
  end

  def enter_query
    get_user_input
    if domain_is_known?
      set_up_formats
      assemble
    else
      puts "I'm sorry, we don't have any records with that domain."
    end
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

  def domain_is_known?
    @data.known_domains.has_key? @domain
  end

  def set_up_formats
    @possible_formats = {
      first_name_dot_last_name: [@first_name, @last_name],
      first_initial_dot_last_initial: [@first_name[0], @last_name[0]],
      first_initial_dot_last_name: [@first_name, @last_name[0]],
      first_name_dot_last_initial: [@first_name[0], @last_name]
    }
  end

  def assemble
    if @data.known_domains[@domain] == "Conflicting Data"
      puts "Unable to determine format"
    else
      format = @data.known_domains[@domain]
      formatting = @possible_formats[format]
      first = formatting[0]
      last = formatting[1]
      full_address = first + "." + last + '@' + @domain
      puts full_address
    end
  end
end

round = Main.new
round.enter_query
