require "yaml"
require "./parser"
require "./categorizer"
require "./query"
require "./address_assembler"

class Main
  def initialize 
    run_data_parser
    categorize_data
  end

  def run
    until @answer == "n"
      enter_query
      assemble_address
      puts "Predict another address? (y/n)"
      @answer = gets.chomp.downcase
    end
  end

  private

  def run_data_parser
    parser = DataParser.new("addresses.yml")
    @emails = parser.collect_emails
  end

  def categorize_data
    categorizer = Categorizer.new(@emails)
    @known_domains = categorizer.refine_data
  end

  def enter_query
    @query = Query.new
  end

  def assemble_address
    if domain_is_known?
      assembler = AddressAssembler.new(@query, @known_domains)
      assembler.build_address
    else
      puts "I'm sorry, we don't have any records in our database with that domain."
    end
  end

  def domain_is_known?
    @known_domains.has_key? @query.domain
  end
end

round = Main.new
round.run
