-- vim: filetype=lua
--

-- Quit
swayimg.viewer.on_key("q", function ()
  swayimg.exit()
end)

-- Navigation
swayimg.viewer.on_key("Shift+l", function()
  swayimg.viewer.switch_image("next")
end)
swayimg.viewer.on_key("Shift+h", function()
  swayimg.viewer.switch_image("prev")
end)
swayimg.viewer.on_key("g", function()
  swayimg.viewer.switch_image("first")
end)
swayimg.viewer.on_key("Shift+g", function()
  swayimg.viewer.switch_image("last")
end)

-- Panning
swayimg.viewer.on_key("h", function()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(math.floor(pos.x + wnd.width / 10), pos.y)
end)
swayimg.viewer.on_key("l", function()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(math.floor(pos.x - wnd.width / 10), pos.y)
end)
swayimg.viewer.on_key("j", function()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y - wnd.height / 10))
end)
swayimg.viewer.on_key("k", function()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y + wnd.height / 10))
end)

-- Zoom
swayimg.viewer.on_key("Shift+j", function()
  swayimg.viewer.set_abs_scale(swayimg.viewer.get_scale() * 1.1)
end)
swayimg.viewer.on_key("Shift+k", function()
  swayimg.viewer.set_abs_scale(swayimg.viewer.get_scale() * 0.9)
end)
swayimg.viewer.on_key("z", function()
  swayimg.viewer.set_fix_scale("real")
end)
swayimg.viewer.on_key("Alt+z", function()
  swayimg.viewer.set_fix_scale("fit")
end)
swayimg.viewer.on_key("Alt+k", function()
  swayimg.viewer.set_fix_scale("keep")
end)

-- Rotate
swayimg.viewer.on_key("r", function()
  swayimg.viewer.rotate(90)
end)
swayimg.viewer.on_key("Shift+r", function()
  swayimg.viewer.rotate(270)
end)

-- Reload
swayimg.viewer.on_key("Alt+r", function()
  local image = swayimg.viewer.get_image()
  swayimg.viewer.reset()
  -- reload by re-opening current image
  local path = image.path
  swayimg.imagelist.remove(path)
  swayimg.imagelist.add(path)
  swayimg.viewer.switch_image("next")
end)
