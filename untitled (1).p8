pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- ユか★∧ melisa'ya kalp kurtarma oyunu ユか★∧

-- karakter pozisyonu
x = 64
y = 64

-- skor ve hedef
score = 0
target = 31

-- kalp (tek bir tane)
heart = {}

-- oyun bitti mi?
game_over = false

function _init()
    spawn_heart()
end

function _update()
    if game_over then return end

    -- karakter hareketi
    if btn(0) then x -= 1 end -- sol
    if btn(1) then x += 1 end -- saろか
    if btn(2) then y -= 1 end -- yukarろね
    if btn(3) then y += 1 end -- aわかaろかろね

    -- sろねnろねrlarda kal
    x = mid(0, x, 120)
    y = mid(0, y, 120)

    -- kalple れせarpろねわかma kontrolれも
    if heart != nil and collide(x, y, heart.x, heart.y) then
        score += 1
        spawn_heart()
    end

    if score >= target then
        game_over = true
    end
end

function _draw()
    cls()

    if game_over then
        print("sana cok as1g1m melisa<3!", 10, 60, 8)
        return
    end

    -- karakter (sprite 1)
    spr(1, x, y)

    -- kalp (sprite 2)
    if heart != nil then
        spr(2, heart.x, heart.y)
    end

    -- skor
    print("kurtar1lan kalpler: "..score, 2, 2, 7)
end

-- れせarpろねわかma kontrolれも
function collide(ax, ay, bx, by)
    return abs(ax - bx) < 8 and abs(ay - by) < 8
end

-- yeni kalp れもret
function spawn_heart()
    local hx = flr(rnd(120))
    local hy = flr(rnd(120))
    heart = {x=hx, y=hy}
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000880880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700055555008888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000055fff008888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000554f4000888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700055fff000088800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000055fff000008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
