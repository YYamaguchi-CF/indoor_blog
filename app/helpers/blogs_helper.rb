module BlogsHelper
	
	def janre_color(janre)
		case janre
		when 'manga' then
			return '#ffd45e'
		when 'anime' then
			return '#ff9c5e'
		when 'game' then
			return '#96ebd5'
		when 'movie'	then
			return '#4e495c'
		else
			return '#ef7af5'
		end
	end
	
	def janre_path(janre)
		case janre
		when 'manga' then
			return :janres_manga
		when 'anime' then
			return :janres_anime
		when 'game' then
			return :janres_game
		when 'movie'	then
			return :janres_movie
		else
			return :janres_other
		end
	end
	
end
