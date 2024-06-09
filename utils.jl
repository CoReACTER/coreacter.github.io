using Bibliography

function hfun_bar(vname)
  val = Meta.parse(vname[1])
  return round(sqrt(val), digits=2)
end

function hfun_m1fill(vname)
  var = vname[1]
  return pagevar("index", var)
end

function lx_baz(com, _)
  # keep this first line
  brace_content = Franklin.content(com.braces[1]) # input string
  # do whatever you want here
  return uppercase(brace_content)
end

function process_bib(file_name="_files/publications.bib")
  entries = import_bibtex(file_name)

  i = length(entries)

  entry_strings = String[]
  
  for entry in entries.val
    title = entry.title
    access = entry.access
    authors = entry.authors
    pub = entry.in
    date = entry.date

    # TODO: actual string formatting

  end

end