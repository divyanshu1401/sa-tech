require_relative 'questionnaire'
require 'stringio'
require 'rspec'
# ... your code with the `do_prompt` and `do_report` methods ...

RSpec.describe DataStore do
  # Freeze the QUESTIONS constant within the test context
  before(:each) do
    
    allow($stdout).to receive(:write)
  end

  it 'asks all questions' do
    $stdout = StringIO.new
      DataStore.new.do_prompt
      $stdout.rewind
      result_string = 'Can you code in Ruby?Can you code in JavaScript?Can you code in Swift?Can you code in Java?Can you code in C#?'
      expect($stdout.string).to include(result_string)
  end  
end
