#ruby 2048, for fun and to learn ruby better

#maybe create grid as a global array

require 'io/console'


#initialize the grid
#I store the numbers in a multidemensional array. I did this so that I can print out the arrays, with a puts after each
#this also allows me to refer to a "cell" by it's x and y coordinates 0-3
#because of how the arrays work, the x and y values are swapped, (y, x)
#
grid = [ [1, 0, 0, 1], [0, 2, 0, 0], [0, 0, 0, 3], [1, 0, 0, 0] ]

def display(grid)

	#cycle through the array and print all values in order
	for y in 0..3 do

		for x in 0..3 do
			print "#{grid[y][x]} "
		end

		puts 
	end
end

#todo: make random number spawning do more than just 2 and 4, 
#make it take into account the total value of the array

#spawns a random number in an empty space
def spawn(grid)

	done = false

	until done do
		x = rand(4)
		y = rand(4)
		n = rand(1..2) * 2

			#make sure it is empty
			if grid[y][x] == 0
				grid[y][x] = n
				done = true
			end
	end
end

#this moves the numbers right, but i plan to make one function for movement
def moveright(grid, dir)
	#done = false
	diry = 0
	dirx = 0

	#direction logic, should make a case statement
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
			
			#if y and x are in bounds (probably not needed), and the next space is empty and the current space is not empty
			if ( y.between?(0, 3) && x.between?(0, 3) ) && grid[y+diry][x+dirx] == 0 && grid[y][x] != 0
				#puts "ok"
				grid[y+diry][x+dirx] = grid[y][x]
				grid[y][x] = 0
			end
		end
	end
end

#reads the input, returns input
def read_char
	#dont echo and take raw input (arrows etc)
	STDIN.echo = false
	STDIN.raw!

	input = STDIN.getc.chr

	if input == "\e" then
		input << STDIN.read_nonblock(3) rescue nil
		input << STDIN.read_nonblock(2) rescue nil
	end
	#honestly i dont know what this is
	ensure
		STDIN.echo = true
		STDIN.cooked!

		return input
end

def wait_input
	 c = read_char
 
  case c
  when "\e"
    puts "ESCAPE"
    exit 0
  when "\e[A"
    puts "UP ARROW"
  when "\e[B"
    puts "DOWN ARROW"
  when "\e[C"
    puts "RIGHT ARROW"
    return true
  when "\e[D"
    puts "LEFT ARROW"
  when /^.$/
    puts "SINGLE CHAR HIT: #{c.inspect}"
  else
    puts "SOMETHING ELSE: #{c.inspect}"
  end
end

dir = "right"
display(grid)
spawn(grid)
puts ""
display(grid)
puts ""

if wait_input
	moveright(grid, dir)
	display(grid)
end


