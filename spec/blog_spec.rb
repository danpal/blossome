require './spec/spec_helper'

describe 'Galleta Blog' do

  def app 
    Galleta::Blog
  end
  
  it "Welcomes the on the root" do
    get '/'
    last_response.should be_ok
  end
end
  
