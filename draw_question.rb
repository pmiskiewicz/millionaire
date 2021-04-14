require 'json'

file_location = "questions.json"
content = File.read(file_location)

def draw_question(content)
  data = JSON.parse(content)

  draw = data["questions"].sample
  question = draw["question"]
  answers = draw["answers"]
  level = draw["level"]
  options = ['A','B','C','D']
  
  return {question: question, answers: answers, level: level, options: options}
end

result = draw_question(content)

puts "\nPoziom #{result[:level]}: #{result[:question]}" 
puts "#{result[:options].zip(result[:answers]){|x,y| puts "#{x}) #{y}"}}"
