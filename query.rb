class Query
  attr_accessor :first_name, :last_name, :domain

  def initialize
    get_user_input
  end

  private

  def get_user_input
    print "First Name: "
    @first_name = clean(gets.chomp)
    print "Last Name: "
    @last_name = clean(gets.chomp)
    print "Domain: "
    @domain = clean(gets.chomp)
  end

  def clean(input)
    input.strip.downcase
  end
end
