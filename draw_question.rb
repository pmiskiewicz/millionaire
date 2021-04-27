require 'json'

file_location = "questions.json"
content = File.read(file_location)

def draw_question(content)
  data = JSON.parse(content)

  draw = data["questions"].sample
  question = draw["question"]
  answers = draw["answers"]
  good_answer = draw["correct"]
  level = draw["level"]
  options = ['A','B','C','D']
  
  return {question: question, answers: answers, good_answer: good_answer, level: level, options: options}
end

result = draw_question(content)

def check_answer(good_answer)
  your_answer = gets
  puts your_answer.downcase.ord - 97 == good_answer ? "Dobrze!!!" : "Niestety, prawidłowa odpowiedź to #{(good_answer + 97).chr.upcase}"
end

puts "\nPoziom #{result[:level]}: #{result[:question]}" 
puts "#{result[:options].zip(result[:answers]){|x,y| puts "#{x}) #{y}"}}"
puts "Podaj odpowiedź (A, B, C lub D)"
check_answer(result[:good_answer])