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

def moveright(grid, dir)
	done = false
	diry = 0
	dirx = 0

	if dir == "up"
		diry = -1
	elsif dir == "down"
		diry = 1
	elsif dir == "left"
		dirx = -1
	elsif dir == "right"
		dirx = 1
	end

for y in 0..3 do
	for x in 0..3 do
		#this doesn't work, research how to do this in ruby
		if ( 0 <= y <= 3 && 0 <= x <= 3) && grid[y+diry][x+dirx] = 0
			puts "ok"

		end
	end
end
end


dir = "right"
display(grid)
spawn(grid)
puts ""
display(grid)
#moveright(grid, dir)
puts ""
display(grid)





