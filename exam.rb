rawtxt = []
pie = []
questions_all = []
answers = []
choices = []
nextQs = []

open("exam.txt").readlines.each do |line| 
  if line != ""
    #puts line
    rawtxt.push line.rstrip
  end
end


#Add game header
pie.push "::Twee2Settings [twee2]"
pie.push "@story_start_name = 'Start Here...'"
pie.push "::Configuration [twee2]"
pie.push "Twee2::build_config.story_format = 'Snowman'" 
pie.push "::StoryTitle"
pie.push rawtxt[0]

#Iterate over rawtxt
rawtxt.each_with_index do |i, index|
  #Instance variable for next question
  nextQ = ""

  #Formatting rules for tw2 file
  #Your code here...

open('exam.tw2', 'w') { |f|
  pie.each do |p|
    f.puts p
  end

  choices.each do |s| 
    f.puts s
  end

  answers.each do |d|
    f.puts d
  end
}