# Simple sudoku solution validator 
# ARGV param: String of numbers representing 9x9 sudoku grid to be validated.
# eg: "835416927296857431417293658569134782123678549748529163652781394981345276374962815"
# OUTPUT: Boolean 
# Author:: Christian Idylle (idylle.christian@gmail.com)
# License:: The MIT License (MIT) Copyright (c) 2015 Christian Idylle

def is_valid_solution(grid)
	return false unless grid.is_a? String
	grid2D = Array.new(9) { Array.new(9) }

	grid.each_char.with_index do |char, index| 
		return false unless char.to_i.between?(1,9)
		grid2D[index/9][index%9] = char.to_i
	end

	grid2D.each do |row|
		return false if row.uniq.length < 9
	end

	grid2D.transpose.each do |column| 
		return false if column.uniq.length < 9 
	end

	(0..8).step(3).each do |ystep|
		(0..8).step(3).each do |xstep|
			subGrid = []
			(0..2).each do |x|
				(0..2).each do |y|
					subGrid.push grid2D[ystep+x][xstep+y]
				end
			end
			return false if subGrid.uniq.length < 9 
		end
	end

	return true
end

puts is_valid_solution(ARGV[0])
