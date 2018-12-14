pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

flakes = {}
count = 0
t = 0
nflake = flr(rnd(100)) + 50

function cflake()

    f = {}
    f.nx = rnd(128)
    f.sx = rnd(30) + 35
    f.x = 0
    f.y = -16
    f.dx = 0
    f.dy = 1/(rnd(4) + 2)
    f.spr = 1
    f.smod = rnd(360)
    f.sign = 0
    if cos(((t + f.smod))/f.sx)/2 == abs(cos(((t + f.smod))/f.sx)/2) then f.sign = 1 else f.sign = -1 end
    f.flip = 0
    return f
    
end

function dflake(f)
    spr(f.spr, f.x + f.nx, f.y)
end

function mflake(f)

    if f.flip > 0 then
        if f.flip > flr((f.sx / 5)) then
            f.flip = 0
            f.spr = 1
        elseif f.flip < flr((f.sx / 5) / 2) then
            f.flip += 1
            f.spr = 2
        else
            f.flip += 1
            f.spr = 3
        end
    end

    nval = cos(((t + f.smod))/f.sx)/2
    if nval == abs(nval) then nsign = 1 else nsign = -1 end
    f.x += nval
    
    if nsign != f.sign then f.flip = 1 end
    
    
    if nval == abs(nval) then f.sign = 1 else f.sign = -1 end
    f.y += f.dy
    
    if f.y > 136 then f = cflake() end
    
end

function _draw()
    cls()
    foreach(flakes, dflake)
    map(0,0,0,0,16,16)
end

