#ruby 2048, for fun and to learn ruby better

grid = [ [1, 0, 0, 1], [0, 2, 0, 0], [0, 0, 0, 3], [1, 0, 0, 0] ]

def display(grid)

	for y in 0..3 do

		for x in 0..3 do
			print "#{grid[y][x]} "
		end

		puts 
	end
end

#todo: make random number spawning do more than just 2 and 4, 
#make it take into account the total value of the array
def spawn(grid)

	done = false

	until done do
		x = rand(4)
		y = rand(4)
		n = rand(1..2) * 2

			if grid[y][x] == 0
				grid[y][x] = n
				done = true
			end
	end
end

#broken ignore
def moveleft(grid)
	grid.each do |x|
		x.each do |y|
			print grid[y][x]
		end
	end

end

def moveright(grid)
	done = false
		x = -1
		y = 0
	until done do
		x += 1

		if y == 3 && x == 3
			done = true
		end

		#print "x: #{x} "
		#print "y: #{y} "
		#puts ""

		if grid[y][x] != 0
		#puts ""
		#puts grid[y][x]
		n = grid[y][x]
		end

		if grid[y][x] == 0
			grid[y][x] = n
			puts n
			grid[y-1][x-1] = 0
		end
		

		if x == 3
			y += 1
			x = -1
		end

	end
end


display(grid)
spawn(grid)
puts ""
display(grid)
moveright(grid)
puts ""
display(grid)




#ALSO


#ruby 2048, for fun and to learn ruby better

grid = [ [1, 0, 0, 1], [0, 2, 0, 0], [0, 0, 0, 3], [1, 0, 0, 0] ]

def display(grid)

	for y in 0..3 do

		for x in 0..3 do
			print "#{grid[y][x]} "
		end

		puts 
	end
end

#todo: make random number spawning do more than just 2 and 4, 
#make it take into account the total value of the array
def spawn(grid)

	done = false

	until done do
		x = rand(4)
		y = rand(4)
		n = rand(1..2) * 2

			if grid[y][x] == 0
				grid[y][x] = n
				done = true
			end
	end
end

#broken ignore
def moveleft(grid)
	grid.each do |x|
		x.each do |y|
			print grid[y][x]
		end
	end

end

def moveright(grid)
	
	for y in 0..3 do

		for x in 0..3 do
			n = grid[y][x]
			if ( y < 3 and n == grid[y][x+1] ) || ( x < 3 && n == grid[y+1][x] )
				print "ok"
			end
		end
	end


end



