require "pstore" # https://github.com/ruby/pstore

class DataStore
  STORE_NAME = "tendable.pstore"
  $store = PStore.new(STORE_NAME)
  $store.transaction do
    $store[:total_ratings] = $store[:total_ratings] || 0
    $store[:total_runs] = $store[:total_runs] || 0
  end

  QUESTIONS = {
    "q1" => "Can you code in Ruby?",
    "q2" => "Can you code in JavaScript?",
    "q3" => "Can you code in Swift?",
    "q4" => "Can you code in Java?",
    "q5" => "Can you code in C#?"
  }.freeze

  # TODO: FULLY IMPLEMENT
  def do_prompt
    # Ask each question and get an answer from the user's input.
    yes_count = 0
    yes_variants = ["yes", "y"]
    answers = []
    QUESTIONS.each_key do |question_key|
      print QUESTIONS[question_key]
      ans = gets.chomp.downcase
      answers << ans
    end
    answers.each do |ans|
      yes_count += 1 if yes_variants.include?(ans)
    end
    do_report(yes_count)
  end

  def do_report(yes_count)
    # TODO: IMPLEMENT
    rating = (100 * (yes_count.to_f/5)).to_i
    begin
      $store.transaction do
        $store[:total_ratings] = $store[:total_ratings] + rating
        $store[:total_runs] = $store[:total_runs] + 1 
      end
    rescue => e
      puts "Error: #{e.message}"
    end
    puts "Score: #{rating}"
    average_rating = nil
    $store.transaction(true) do # Read-only transaction
      average_rating = $store[:total_ratings] / $store[:total_runs]
    end
    puts "Average Rating #{average_rating}"
  end
end

DataStore.new.do_prompt