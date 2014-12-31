class Query
  attr_accessor :first_name, :last_name, :domain

  def initialize
    get_user_input
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