function _update()

    if count % nflake == 0 then
        flakes[#flakes + 1] = cflake()
        count = 0
        nflake = flr(rnd(100)) + 50
    end
    count += 1
    t += 1
    
    foreach(flakes, mflake)

end

function _init()
    -- music(0)
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000600000006000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700060606000606060000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000006660000066600000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000666066600006000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700006660000066600000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000060606000606060000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000600000006000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666666666666666666667007000670000000000000000007076000700760000000000000000000000000000000000000000000000000000000000000000
66676677667767767677666667070000670707000000000000000766000000760000000000000000000000000000000000000000000000000000000000000000
66770700770070070700766666700000670070000070700000000766000000760000000000000000000000000000000000000000000000000000000000000000
67700070070007000070077666700000676600000007000007076666000707660000000000000000000000000000000000000000000000000000000000000000
66700000007000000707007667007000666670700070707000707666000077660000000000000000000000000000000000000000000000000000000000000000
67070000000000000000076666770000666707000707670007007666000007660000000000000000000000000000000000000000000000000000000000000000
66000000000000000000776666707000666666777676667776776666000007660000000000000000000000000000000000000000000000000000000000000000
67700000000000000007007667000000666666666666666666666666000070760000000000000000000000000000000000000000000000000000000000000000
__label__
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66676677667767766677677666776776667767766677677666776776667767766677677666776776667767766677677666776776667767766677677676776666
66770700770070077700700777007007770070077700700777007007770070077700700777007007770070077700700777007007770070077700700707007666
67700070070007000700070007000700070007000700070007000700070007000700070007000700070007000700070007000700070007000700070000700776
66700000007000000070000000700000007000000070000000700000007000000070000000700000007000000070000000700000007000000070000007070076
67070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
66000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007766
67700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070076
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070076
6707000000000000000000000000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000076
66700000000000000000000000000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000076
667000000000000000000000000000c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070766
67007000000000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007766
66770000000000060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
66707000000000006660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
67000000000000666066600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007076
67007000000000006660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070076
670700000000c00606060000000000000000000000000000000000000000000000000000000000000000c0000000000000000000000000000000000000000076
6670000000000c00060000000000000000000000000000000000000000000000000000000000000000000c000000000000000000000000000000000000000076
66700000000000c00000000000000000000000000000000000000000000000000000000000000000000000c00000000000000000000000000000000000070766
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007766
66770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
66707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
67000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007076
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070076
6707000000000000000000000000c000000000000000c00000000000000000000000c00000000000000000000000000000000000000000000000000000000076
66700000000000000000000000000c000000000000000c00000000000000000000000c0000000000000000000000000000000000000000000000000000000076
667000000000000000000000000000c000000000000000c00000000000000000000000c000000000000000000000000000000000000000000000000000070766
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007766
66770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
66707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
67000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007076
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070076
670700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c0000000000000000076
6670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c000000000000000076
66700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c00000000000070766
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007766
66770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
66707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
67000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007076
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070076
67070000000000000000000000000000000000000000c0000000000000000000000000000000c000000000000000000000000000000000000000000000000076
667000000000000000000000000000000000000000000c0000000000000000000000000000000c00000000000000000000000000000000000000000000000076
6670000000000000000000000000000000000000000000c0000000000000000000000000000000c0000000000000000000000000000000000000000000070766
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007766
66770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
66707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
67000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007076
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070076
67070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600000000000000000000000000076
66700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060606000000000000000000000000076
66700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006660000000000000000000000070766
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000666066600000000000000000000007766
66770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006660000000000000000000000000766
66707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060606000000000000000000000000766
67000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600000000000000000000000007076
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070076
67070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000076
66700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000076
66700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070766
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007766
66770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
66707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
67000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007076
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070076
6707000000000000000000000000000000000000600000000000c0000000000000000000000000000000000000000000000000000000c0000000000000000076
66700000000000000000000000000000000000606060000000000c0000000000000000000000000000000000000000000000000000000c000000000000000076
667000000000000000000000000000000000000666000000000000c0000000000000000000000000000000000000000000000000000000c00000000000070766
67007000000000000000000000000000000006660666000000000000000000000000000000000000000000000000000000000000000000000000000000007766
66770000000000000000000000000000000000066600000000000000000000000000000000000000000000000000000000000000000000000000000000000766
66707000000000000000000000000000000000606060000000000000000000000000000000000000000000000000000000000000000000000000000000000766
67000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000000000000000000000007076
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070076
67070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000076
66700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000076
66700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070766
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007766
66770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
66707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
67000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007076
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070076
670700000000000000000000000000000000c0000000000000000000000000000000c00000000000000000000000000000000000000000000000c00000000076
6670000000000000000000000000000000000c0000000000000000000000000000000c00000000000000000000000000000000000000000000000c0000000076
66700000000000000000000000000000000000c0000000000000000000000000000000c00000000000000000000000000000000000000000000000c000070766
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007766
66770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
66707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
67000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007076
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070076
67070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000076
66700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000076
66700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070766
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007766
66770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
66707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
67000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007076
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070076
670700000000c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000076
6670000000000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000076
66700000000000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070766
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007766
66770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
66707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
67000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007076
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070076
67070000000000000000000000000000000000000000c00000000000000000000000000000000000000000000000c00000000000000000000000000000000076
667000000000000000000000000000000000000000000c00000000000000000000000000000000000000000000000c0000000000000000000000000000000076
6670000000000000000000000000000000000000000000c00000000000000000000000000000000000000000000000c000000000000000000000000000070766
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007766
66770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
66707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766
67000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007076
67007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070076
670700000000c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000076
6670000000000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000076
66700000000000c00000000000000000000000000000000000000600000000000000000000000000000000000000000000000000000000000000000000070766
67007000000000000000000000000000000000000000000000060606000000000000000000000000000000000000000000000000000000000000000000007766
66770000000000000000000000000000000000000000000000006660000000000000000000000000000000000000000000000000000000000000000000000766
66707000000000000000000000000000000000000000000000666066600000000000000000000000000000000000000000000000000000000000000000000766
67000000000000000000000000000000000000000000000000006660000000000000000000000000000000000000000000000000000000000000000000007076
67000000000000000000000000000000000000000000000000060606000000000000000000000000000000000000000000000000000000000000000000007076
67070700000000000000000000000000000000000000000000000600000000000000000000000000000000000000000000000000000000000000000000000766
67007000007070000070700000707000007070000070700000707000007070000070700000707000007070000070700000707000007070000070700000000766
67660000000700000007000000070000000700000007000000070000000700000007000000070000000700000007000000070000000700000007000007076666
66667070007070700070707000707070007070700070707000707070007070700070707000707070007070700070707000707070007070700070707000707666
66670700070767000707670007076700070767000707670007076700070767000707670007076700070767000707670007076700070767000707670007007666
66666677767666777676667776766677767666777676667776766677767666777676667776766677767666777676667776766677767666777676667776776666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666

__map__
3031313131313131313131313131313200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3300001020200000002121210000003700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3310002020202000000010000000003700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3300201020102000100000000000003700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3300202020202000000000000010003700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3300002020102020001000000000003700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3300001111111111000000000000003700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3311111111111111111111111111113700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3300000000001000000000000010003700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3300000000000000000000000000003700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3300000010000000100000000000103700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3300000000000000000000000000003700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3310000000000000000000000000003700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3300000000100000000000100000003700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3310000000000000000000000000003700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3435353535353535353535353535353600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0020000c0e5500e55002550015500a55007550055500355003550035500355003550035501c5001c5001c5001a5001a5001a5001a5001a5001a5001a5001a5001a5001a5001a5001a5001a5001a5001a5001a500
0010000018550185501a5501a5501a550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 00424344

