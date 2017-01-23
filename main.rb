
#jkfsdkandknjhhd
require_relative 'printandedit.rb'
system("reset")



print "Enter Player 1 marker :-\t"
f_marker = gets.chomp
print "Enter Player 2 marker :-\t"
s_marker = gets.chomp
print "Enter row size :-\t"
row = gets.to_i
game = SetGame.new row
game.get_new_board
system("reset")

game.print_board
player = 1
checkdraw = true 
for i in 1..row*row
	if (player==1)
		print "Enter Number (First Player) :-\t"
		ind = gets.to_i
		until ind>=1&&ind<=row*row
			print "Enter Value in range :-\t"
			ind = gets.to_i
		end
		until !game.check_visited(ind)
			print "Index Already Filled Enter New Value :-\t"
			ind = gets.to_i
			until ind>=1&&ind<=row*row
				print "Enter Value in range :-\t"
				ind = gets.to_i
			end
		end
		game.mark_visited(ind)
		game.edit_location(ind,f_marker)
		if( game.check_if_win == 'y')
			system("reset")
			game.print_board
			puts "First Player Won"
			checkdraw = false
			break
		end
		player=2
	else
		print "Enter Number (Second Player) :-\t"
		ind = gets.to_i
		until ind>=1&&ind<=row*row
			print "Enter Value in range :-\t"
			ind = gets.to_i
		end
		until !game.check_visited(ind)
			print "Index Already Filled Enter New Value :-\t"
			ind = gets.to_i
			until ind>=1&&ind<=row*row
				print "Enter Value in range :-\t"
				ind = gets.to_i
			end
		end
		game.mark_visited(ind)
		game.edit_location(ind,s_marker)
		if( game.check_if_win == 'y')
			system("reset")
			game.print_board
			puts "Second Player Won"
			checkdraw = false
			break
		end
		player=1
	end
	system("reset")
	game.print_board
end
if checkdraw
	puts "Match Draw"
end



