require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  def initialize(parameters)
    @parameters = parameters
  end

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  def no_commands
      puts "Please select what you want to do:"
      puts "All"
      puts "Create"
      puts "Find"
      puts "Search"
    
  end

 def populate_from_parameters(person)
    person[:name] = @parameters[1]
    person[:email] = @parameters[2]
    person
  end

  def run_user_input
    some_person = user_input
    if some_person
      puts user_input
    end
  end  

  # main method
  def run
    if @parameters.empty?
      no_commands
    else
      # you should have a case statement
      # if they choose all, then you call Contact.all and display result
      case @parameters.first
      when "all"
        puts Contact.all
      when "create"
        person = Hash.new
        person = populate_from_parameters(person)
        if (person[:name].nil?)
          puts "Please provide a name"
          person[:name] = STDIN.gets.chomp
        end
        if (person[:email].nil?)
          puts "Please provide an e-mail"
          person[:email] = STDIN.gets.chomp
        end
        puts Contact.create(person[:name], person[:email])
      when "find"

        puts Contact.find(@parameters[1].to_i)
        


      end 
    end
  end

end


ContactList.new(ARGV).run
# ContactList.new.run_user_input
