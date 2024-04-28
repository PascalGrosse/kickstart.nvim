--@diagnostic disable: undefined-global
return {
  s({ trig = ";a", regTrig = false, snippetType = "autosnippet" }, {
    t "\\alpha",
  }),
  s({ trig = ";b", snippetType = "autosnippet" }, {
    t "\\beta",
  }),
  s({ trig = ";g", snippetType = "autosnippet" }, {
    t "\\gamma",
  }),
  s({ trig = ";D", snippetType = "autosnippet" }, {
    t "\\Delta",
  }),
  s({ trig = ";p", snippetType = "autosnippet" }, {
    t "\\pi",
  }),
}
