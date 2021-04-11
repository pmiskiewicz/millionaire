require 'csv'

file_location = 'questions.csv'
content = File.read(file_location)

data = CSV.parse(content, headers: true)

data.each {|q| puts "Pytanie za #{q['step']}:\n#{q['question']}\nA) #{q['answer_1']}\nB) #{q['answer_2']}\nC) #{q['answer_3']}\nD) #{q['answer_4']}"}