using BibInternal
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

function publication_title_case(string::String)
  uncapitalized = [
    "a", "and", "as", "at", "but", "by", "down", "for", "from", "if", "in", "into", "like", "near", "nor", "of", "off",
    "on", "once", "onto", "or", "over", "past", "so", "than", "that", "the", "to", "upon", "when", "with", "yet"
  ]

  punctuation = [
    ';', ':', '!', '?', '.', '-',
  ]

  words_formatted = String[]

  for (index, word) in enumerate(split(string))
    # Treat word literally, and do not mess with capitalization
    if '{' in word && '}' in word
      formatted_word = replace(word, "{" => "")
      formatted_word = replace(formatted_word, "}" => "")
    # Hyphenated words - need to capitalize each important word in the phrase
    elseif '-' in word
      if length(word) == 1
        formatted_word = "—"
      else
        subwords = String[]
        for (subindex, subword) in enumerate(split(word, "-"))
          if subindex == 1 || !(subword in uncapitalized)
            push!(subwords, uppercasefirst(lowercase(subword)))
          else
            push!(subwords, lowercase(subword))
          end
        end
        formatted_word = join(subwords, "-")
      end
    # Normal word - just capitalize the first letter
    else
      if index == 1 || !(word in uncapitalized) || words_formatted[end][end] in punctuation
        formatted_word = uppercasefirst(lowercase(word))
      else
        formatted_word = lowercase(word)
      end
    end

    push!(words_formatted, formatted_word)
  end
  
  return join(words_formatted, " ")

end


function format_title(title::String)

  formatted = publication_title_case(title)
  return string("<b>", formatted, "</b>")

end

function format_authors(authors::Vector{BibInternal.Name})
  function format_author(author::BibInternal.Name)
    words = String[]
  
    push!(words, author.first)
    
    if length(author.middle) > 0
      push!(words, author.middle)
    end
  
    push!(words, author.last)
  
    return join(words, " ")
  end

  return join([format_author(author) for author in authors], ", ")
end

function format_publication(
  access::BibInternal.Access,
  date::BibInternal.Date,
  pub::BibInternal.In
)

  publication_components = String[]

  push!(publication_components, string("<i>", publication_title_case(pub.journal), "</i>"))

  if length(pub.volume) > 0
    if length(pub.number) > 0
      push!(publication_components, string(pub.volume, "(", pub.number, ")"))
    else
      push!(publication_components, pub.volume)
    end
  end

  if length(pub.pages) > 0
    push!(publication_components, replace(replace(pub.pages, "---" => "–"), "--" => "–"))
  end

  if length(date.year) > 0
    push!(publication_components, date.year)
  end

  if length(access.doi) > 0
    doi_string = string("(<a href=https://doi.org/", access.doi, "> DOI: ", access.doi, "</a>).")
    push!(publication_components, doi_string)
  end

  return join(publication_components, ", ")

end


function process_bib(file_name="_files/publications.bib")
  # TODO:
  # - Separate by year?

  entries = import_bibtex(file_name)

  forthcoming_cues = ["in preparation", "in review"]
  preprint_cues = ["arxiv", "chemrxiv", "pci", "osf preprints", "zenodo"]

  # For now, will have 3 sections:
  # Forthcoming, preprints, and peer-reviewed publications
  forthcoming_strings = String[]
  preprint_strings = String[]
  peerrev_strings = String[]

  for entry in entries.vals
    title = entry.title

    access = entry.access

    authors = entry.authors
    date = entry.date
    
    pub = entry.in

    title_string = format_title(title)

    if length(access.url) > 0
      title_string = string("<a href=", access.url, ">", title_string, "</a>")
    end

    author_string = format_authors(authors)
    publication_string = format_publication(access, date, pub)

    this_string = string(title_string, ".\n\t\t", author_string, ".\n\t\t", publication_string, ".\t\t\n")

    if lowercase(pub.journal) in forthcoming_cues
      push!(forthcoming_strings, this_string)
    elseif lowercase(pub.journal) in preprint_cues
      push!(preprint_strings, this_string)
    else
      push!(peerrev_strings, this_string)
    end

  end

  return Dict(
    "Forthcoming" => forthcoming_strings,
    "Preprints" => preprint_strings,
    "Peer-Reviewed" => peerrev_strings
  )

end

function hfun_bib()

  processed = process_bib()

  final_parts = String[]

  # Numbering 
  index = 0
  for group in processed
    index += length(group[2])
  end

  for (key, values) in processed
    section_title = string(
      "<div class=\"bibsection\">\n\t<div class=\"bibsectiontitle\"><h2>",
      key,
      "</h2></div>\n"
    )

    push!(final_parts, section_title)

    for entry in values
      valstring = string(
        "\t\t<div class=\"bibentry\"> ", index, ") ", entry, "\n\t\t</div>\n"
      )
      push!(final_parts, valstring)
      index -= 1
    end

    push!(final_parts, "</div>")

  end

  overall_bib = join(final_parts, "\n")

  return overall_bib

end