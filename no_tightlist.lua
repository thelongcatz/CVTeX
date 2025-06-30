--[[
Converts tight list in a Markdown document to a normal list in LaTeX.
We simply modify the pandoc AST to swap the Plain object with a Para object.
Reference: https://github.com/jgm/pandoc/issues/2383
--]]
function Plain(p)
  return pandoc.Para(p.content)
end
