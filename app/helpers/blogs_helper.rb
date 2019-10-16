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
end
