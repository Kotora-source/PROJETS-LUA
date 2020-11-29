--classe totalement provisoire et pas finie tavu

function collideRect(rect1, rect2)
  if rect1.x < rect2.x + rect2.width and
     rect1.x + rect1.width > rect2.x and
     rect1.y < rect2.y + rect2.height and
     rect1.height + rect1.y > rect2.y then
       return true
  end
  return false
end