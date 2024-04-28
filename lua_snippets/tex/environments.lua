return {
  -- Code for environment snippet in the above GIF
  s(
    { trig = "env" },
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
      ]],
      {
        i(1),
        i(2),
        rep(1), -- this node repeats insert node i(1)
      }
    )
  ),
}
