rawtxt = []
pie = []

open("exam.txt").readlines.each do |line|	
	rawtxt.push line
end

pie.push "::scoreboard"
pie.push "Your score: <%= story.state.variables.score %>"
pie.push "::Twee2Settings [twee2]"
pie.push "@story_start_name = 'Start Here...'"
pie.push "::Configuration [twee2]"
pie.push "Twee2::build_config.story_format = 'Snowman'"
pie.push "::StoryTitle"
pie.push rawtxt[0]
pie.push "::Start Here... [instructions]"
pie.push "<script>story.state.variables = {};var _stats = story.state.variables;_stats.score = 1000;</script>"

pie.each do |i|
  puts i
end