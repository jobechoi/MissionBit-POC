require 'docx'
require 'rubygems'


exam = []
nextQ = []
instr = []

doc1 = Docx::Document.open('exam.docx')

doc1.paragraphs.each do |p|
	exam.push p
end

File.open('exam_n_ans.tw2', 'w') { |f|
	f.puts "::scoreboard"
	f.puts "Your score: <%= story.state.variables.score %>"
	f.puts "::Twee2Settings [twee2]"
	f.puts "@story_start_name = 'Start Here...'"
	f.puts "::Configuration [twee2]"
	f.puts "Twee2::build_config.story_format = 'Snowman'"
	f.puts "::StoryTitle"
	f.puts exam[0].to_s
	f.puts "::Start Here... [instructions]"
	f.puts "<script>story.state.variables = {};var _stats = story.state.variables;_stats.score = 1000;</script>"

	(0..5).each do |i|
		next if /^(1.)/.match(exam[i].to_s.split(' ')[0]) == nil
		f.puts "[[Let\'s go!|" << exam[i].to_s.rstrip << "]]"
	end

	(4..exam.length).each do |question|
		next if /^(\d?\d.)/.match(exam[question].to_s.split(' ')[0]) == nil
			
		f.puts "::" << exam[question].to_s.rstrip
		f.puts "<div id = \"question\">"
		f.puts "<div id = \"scoreboard\">"
		f.puts "<%= window.story.render(\"scoreboard\") %>"
		f.puts "</div>"
		f.puts "<h3>"<<exam[question].to_s<< "</h3>"

		(question+1...question+5).each do |answer|
			f.puts "[["<<exam[answer].to_s.rstrip<<"]]"<<"<br/>"
		end
		f.puts "</div>"

		nextQ = exam[question+6].to_s.rstrip
		
		(question+1...question+5).each do |answer|
			f.puts "::"<<exam[answer].to_s.rstrip
			
			if answer % [*1..3].sample > 0
				f.puts "<% story.state.variables.score += 100 %>"
			end

			f.puts "<div id = \"answer\"><div id = \"scoreboard\"><%= window.story.render(\"scoreboard\") %></div>"
			if exam[question+11] != nil
				f.puts "[[Next question?|"<<nextQ.to_s.rstrip<<"]]"
			end
			if exam[question+11] == nil
				f.puts "[[Score!]]"
			end
			f.puts "</div>"
		end
	end
}