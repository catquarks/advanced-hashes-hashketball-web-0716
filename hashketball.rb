require "pry"

def game_hash
	hash = {
		:home => {
			:team_name => "Brooklyn Nets",
			:colors => ["black", "white"],
			:players => {
				"Alan Anderson" => {
					:number => "0",
					:shoe => "16",
					:points => "22",
					:rebounds => "12",
					:assists => "12",
					:steals => "3",
					:blocks => "1",
					:slam_dunks => "1"
				},
				"Reggie Evans" => {
					:number => "30",
					:shoe => "14",
					:points => "12",
					:rebounds => "12",
					:assists => "12",
					:steals => "12",
					:blocks => "12",
					:slam_dunks => "7"
				},
				"Brook Lopez" => {
					:number => "11",
					:shoe => "17",
					:points => "17",
					:rebounds => "19",
					:assists => "10",
					:steals => "3",
					:blocks => "1",
					:slam_dunks => "15"
				},
				"Mason Plumlee" => {
					:number => "1",
					:shoe => "19",
					:points => "26",
					:rebounds => "12",
					:assists => "6",
					:steals => "3",
					:blocks => "8",
					:slam_dunks => "5"
				},
				"Jason Terry" => {
					:number => "31",
					:shoe => "15",
					:points => "19",
					:rebounds => "2",
					:assists => "2",
					:steals => "4",
					:blocks => "11",
					:slam_dunks => "1"
				}
			}
		},
		:away => {
			:team_name => "Charlotte Hornets",
			:colors => ["turquoise", "purple"],
			:players => {
				"Jeff Adrien" => {
					:number => "4",
					:shoe => "18",
					:points => "10",
					:rebounds => "1",
					:assists => "1",
					:steals => "2",
					:blocks => "7",
					:slam_dunks => "2"
				},
				"Bismak Biyombo" => {
					:number => "0",
					:shoe => "16",
					:points => "12",
					:rebounds => "4",
					:assists => "7",
					:steals => "7",
					:blocks => "15",
					:slam_dunks => "10"
				},
				"DeSagna Diop" => {
					:number => "2",
					:shoe => "14",
					:points => "24",
					:rebounds => "12",
					:assists => "12",
					:steals => "4",
					:blocks => "5",
					:slam_dunks => "5"
				},
				"Ben Gordon" => {
					:number => "8",
					:shoe => "15",
					:points => "33",
					:rebounds => "3",
					:assists => "2",
					:steals => "1",
					:blocks => "1",
					:slam_dunks => "0"
				},
				"Brendan Haywood" => {
					:number => "33",
					:shoe => "15",
					:points => "6",
					:rebounds => "12",
					:assists => "12",
					:steals => "22",
					:blocks => "5",
					:slam_dunks => "12"
				}
			}
		}
	}

end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    #binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        #binding.pry
 
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

def num_points_scored(player)
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if attribute == :players
				data.each do |name, stats|
					if name == player
						stats.each do |k, v|
							if k == :points
								#puts "#{name}: #{v} #{k}"
								return v.to_i
							end
						end
					end
				end
			end
		end
	end

	#binding.pry

end

def shoe_size(player)
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if attribute == :players
				data.each do |name, stats|
					if name == player
						stats.each do |k, v|
							if k == :shoe
								return v.to_i
							end
						end
					end
				end
			end
		end
	end
	binding.pry

end








def all_points_scored
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if attribute == :players
				data.each do |name, stats|
					stats.each do |k, v|
						if k == :points
							puts "#{name}: #{v} #{k}"
						end
					end
				end
			end
		end
	end
end

def team_colors(team)
	game_hash.each do |location, team_data|
		if game_hash[location][:team_name] == team
			team_data.each do |attribute, data|
				if attribute == :colors
					return data.map(&:capitalize) #shortcut!
				end
			end
		end
	end
	

	#binding.pry

end

def team_names
	names = []
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if attribute == :team_name
				#puts "#{attribute}: #{data}"
				names << data
			end
		end
	end
	names

	#binding.pry
end

def player_numbers(team)

	numbers = []

	game_hash.each do |location, team_data|
		if game_hash[location][:team_name] == team
			team_data.each do |attribute, data|
				if attribute == :players
					data.each do |name, stats|
						stats.each do |k, v|
							if k == :number
								numbers.push(v.to_i)
							end
						end
					end
				end
			end
		end
	end


	numbers
	#binding.pry
end

def player_stats(player)
	the_stats = {}
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if attribute == :players
				data.each do |name, stats|
					if name == player
						the_stats = stats
					end
				end
			end
		end
	end

	the_stats.each {|k, v| the_stats[k] = v.to_i}
	#binding.pry
end

def big_shoe_rebounds

	shoes = []

	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if attribute == :players
				data.each do |name, stats|
					stats.each do |k, v|
						if k == :shoe
							shoes << v
						end
					end
				end
			end
		end
	end

	big_shoe = shoes.sort!.pop
	big_shoe_player = ""

	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if attribute == :players
				data.each do |name, stats|
					stats.each do |k, v|
						if k == :shoe && v == big_shoe
							big_shoe_player = name
						end
					end
				end
			end
		end
	end

	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if attribute == :players
				data.each do |name, stats|
					if name == big_shoe_player
						stats.each do |k, v|
							if k == :rebounds
								return v.to_i
							end
						end
					end
				end
			end
		end
	end
	# binding.pry

end



#puts big_shoe_rebounds