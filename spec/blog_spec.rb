require './spec/spec_helper'

describe 'Blossome Blog' do

  def app 
    Blossome::Blog
  end
  
  it "Welcomes the on the root" do
    get '/'
    last_response.should be_ok
  end
end
  
