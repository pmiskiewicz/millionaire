require 'json'

LOWER_CASE_MIN = 97

file_location = "../questions.json"
content = File.read(file_location)
data = JSON.parse(content)

def draw_question(data)
  draw = data["questions"].sample
  question = draw["question"]
  answers = draw["answers"]
  good_answer = draw["correct"]
  level = draw["level"]
  options = ['A','B','C','D']
  
  return {question: question, answers: answers, good_answer: good_answer, level: level, options: options}
end

result = draw_question(data)

def check_answer(good_answer)
  your_answer = gets
  puts your_answer.downcase.ord - LOWER_CASE_MIN == good_answer ? "Dobrze!!!" : "Niestety, prawidłowa odpowiedź to #{(good_answer + LOWER_CASE_MIN).chr.upcase}"
end

puts "\nPoziom #{result[:level]}: #{result[:question]}" 
puts "#{result[:options].zip(result[:answers]){|x,y| puts "#{x}) #{y}"}}"
puts "Podaj odpowiedź (A, B, C lub D)"
check_answer(result[:good_answer])