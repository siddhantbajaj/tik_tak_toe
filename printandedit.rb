class Board
	attr_accessor :rowsize,:array,:visited
	def initialize rowsize
		@array = Array.new(rowsize+2){Array.new(rowsize+2)}
		@visited = Array.new((rowsize+2)*(rowsize+2))
		@rowsize = rowsize
	end
	def get_new_board
		k = 1
		for i in 1..@rowsize
			for j in 1..@rowsize
				@array[i][j]=k.to_s
				k+=1
			end
		end
		for i in 1..@rowsize*@rowsize
			visited[i] = false
		end
	end
	def print_board
		k = 1
		for i in 1..@rowsize
			for j in 1..@rowsize
				print "#{@array[i][j]}\t"
				k+=1
			end
			puts "",""
		end
	end
	def edit_location ind,marker1
		i = ((ind-1) / @rowsize)+1
		j = ((ind-1) % @rowsize)+1
		@array[i][j]=marker1
	end 
	def check_visited ind
		return @visited[ind]
	end
	def mark_visited ind
		@visited[ind]=true
	end
end



class SetGame < Board 
	def check_if_win 
		for i in 1..@rowsize
			k = 0
			for j in 1..@rowsize
				if(@array[i][1]!=@array[i][j])
					break
				end
				k+=1
				if( k==@rowsize )
					return 'y'
				end
			end
		end
		for j in 1..@rowsize
			k = 0
			for i in 1..@rowsize
				if(@array[1][j]!=@array[i][j])
					break
				end
				k+=1
				if( k==@rowsize )
					return 'y'
				end
			end
		end
		k = 0
		for i in 1..@rowsize
			if(@array[1][1]!=@array[i][i])
				break
			end
			k+=1
		end
		if(k==@rowsize)
			return 'y'
		end
		k = 0
		for i in 1..@rowsize
			if(@array[1][@rowsize]!=@array[i][@rowsize-i+1])
				break
			end
			k+=1
		end
		if(k==@rowsize)
			return 'y'
		end
		return 'n'
	end
end

