--[[
Convert specific sections of Markdown CV in accordance to the specs of SimplyLongCV.
Here we combine the heading, subheading and subsubheading into a \cvevent command.
--]]
function Header(h)
  if(h.level == 1) then
    title = h.content
    return {}
  else
    if(h.level == 2) then
      place = h.content
      return {}
    else
      if(h.level == 3) then
        time = h.content
        return { {pandoc.RawInline('latex', '\\cvevent{')} ..
                 title .. {pandoc.RawInline('latex', '}{')} ..
                 place .. {pandoc.RawInline('latex', '}{')} ..
                 time .. {pandoc.RawInline('latex', '}')}
               }
      else
        return h
      end
    end
  end
end
