pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

maze = {}
maze.w = 60
maze.h = 60
maze.cells = {}
maze.color = 14

-- called by program to initialize variables
function _init()
    -- populate maze with cells
    for i=0, maze.w do
        maze.cells[i] = {}
        for j=0, maze.h do
            c = {}
            c.x = i
            c.y = j
            c.seen = 0
            c.neighbors = {}
            maze.cells[i][j] = c
        end
    end
    
    cls()

    genstep(maze.cells[0][0])

    cs = maze.cellsize
    for x = 0, maze.w do
        for y = 0, maze.h do
            for n in all(maze.cells[x][y].neighbors) do

                line(x * 2, y * 2,
                    n.x * 2, n.y * 2,
                    maze.color)
            end
        end
    end

end

-- called by program to update variables
function _update()

end

-- called by program to draw sprites
function _draw()

end

function getneighbors(cell)
    local neighbors = {}
    
    if cell.x != 0 then
        if maze.cells[cell.x - 1][cell.y].seen == 0 then
            add(neighbors, maze.cells[cell.x - 1][cell.y])
        end
    end
    if cell.y != 0 then
        if maze.cells[cell.x][cell.y - 1].seen == 0 then
            add(neighbors, maze.cells[cell.x][cell.y - 1])
        end
    end
    if cell.x < maze.w then
        if maze.cells[cell.x + 1][cell.y].seen == 0 then
            add(neighbors, maze.cells[cell.x + 1][cell.y])
        end
    end
    if cell.y < maze.h then
        if maze.cells[cell.x][cell.y + 1].seen == 0 then
            add(neighbors, maze.cells[cell.x][cell.y + 1])
        end
    end

    return neighbors
end

function genstep(cell)
    -- given current cell...
    -- mark cell as visited
    maze.cells[cell.x][cell.y].seen = 1
    -- while cell has unvisited neighbors:
    local n = getneighbors(cell)

    cs = maze.cellsize
    while #n > 0 do
        -- choose one
        local nextn = rnd(n)
        -- it may be that this neighbor has since been seen - check again
        if nextn.seen == 0 or flr(rnd(20)) == 1 then
            -- remove wall between cell and neighbor
            add(maze.cells[cell.x][cell.y].neighbors, nextn)
            -- invoke this function for neighbor
            genstep(nextn)
        end

        del(n, nextn)
    end

end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
