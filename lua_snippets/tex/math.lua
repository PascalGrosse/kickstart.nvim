local get_visual = function(_, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

local in_mathzone = function()
  -- The 'in_mathzone' function requires the VimTeX plugin
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
  -- \texttt
  s({ trig = "ttt", dscr = "Expands 'ttt' into '\texttt{}'" }, fmta("\\texttt{<>}", { d(1, get_visual) })),

  -- \textit
  s({ trig = "tit", dscr = "Expands 'tit' into '\textit{}'" }, fmta("\\textit{<>}", { d(1, get_visual) })),

  -- \textrm
  s({ trig = "trm", dscr = "Expands 'trm' into '\textrm{}'" }, fmta("\\textrm{<>}", { d(1, get_visual) })),

  -- \emph
  s({ trig = "tem", dscr = "Expands 'tem' into 'emph{}'" }, fmta("\\emph{<>}", { d(1, get_visual) })),

  -- \frac
  s(
    { trig = "ff", dscr = "Expands 'ff' into '\frac{}{}'" },
    fmta("\\frac{<>}{<>}", {
      i(1),
      i(2),
    }),
    { condition = in_mathzone }
  ),

  -- Equation
  s(
    { trig = "eq", dscr = "Expands 'eq' into an equation environment" },
    fmta(
      [[
      \begin{equation*}
        <>
      \end{equation*}
      <>
      ]],
      { i(1), i(0) }
    )
  ),

  s(
    { trig = "(^|[^a-zA_Z])mm", trigEngine = "ecma" },
    fmta("<>$<>$", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),

  s(
    { trig = "([^a-zA_Z])ee", trigEngine = "ecma" },
    fmta("<>e^{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = in_mathzone() }
  ),
}
