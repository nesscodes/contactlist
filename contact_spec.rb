require_relative 'contact'
require_relative 'spec_helper'

describe Contact  do
  @new_array = Contact.new()
  it "should open contacts csv " do
    expect " array of contacts".to be true
  end

end