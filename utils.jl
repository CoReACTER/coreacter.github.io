using BibInternal
using Bibliography
using YAML
using OrderedCollections

# For parsing and formatting *.bib files
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
  return string("<em>", formatted, "</em>")

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


function process_bib(file_name="_files/bib/publications.bib")
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
    elseif any(occursin(pp_cue, lowercase(pub.journal)) for pp_cue in preprint_cues)
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

# For parsing and formatting people
function hfun_peopletable(params::Vector{String})

  #TODO: add bios, fun facts, etc. to people.yml and this function

  people_data = YAML.load_file("_data/people.yml"; dicttype=OrderedDict{String,Any})

  role = params[1]
  title = params[2]

  final_parts = [string(
    "<div class=\"peopletabtitle\"><h2>",
    title,
    "</h2></div>"
  )]

  # Table initialization


  push!(
    final_parts,
    """<table class="peopletab">
<colgroup>
<col width="20%" />
<col width="80%" />
</colgroup>
<thead></thead>
<tbody>
"""
  )

  for values in people_data.vals
    if values["role"] == role
      push!(
        final_parts,
        string(
          "\t<tr>\n\t\t<td>\n\t\t\t<div class=\"author_avatar\"><img src=\"/_files/images/",
          values["image"],
          "\" class=\"author_avatar\" alt=\"",
          values["alt"],
          "\"></div>\n\t\t</td>\n\t\t<td>\n\t\t\t<p><strong>",
          values["display_name"],
          "</strong> (",
          values["pronouns"],
          ")<br>\n\t\t\tCurrent Position: ",
          values["position"],
          "<br>\n\t\t\tE-mail: <a href=\"mailto:",
          values["email"],
          "\">",
          values["email"],
          "</a></p>\n\t\t</td>\n\t</tr>"
        )
      )
    end
  end

  push!(
    final_parts,
    "</tbody>\n</table>"
  )

  return join(final_parts, "\n")

end

const global months_names = Dict(
  1 => "Jan",
  2 => "Feb",
  3 => "Mar",
  4 => "Apr",
  5 => "May",
  6 => "Jun",
  7 => "Jul",
  8 => "Aug",
  9 => "Sep",
  10 => "Oct",
  11 => "Nov",
  12 => "Dec"
)

# For parsing and formatting news
function hfun_news()

  global months_names

  news_data = YAML.load_file("_data/news.yml")

  # Probably going to want to reformat this at some point and have it be a table with images
  # For now, this lazy approach with div will work
  final_parts = [
    """<table class="newstab" style="border:0;">
<colgroup>
<col width="20%" />
<col width="80%" />
</colgroup>
<thead></thead>
<tbody>
"""
  ]

  for entry in sort(collect(news_data), by=x -> x[2]["date"], rev=true)
    date = entry[2]["date"]
    this_date_string = string(
      months_names[Dates.month(date)],
      " ",
      Dates.day(date),
      ", ",
      Dates.year(date)
    )

    push!(
      final_parts,
      string(
        "\t<tr>\n\t\t<td>\n\t\t\t<em>",
        this_date_string,
        "</em>\n\t\t</td>\n\t\t<td>\n\t\t\t<p>",
        entry[2]["text"],
        "</p>\n\t\t</td>\n\t</tr>"
      )
    )
  end

  push!(
    final_parts,
    "</tbody>\n</table>"
  )

  return join(final_parts, "\n")

end

