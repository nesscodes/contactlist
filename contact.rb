
require 'csv'
require 'byebug'
require 'pry'

contact_file = CSV.read('contacts.csv')


# Represents a person in an address book.
# The ContactList class will work with Contact objects instead of interacting with the CSV file directly
class Contact


  attr_accessor :name, :email
  attr_reader :id
  
  # Creates a new contact object
  # @param name [String] The contact's name
  # @param email [String] The contact's email address


  def initialize(name, email, id=nil)
    # TODO: Assign parameter values to instance variables.
    @name = name
    @email = email
    @id = id
  end

  def to_s
    "#{@id}: #{@name} (#{@email})"
  end
  

  # Provides functionality for managing contacts in the csv file.
  class << self


    # Opens 'contacts.csv' and creates a Contact object for each line in the file (aka each contact).
    # @return [Array<Contact>] Array of Contact objects
    def all
      results = []
      id = 1
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
      CSV.foreach('contacts.csv') do |row|
        # puts row.inspect
        results << Contact.new(row[0], row[1], id)
        id = id + 1
      end
      results
    end

    # Creates a new contact, adding it to the csv file, returning the new contact.
    # @param name [String] the new contact's name
    # @param email [String] the contact's email
    def create(name, email)
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
      # pry-byebug

      # new_contacts = Array.new
      # CSV.foreach( 'contacts.csv') do |row|
      # new_contacts << ARGV[0]
      # end 

      # updated_contacts = CSV.read('contacts.csv')
      # updated_contacts.each do |contacts|
      #   updated_contacts << new_contacts.shift
      # end


      CSV.open('contacts.csv', 'a') do |csv|
        csv << [name, email]
      end

      Contact.new(name, email)
    end
    
    # Find the Contact in the 'contacts.csv' file with the matching id.
    # @param id [Integer] the contact id
    # @return [Contact, nil] the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
      Contact.all[id - 1]

    end
    
    # Search for contacts by either name or email.
    # @param term [String] the name fragment or email fragment to search for
    # @return [Array<Contact>] Array of Contact objects.
    def search(term)
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
    end

  end
end
