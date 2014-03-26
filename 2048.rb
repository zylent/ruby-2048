#ruby 2048, for fun and to learn ruby better
require 'io/console'

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
		
		if ( y.between?(0, 3) && x.between?(0, 3) ) && grid[y+diry][x+dirx] == 0 && grid[y][x] != 0
			#puts "ok"
			grid[y+diry][x+dirx] = grid[y][x]
			grid[y][x] = 0
		end
	end
end
end

def read_char
	STDIN.echo = false
	STDIN.raw!

	input = STDIN.getc.chr
	if input == "\e" then
		input << STDIN.read_nonblock(3) rescue nil
		input << STDIN.read_nonblock(2) rescue nil
	end
ensure
	STDIN.echo = true
	STDIN.cooked!

	return input
end


dir = "right"
display(grid)
spawn(grid)
puts ""
display(grid)
moveright(grid, dir)
puts ""
display(grid)
print read_char