# For providing previews of blog posts
function hfun_blog_post_table()

  global months_names

  base_dir = "posts"
  blog_post_files = sort(filter(f -> endswith(f, ".md"), readdir(base_dir)), rev=true)

  people_data = YAML.load_file("_data/people.yml"; dicttype=OrderedDict{String,Any})

  title_pattern = r"\s*blog_post_title = \"(.*)\"\n"
  date_pattern = r"\s*blog_post_date = Date\(([\d]+), ([\d]+), ([\d]+)\)"
  author_pattern = r"\s*blog_post_author = \[((?:\"(?:[A-Za-z0-9]+)\",?\s*)+)\]\n"
  preview_pattern = r"\s*blog_post_preview = \"(.*)\"\n"
  image_pattern = r"\s*blog_post_image = \"(.*)\"\n"
  alt_pattern = r"\s*blog_post_image_alt = \"(.*)\"\n"

  final_parts = [
    """<table class="blogtab" style="border:0;">
<colgroup>
<col width="40%" />
<col width="60%" />
</colgroup>
<thead></thead>
<tbody>
"""
  ]

  for post in blog_post_files
    file = open(string(base_dir, "/", post), "r")

    contents = read(file, String)

    title_match = match(title_pattern, contents)
    author_match = match(author_pattern, contents)
    date_match = match(date_pattern, contents)
    preview_match = match(preview_pattern, contents)
    image_match = match(image_pattern, contents)
    alt_match = match(alt_pattern, contents)

    if title_match !== nothing && author_match !== nothing && preview_match !== nothing && date_match !== nothing
      this_string = string(
        "\t<tr>\n\t\t<td>\n",
      )

      # No alt text, no image; we're trying to be accessible here
      # Should we have a place-holder image?
      if image_match !== nothing && alt_match !== nothing
        this_string = string(
          this_string,
          "\t\t\t<div class=\"blog_preview_image\"><img src=\"/_files/images/",
          image_match.captures[1],
          "\" class=\"blog_preview_image\" alt=\"",
          alt_match.captures[1],
          "\"></div>\n\t\t</td>\n\t\t",
        )
      else
        this_string = string(
          this_string,
          "\t\t</td>\n\t\t"
        )
      end

      authors = [replace(x, "\"" => "") for x in split(author_match.captures[1], r",\s+")]

      author_parts = String[]

      for author in authors
        if author in keys(people_data)
          this_author_string = string(
            people_data[author]["display_name"],
            " (",
            people_data[author]["pronouns"],
            ")"
          )
          push!(author_parts, this_author_string)
        else
          push!(author_parts, "Unknown Author")
        end
      end

      author_string = "<em>" * join(author_parts, ", ") * "</em>"

      # Whether there's an image or no, now we put in the title and preview

      this_date_string = string(
        months_names[parse(Int, date_match.captures[2])],
        " ",
        date_match.captures[3],
        ", ",
        date_match.captures[1]
      )

      # Maximum length of a blog post summary
      blog_capture_limit = 250

      preview_capture = preview_match.captures[1]
      if length(preview_capture) > blog_capture_limit
        preview_string = preview_capture[1:blog_capture_limit-3] * "..."
      else
        preview_string = preview_capture
      end

      this_string = string(
        this_string,
        "<td>\n\t\t\t<h2><a href=\"/posts/",
        split(post, ".")[1],
        "\">",
        title_match.captures[1],
        "</a></h2><br>\n\t\t\t<p>",
        author_string,
        "<br>\n\t\t\tPosted on: ",
        this_date_string,
        "<br>\n\t\t",
        preview_string,
        "\n\t\t\t</p>\n\t\t</td>\n\t</tr>",
      )
    end

    push!(final_parts, this_string)

    close(file)
  end

  push!(
    final_parts,
    "</tbody>\n</table>"
  )

  return join(final_parts, "\n")
end

function hfun_philosophy_nav()
  nav_string = """<nav class="philosophy_nav">
  <ul>
    <li class="philosophy_nav"><a href="/philosophy/principles/">CoReACTER Principles</a></li>
    <li class="philosophy_nav"><a href="/philosophy/guidelines/">Guidelines for ReACTERs</a></li>
    <li class="philosophy_nav"><a href="/philosophy/openscience/">Open Science</a></li>
    <li class="philosophy_nav"><a href="/philosophy/decisionmaking/">Decision-Making in the CoReACTER</a></li>
  </ul>
  <img src="/assets/menudots.svg" id="philosophy-menu-icon" alt="Icon for philosophy page menu: three black dots in a circle" width="100">
</nav>
  """

  # <li class="philosophy_nav"><a href="/philosophy/accountability/">Practices of accountability</a></li>

  return nav_string
end

function hfun_active_projects()

  projects_data = YAML.load_file("_data/funding.yml"; dicttype=OrderedDict{String,Any})

  # Table initialization
  final_parts = [
    """<table class="projectstab">
<colgroup>
<col width="30%" />
<col width="70%" />
</colgroup>
<thead></thead>
<tbody>
"""
  ]

  for values in projects_data.vals
    if !values["active"]
      continue
    end

    push!(
      final_parts,
      string(
        "\t<tr>\n\t\t<td>\n\t\t\t<div class=\"project_logo\"><img src=\"/_files/images/",
        values["image"],
        "\" class=\"project_logo\" alt=\"",
        values["alt"],
        "\"></div>\n\t\t</td>\n\t\t<td>\n\t\t\t<p><strong>",
        values["source_name"],
        "</strong>, <em>",
        values["funder_name"],
        "</em> (",
        values["start_year"],
        "–",
        values["end_year"],
        ")<br>\n\t\t\t<strong>Project</strong>: ",
        values["project_name"],
        "<br>\n\t\t\t<strong>Description</strong>: ",
        values["project_abstract"],
        "</p>\n\t\t</td>\n\t</tr>"
      )
    )
  end

  push!(
    final_parts,
    "</tbody>\n</table>"
  )

  return join(final_parts, "\n")
end

