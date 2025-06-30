--[[
Convert specific sections of Markdown CV in accordance to the specs of SimplyLongCV.
Here we convert the heading into a \metasection command.
--]]
function Header(h)
  if(h.level == 1) then
    return { {pandoc.RawInline('latex', '\\metasection{')} ..
             h.content .. {pandoc.RawInline('latex', '}')}
           }
  else
    return h
  end
end