function hfun_previous_projects()

  projects_data = YAML.load_file("_data/funding.yml"; dicttype=OrderedDict{String,Any})

  # Table initialization
  final_parts = [
    """<table class="projectstab">
<colgroup>
<col width="40%" />
<col width="60%" />
</colgroup>
<thead></thead>
<tbody>
"""
  ]

  for values in projects_data.vals
    if values["active"]
      continue
    end

    push!(
      final_parts,
      string(
        "\t<tr>\n\t\t<td>\n\t\t\t<div class=\"project_logo\"><img src=\"/_files/images/",
        values["image"],
        "\" class=\"project_logo\" alt=\"",
        values["alt"],
        "\"></div>\n\t\t</td>\n\t\t<td>\n\t\t\t<p><strong>",
        values["source_name"],
        "</strong>, <em>",
        values["funder_name"],
        "</em> (",
        values["start_year"],
        "–",
        values["end_year"],
        ")<br>\n\t\t\t<strong>Project</strong>: ",
        values["project_name"],
        "<br>\n\t\t\t<strong>Description</strong>: ",
        values["project_abstract"],
        "</p>\n\t\t</td>\n\t</tr>"
      )
    )
  end

  push!(
    final_parts,
    "</tbody>\n</table>"
  )

  return join(final_parts, "\n")
end

function hfun_softwaretable()
  
  software_data = YAML.load_file("_data/software.yml"; dicttype=OrderedDict{String,Any})
  people_data = YAML.load_file("_data/people.yml"; dicttype=OrderedDict{String,Any})

  # Table initialization
  final_parts = [
    """<table class="softwaretab">
<colgroup>
<col width="30%" />
<col width="70%" />
</colgroup>
<thead></thead>
<tbody>
"""
  ]

  for values in software_data.vals

    push!(
      final_parts,
      string(
        "\t<tr>\n\t\t<td>\n\t\t\t<div class=\"project_logo\"><img src=\"/_files/images/",
        values["image"],
        "\" class=\"project_logo\" alt=\"",
        values["alt"],
        "\"></div>\n\t\t</td>\n\t\t<td>\n\t\t\t<p><strong><a href=\"",
        values["url"],
        "\">",
        values["display_name"],
        "</a></strong><br>\n<strong>Lead Developer</strong>: ",
        people_data[values["lead_dev"]]["display_name"],
        " (",
        people_data[values["lead_dev"]]["pronouns"],
        ")<br>\n<strong>Lead Maintainer</strong>: ",
        people_data[values["lead_maint"]]["display_name"],
        " (",
        people_data[values["lead_maint"]]["pronouns"],
        ")\n",
        "<br>\n\t\t\t<strong>Description</strong>: ",
        values["description"],
        "</p>\n\t\t</td>\n\t</tr>"
      )
    )
  end

  push!(
    final_parts,
    "</tbody>\n</table>"
  )

  return join(final_parts, "\n")  

end

function hfun_computing_support()
  support_data = YAML.load_file("_data/computing_support.yml"; dicttype=OrderedDict{String,Any})

  # Table initialization
  final_parts = [
    """<table class="projectstab">
<colgroup>
<col width="30%" />
<col width="70%" />
</colgroup>
<thead></thead>
<tbody>
"""
  ]

  for values in support_data.vals
    if !values["active"]
      continue
    end

    push!(
      final_parts,
      string(
        "\t<tr>\n\t\t<td>\n\t\t\t<div class=\"project_logo\"><img src=\"/_files/images/",
        values["image"],
        "\" class=\"project_logo\" alt=\"",
        values["alt"],
        "\"></div>\n\t\t</td>\n\t\t<td>\n\t\t\t<p><strong>",
        values["source_name"],
        "</strong>, <em>",
        values["provider_name"],
        "</em></p>\n\t\t</td>\n\t</tr>"
      )
    )
  end

  push!(
    final_parts,
    "</tbody>\n</table>"
  )

  return join(final_parts, "\n")
end

function hfun_software_support()
  support_data = YAML.load_file("_data/software_support.yml"; dicttype=OrderedDict{String,Any})

  # Table initialization
  final_parts = [
    """<table class="projectstab">
<colgroup>
<col width="30%" />
<col width="70%" />
</colgroup>
<thead></thead>
<tbody>
"""
  ]

  for values in support_data.vals
    if !values["active"]
      continue
    end

    push!(
      final_parts,
      string(
        "\t<tr>\n\t\t<td>\n\t\t\t<div class=\"project_logo\"><img src=\"/_files/images/",
        values["image"],
        "\" class=\"project_logo\" alt=\"",
        values["alt"],
        "\"></div>\n\t\t</td>\n\t\t<td>\n\t\t\t<p><strong>",
        values["display_name"],
        "</strong><br>\n\t\t\t<strong>Description</strong>: ",
        values["description"],
        "</p>\n\t\t</td>\n\t</tr>"
      )
    )
  end

  push!(
    final_parts,
    "</tbody>\n</table>"
  )

  return join(final_parts, "\n")
end