%%
%% This is file `gbt7714-plain.bst',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% gbt7714.dtx  (with options: `authoryear')
%% 
%% Copyright (C) 2016-2018 by Zeping Lee <zepinglee AT gmail.com>
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.2 of this license or (at your option) any later
%% version. The latest version of this license is in:
%% 
%%     http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of
%% LaTeX version 1999/12/01 or later.
%% 
%% This BibTeX style file is derived from `plainnat.bst' by Patrick W Daly,
%% which was designed for use with the `natbib.sty' package.
%% 
ENTRY
  { address
    author
    booktitle
    date
    doi
    edition
    editor
    institution
    journal
    key
    language
    mark
    medium
    number
    organization
    pages
    pinyin
    publisher
    school
    series
    title
    translator
    url
    urldate
    volume
    year
  }
  { entry.lang }
  { label extra.label sort.label short.list entry.mark }

INTEGERS { output.state before.all mid.sentence after.sentence after.block after.slash }

INTEGERS { lang.zh lang.ja lang.en lang.ru lang.other }

INTEGERS { charptr stringlength }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
  #4 'after.slash :=
  #3 'lang.zh :=
  #4 'lang.ja :=
  #1 'lang.en :=
  #2 'lang.ru :=
  #0 'lang.other :=
}

STRINGS { s t }

FUNCTION {debug}
{ 's :=
  duplicate$
  "DEBUG: " s * " -> `" *
  swap$ * "'" *
  top$
}

FUNCTION {debug.int}
{ 's :=
  duplicate$ int.to.str$
  "DEBUG: " s * " == " *
  swap$ *
  top$
}

FUNCTION {punct.colon}
{ ": "
}

FUNCTION {punct.slash}
{ "//\allowbreak{}"
}

FUNCTION {punct.space}
{ " "
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { output.state after.slash =
                { punct.slash * write$ }
                { add.period$ " " * write$ }
              if$
            }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.after}
{ 't :=
  duplicate$ empty$
    'pop$
    { 's :=
      output.state mid.sentence =
        { t * write$ }
        { output.state after.block =
            { add.period$ write$
              newline$
              "\newblock " write$
            }
            { output.state before.all =
                'write$
                { output.state after.slash =
                    { punct.slash * write$ }
                    { add.period$ " " * write$ }
                  if$
                }
              if$
            }
          if$
          mid.sentence 'output.state :=
        }
      if$
      s
    }
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {fin.entry}
{ type$ "book" =
  type$ "inbook" = or
  type$ "incollection" = or
  type$ "collection" = or
    'skip$
    'add.period$
  if$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { output.state after.slash =
        'skip$
        { after.block 'output.state := }
      if$
    }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { output.state after.slash =
            'skip$
            { after.sentence 'output.state := }
          if$
        }
      if$
    }
  if$
}

FUNCTION {new.slash}
{ output.state before.all =
    'skip$
    { after.slash 'output.state := }
  if$
}

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "\emph{" swap$ * "}" * }
  if$
}

INTEGERS { ascii }

FUNCTION {get.char.lang}
{ chr.to.int$ 'ascii :=
  ascii #64 > ascii #91 < and ascii #96 > ascii #123 < and or
    { lang.en }
    { ascii #227 > ascii #234 < and
        { lang.zh }
        { ascii #227 =
            { lang.ja }
            { ascii #207 > ascii #212 < and
                { lang.ru }
                { lang.en }
              if$
            }
          if$
        }
      if$
    }
  if$
}

INTEGERS { char.lang tmp.lang }

STRINGS { tmp.str }

FUNCTION {get.str.lang}
{ 'tmp.str :=
  lang.other 'tmp.lang :=
  tmp.str empty$
    { "Empty string!" warning$ }
    { #1 'charptr :=
      tmp.str text.length$ #1 + 'stringlength :=
        { charptr stringlength < }
        { tmp.str charptr #1 substring$ get.char.lang 'char.lang :=
          char.lang tmp.lang >
            { char.lang 'tmp.lang := }
            'skip$
          if$

          char.lang lang.zh = char.lang lang.ja = or
            { charptr #3 + 'charptr := }
            { char.lang lang.ru =
                { charptr #2 + 'charptr := }
                { charptr #1 + 'charptr := }
              if$
            }
          if$
        }
      while$
    }
  if$
  tmp.lang
}

FUNCTION {is.in.chinese}
{ entry.lang lang.zh =
}

FUNCTION {format.et.al}
{ is.in.chinese
    { "等"}
    { "et~al." }
  if$
}

FUNCTION {format.anonymous}
{ is.in.chinese
    { "佚名" }
    { "Anon" }
  if$
}

INTEGERS { nameptr namesleft numnames name.lang }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv~}{ll}{, jj}{, ff}" format.name$ 't :=
      nameptr #4 =
        { format.et.al
          #1 'namesleft :=
        }
        { t "others" =
            { format.et.al }
            { t get.str.lang 'name.lang :=
              name.lang lang.en =
                { t #1 "{vv~}{ll}{ f{~}}{, jj}" format.name$ }
                { t #1 "{ll}{ff}" format.name$ }
              if$
            }
          if$
        }
      if$
      nameptr #1 >
        { ", " swap$ * * }
        'skip$
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.key}
{ empty$
    { key field.or.null }
    { "" }
  if$
}

FUNCTION {format.authors}
{ author empty$
    { format.anonymous }
    { author format.names }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.names }
  if$
}

FUNCTION {format.translators}
{ translator empty$
    { "" }
    { translator format.names
      is.in.chinese
        { translator num.names$ #3 >
            { "译" * }
            { ", 译" * }
          if$
        }
        'skip$
      if$
    }
  if$
}

FUNCTION {format.url}
{ url empty$
    { "" }
    { new.block "\url{" url * "}" * }
  if$
}

FUNCTION {format.doi}
{ ""
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$ }
  if$
}

FUNCTION {set.mark}
{ entry.mark empty$ not
    'pop$
    { mark empty$ not
        { pop$ mark 'entry.mark := }
        { 'entry.mark := }
      if$
      medium empty$ not
        { entry.mark "/" * medium * 'entry.mark := }
        { url empty$ not
            { entry.mark "/OL" * 'entry.mark := }
            'skip$
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.mark}
{ "\allowbreak[" entry.mark * "]" * }

FUNCTION {format.full.names}
{'s :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv~}{ll}{, jj}{, ff}" format.name$ 't :=
      t get.str.lang 'name.lang :=
      name.lang lang.en =
        { t #1 "{vv~}{ll}" format.name$ 't := }
        { t #1 "{ll}{ff}" format.name$ 't := }
      if$
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              numnames #2 >
                { "," * }
                'skip$
              if$
              t "others" =
                { " et~al." * }
                { " and " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {author.editor.full}
{ author empty$
    { editor empty$
        { "" }
        { editor format.full.names }
      if$
    }
    { author format.full.names }
  if$
}

FUNCTION {author.full}
{ author empty$
    { "" }
    { author format.full.names }
  if$
}

FUNCTION {editor.full}
{ editor empty$
    { "" }
    { editor format.full.names }
  if$
}

FUNCTION {make.full.names}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.full
    { type$ "collection" =
      type$ "proceedings" =
      or
        'editor.full
        'author.full
      if$
    }
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem[" write$
  label write$
  ")" make.full.names duplicate$ short.list =
     { pop$ }
     { * }
   if$
  "]{" * write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {hyphenate}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { "-" *
            { t #1 #1 substring$ "-" = }
            { t #2 global.max$ substring$ 't := }
          while$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {extract.before.dash}
{ duplicate$ empty$
    { pop$ "" }
    { 's :=
      #1 'charptr :=
      s text.length$ #1 + 'stringlength :=
        { charptr stringlength <
          s charptr #1 substring$ "-" = not
          and
        }
        { charptr #1 + 'charptr := }
      while$
      s #1 charptr #1 - substring$
    }
  if$
}

FUNCTION {extract.after.dash}
{ duplicate$ empty$
    { pop$ "" }
    { 's :=
      #1 'charptr :=
      s text.length$ #1 + 'stringlength :=
        { charptr stringlength <
          s charptr #1 substring$ "-" = not
          and
        }
        { charptr #1 + 'charptr := }
      while$
        { charptr stringlength <
          s charptr #1 substring$ "-" =
          and
        }
        { charptr #1 + 'charptr := }
      while$
      s charptr global.max$ substring$
    }
  if$
}

FUNCTION {contains.dash}
{ duplicate$ empty$
    { pop$ #0 }
    { 's :=
        { s empty$ not
          s #1 #1 substring$ "-" = not
          and
        }
        { s #2 global.max$ substring$ 's := }
      while$
      s empty$ not
    }
  if$
}

FUNCTION {format.year}
{ year empty$ not
    { year extract.before.dash }
    { date empty$ not
        { date extract.before.dash }
        { "empty year in " cite$ * warning$
          ""
        }
      if$
    }
  if$
  extra.label *
}

FUNCTION {format.date}
{ type$ "patent" = type$ "newspaper" = or
  date empty$ not and
    { date }
    { year }
  if$
}

FUNCTION {format.editdate}
{ date empty$ not
  type$ "newspaper" = not and
  url empty$ not doi empty$ not or
  and
    { "\allowbreak(" date * ")" * }
    { "" }
  if$
}

FUNCTION {format.urldate}
{ urldate empty$ not
    { "\allowbreak[" urldate * "]" * }
    { "" }
  if$
}

FUNCTION {format.btitle}
{ title emphasize
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {is.digit}
{ duplicate$ empty$
    { pop$ #0 }
    { chr.to.int$
      duplicate$ "0" chr.to.int$ <
      { pop$ #0 }
      { "9" chr.to.int$ >
          { #0 }
          { #1 }
        if$
      }
    if$
    }
  if$
}

FUNCTION {is.number}
{ 's :=
  s empty$
    { #0 }
    { s text.length$ 'charptr :=
        { charptr #0 >
          s charptr #1 substring$ is.digit
          and
        }
        { charptr #1 - 'charptr := }
      while$
      charptr not
    }
  if$
}

FUNCTION {format.volume}
{ volume empty$
    { "" }
    { volume is.number
        { is.in.chinese
            { "第" volume * "卷" * }
            { "volume" volume tie.or.space.connect }
          if$
        }
        { volume }
      if$
    }
  if$
}

FUNCTION {format.number}
{ number empty$
    { "" }
    { number is.number
        { is.in.chinese
            { "第" number * "册" * }
            { "number" number tie.or.space.connect }
          if$
        }
        { number }
      if$
    }
  if$
}

FUNCTION {format.volume.number}
{ volume empty$ not
    { format.volume }
    { format.number }
  if$
}

FUNCTION {format.series.vol.num.title}
{ format.volume.number 's :=
  series empty$ not
    { series ": " *
      s empty$ not
        { s * "\quad " * }
        'skip$
      if$
      title *
    }
    { title
      s empty$ not
        { ": " * s * }
        'skip$
      if$
    }
  if$
  "t" change.case$
}

FUNCTION {format.series.vol.num.booktitle}
{ format.volume.number 's :=
  series empty$ not
    { series ": " *
      s empty$ not
        { s * "\quad " * }
        'skip$
      if$
      booktitle *
    }
    { booktitle
      s empty$ not
        { ": " * s * }
        'skip$
      if$
    }
  if$
}

FUNCTION {num.to.ordinal}
{ duplicate$ text.length$ 'charptr :=
  duplicate$ charptr #1 substring$ 's :=
  s "1" =
    { "st" * }
    { s "2" =
        { "nd" * }
        { s "3" =
            { "rd" * }
            { "th" * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { edition is.number
        { is.in.chinese
            { edition "版" * }
            { edition num.to.ordinal " ed." * }
          if$
        }
        { entry.lang lang.en =
            { edition "t" change.case$ 's :=
              s "Revised" = s "Revised edition" = or
                { "Rev. ed." }
                { s " ed." *}
              if$
            }
            { edition }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.sine.loco}
{ is.in.chinese
    { "[出版地不详]" }
    { "[S.l.]" }
  if$
}

FUNCTION {format.address}
{ address }

FUNCTION {format.sine.nomine}
{ is.in.chinese
    { "[出版者不详]" }
    { "[s.n.]" }
  if$
}

FUNCTION {format.publisher}
{ publisher empty$ not
    { publisher }
    { school empty$ not
        { school }
        { organization empty$ not
            { organization }
            { institution empty$ not
                { institution }
                { "" }
              if$
            }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.sine.loco.sine.nomine}
{ is.in.chinese
    { "[出版地不详: 出版者不详]" }
    { "[S.l.: s.n.]" }
  if$
}

FUNCTION {format.address.publisher}
{ address empty$ not
    { address
      format.publisher empty$ not
        { ": " * format.publisher * }
        { url empty$ doi empty$ and
            { ": " * format.sine.nomine * }
            'skip$
          if$
        }
      if$
    }
    { url empty$ doi empty$ and
        { format.publisher empty$ not
            { format.sine.loco ": " * format.publisher * }
            { format.sine.loco.sine.nomine }
          if$
        }
        { format.publisher empty$ not
            { format.publisher }
            { "" }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages hyphenate }
  if$
}

FUNCTION {format.journal.volume}
{ volume }

FUNCTION {format.journal.number}
{ number empty$ not
    { "\penalty0 (" number * ")" * }
    { "" }
  if$
}

FUNCTION {format.periodical.year.volume.number}
{ year empty$ not
    { year extract.before.dash }
    { "No year in periodical " cite$ * warning$ }
  if$
  volume empty$ not
    { ", " * volume extract.before.dash * }
    'skip$
  if$
  number empty$ not
    { "\penalty0 (" * number extract.before.dash * ")" * }
    'skip$
  if$
  year contains.dash
    { "--" *
      year extract.after.dash empty$
      volume extract.after.dash empty$ and
      number extract.after.dash empty$ and not
        { year extract.after.dash empty$ not
            { year extract.after.dash * }
            { year extract.before.dash * }
          if$
          volume empty$ not
            { ", " * volume extract.after.dash * }
            'skip$
          if$
          number empty$ not
            { "\penalty0 (" * number extract.after.dash * ")" * }
            'skip$
          if$
        }
        'skip$
      if$
    }
    'skip$
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
        { "In " booktitle emphasize * }
        { "In " format.editors * ", " * booktitle emphasize * }
      if$
    }
  if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$
  year empty$
  and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.article.crossref}
{ key empty$
    { journal empty$
        { "need key or journal for " cite$ * " to crossref " * crossref *
          warning$
          ""
        }
        { "In \emph{" journal * "}" * }
      if$
    }
    { "In " }
  if$
  " \citet{" * crossref * "}" *
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      "In "
    }
    { "Volume" volume tie.or.space.connect
      " of " *
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { series empty$
            { "need editor, key, or series for " cite$ * " to crossref " *
              crossref * warning$
              "" *
            }
            { "\emph{" * series * "}" * }
          if$
        }
        'skip$
      if$
    }
    'skip$
  if$
  " \citet{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{ editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { booktitle empty$
            { "need editor, key, or booktitle for " cite$ * " to crossref " *
              crossref * warning$
              ""
            }
            { "In \emph{" booktitle * "}" * }
          if$
        }
        { "In " }
      if$
    }
    { "In " }
  if$
  " \citet{" * crossref * "}" *
}

FUNCTION {monograph}
{ output.bibitem
  author empty$ not
    { format.authors }
    { editor empty$ not
        { format.editors }
        { format.anonymous }
      if$
    }
  if$
  output
  new.block
  format.year "year" output.check
  new.block
  format.series.vol.num.title "title" output.check
  "M" set.mark
  format.mark "" output.after
  new.block
  format.translators output
  new.sentence
  format.edition output
  new.block
  format.address.publisher output
  format.pages punct.colon output.after
  format.urldate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  new.block
  format.year "year" output.check
  new.block
  format.title "title" output.check
  "M" set.mark
  format.mark "" output.after
  new.block
  format.translators output
  new.slash
  format.editors output
  new.block
  format.series.vol.num.booktitle "booktitle" output.check
  new.block
  format.edition output
  new.block
  format.address.publisher output
  format.pages punct.colon output.after
  format.urldate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {periodical}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  new.block
  format.year "year" output.check
  new.block
  format.title "title" output.check
  "J" set.mark
  format.mark "" output.after
  new.block
  format.periodical.year.volume.number output
  new.block
  format.address.publisher output
  format.urldate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {article.in.journal}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  new.block
  format.year "year" output.check
  new.block
  format.title "title" output.check
  "J" set.mark
  format.mark "" output.after
  new.block
  journal "journal" output.check
  volume output
  format.journal.number "" output.after
  format.pages punct.colon output.after
  format.editdate "" output.after
  format.urldate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {patent}
{ output.bibitem
  format.authors output
  author format.key output
  new.block
  format.year "year" output.check
  new.block
  format.title
  number empty$ not
    { punct.colon * number * }
    'skip$
  if$
  "title" output.check
  "P" set.mark
  format.mark "" output.after
  new.block
  format.date "year" output.check
  format.urldate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {online}
{ output.bibitem
  format.authors output
  author format.key output
  new.block
  format.year "year" output.check
  new.block
  format.series.vol.num.title "title" output.check
  "EB" set.mark
  format.mark "" output.after
  new.block
  format.address.publisher output
  format.pages punct.colon output.after
  format.editdate "" output.after
  format.urldate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {misc}
{ journal empty$ not
    'article.in.journal
    { booktitle empty$ not
        'incollection
        { url empty$ not
            'online
            { "Z" set.mark
              monograph
            }
          if$
        }
      if$
    }
  if$
  empty.misc.check
}

FUNCTION {archive}
{ "A" set.mark
  misc
}

FUNCTION {article} { misc }

FUNCTION {book} { monograph }

FUNCTION {collection}
{ "G" set.mark
  monograph
}

FUNCTION {database}
{ "DB" set.mark
  misc
}

FUNCTION {dataset}
{ "DS" set.mark
  misc
}

FUNCTION {inbook} { book }

FUNCTION {inproceedings}
{ "C" set.mark
  incollection
}

FUNCTION {conference} { inproceedings }

FUNCTION {map}
{ "CM" set.mark
  misc
}

FUNCTION {mastersthesis}
{ is.in.chinese
    { "\thumasterbib{}" }
    { "D" }
  if$
 set.mark
  monograph
}

FUNCTION {newspaper}
{ "N" set.mark
  article.in.journal
}

FUNCTION {phdthesis}
{ is.in.chinese
    { "\thuphdbib{}" }
    { "D" }
  if$
 set.mark
  monograph
}

FUNCTION {proceedings}
{ "C" set.mark
  monograph
}

FUNCTION {software}
{ "CP" set.mark
  misc
}

FUNCTION {standard}
{ "S" set.mark
  misc
}

FUNCTION {techreport}
{ "R" set.mark
  misc
}

FUNCTION {default.type} { misc }

MACRO {jan} {"January"}

MACRO {feb} {"February"}

MACRO {mar} {"March"}

MACRO {apr} {"April"}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"August"}

MACRO {sep} {"September"}

MACRO {oct} {"October"}

MACRO {nov} {"November"}

MACRO {dec} {"December"}

MACRO {acmcs} {"ACM Computing Surveys"}

MACRO {acta} {"Acta Informatica"}

MACRO {cacm} {"Communications of the ACM"}

MACRO {ibmjrd} {"IBM Journal of Research and Development"}

MACRO {ibmsj} {"IBM Systems Journal"}

MACRO {ieeese} {"IEEE Transactions on Software Engineering"}

MACRO {ieeetc} {"IEEE Transactions on Computers"}

MACRO {ieeetcad}
 {"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}

MACRO {ipl} {"Information Processing Letters"}

MACRO {jacm} {"Journal of the ACM"}

MACRO {jcss} {"Journal of Computer and System Sciences"}

MACRO {scp} {"Science of Computer Programming"}

MACRO {sicomp} {"SIAM Journal on Computing"}

MACRO {tocs} {"ACM Transactions on Computer Systems"}

MACRO {tods} {"ACM Transactions on Database Systems"}

MACRO {tog} {"ACM Transactions on Graphics"}

MACRO {toms} {"ACM Transactions on Mathematical Software"}

MACRO {toois} {"ACM Transactions on Office Information Systems"}

MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}

MACRO {tcs} {"Theoretical Computer Science"}

READ

EXECUTE {init.state.consts}

FUNCTION {set.entry.lang}
{ language empty$
    { author field.or.null title field.or.null * get.str.lang }
    { language "english" = language "american" = or language "british" = or
        { lang.en }
        { language "chinese" =
            { lang.zh }
            { language "japanese" =
                { lang.ja }
                { language "russian" =
                    { lang.ru }
                    { lang.other }
                  if$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
  'entry.lang :=
}

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

FUNCTION {format.lab.names}
{ 's :=
  s #1 "{vv~}{ll}{, jj}{, ff}" format.name$ 't :=
  t get.str.lang 'name.lang :=
  name.lang lang.en =
    { t #1 "{vv~}{ll}" format.name$}
    { t #1 "{ll}{ff}" format.name$}
  if$
  s num.names$ #1 >
    { "\ " * format.et.al * }
    'skip$
  if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
        { key empty$
            { cite$ #1 #3 substring$ }
            'key
          if$
        }
        { editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.key.organization.label}
{ author empty$
    { key empty$
        { organization empty$
            { cite$ #1 #3 substring$ }
            { "The " #4 organization chop.word #3 text.prefix$ }
          if$
        }
        'key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.organization.label}
{ editor empty$
    { key empty$
        { organization empty$
            { cite$ #1 #3 substring$ }
            { "The " #4 organization chop.word #3 text.prefix$ }
          if$
        }
        'key
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.short.authors}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "collection" =
      type$ "proceedings" =
      or
        { editor empty$ not
            'editor.key.organization.label
            'author.key.organization.label
          if$
        }
        'author.key.label
      if$
    }
  if$
  'short.list :=
}

FUNCTION {calc.label}
{ calc.short.authors
  short.list
  "("
  *
  format.year duplicate$ empty$
  short.list key field.or.null = or
     { pop$ "" }
     'skip$
  if$
  *
  'label :=
}

FUNCTION {sort.language.label}
{ entry.lang lang.zh =
    { "a zh " }
    { entry.lang lang.ja =
        { "b ja " }
        { entry.lang lang.en =
            { "c en " }
            { entry.lang lang.ru =
                { "d ru " }
                { "e other " }
              if$
            }
          if$
        }
      if$
    }
  if$
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    {
      s nameptr "{vv{ } }{ll{ }}{  ff{ }}{  jj{ }}" format.name$ 't :=
      nameptr #1 >
        {
          "   "  *
          namesleft #1 = t "others" = and
            { "zzzzz" * }
            { numnames #2 > nameptr #2 = and
                { "zz" * year field.or.null * "   " * }
                'skip$
              if$
              t sortify *
            }
          if$
        }
        { t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {key.or.pinyin}
{ key empty$
    { pinyin empty$
        { "" }
        { pinyin }
      if$
    }
    { key }
  if$
}

FUNCTION {anonymous.sort}
{ is.in.chinese
    { "yi4 ming2" }
    { "anon" }
  if$
}

FUNCTION {author.sort}
{ key.or.pinyin empty$
    { author empty$
        { anonymous.sort }
        { author sort.format.names }
      if$
    }
    { key.or.pinyin sortify }
  if$
}

FUNCTION {author.editor.sort}
{ key.or.pinyin empty$
    { author empty$
        { editor empty$
            { anonymous.sort }
            { editor sort.format.names }
          if$
        }
        { author sort.format.names }
      if$
    }
    { key.or.pinyin sortify }
  if$
}

FUNCTION {author.organization.sort}
{ key.or.pinyin empty$
    { author empty$
        { organization empty$
            { anonymous.sort }
            { "The " #4 organization chop.word sortify }
          if$
        }
        { author sort.format.names }
      if$
    }
    { key.or.pinyin sortify }
  if$
}

FUNCTION {editor.organization.sort}
{ key.or.pinyin empty$
    { editor empty$
        { organization empty$
            { anonymous.sort }
            { "The " #4 organization chop.word sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { key.or.pinyin sortify }
  if$
}

FUNCTION {presort}
{ set.entry.lang
  calc.label
  label sortify
  "    "
  *
  sort.language.label
  type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "collection" =
      type$ "proceedings" =
      or
        'editor.organization.sort
        'author.sort
      if$
    }
  if$
  *
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  cite$
  *
  #1 entry.max$ substring$
  'sort.label :=
  sort.label *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}

SORT

STRINGS { longest.label last.label next.extra }

INTEGERS { longest.label.width last.extra.num number.label }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #0 int.to.chr$ 'last.label :=
  "" 'next.extra :=
  #0 'longest.label.width :=
  #0 'last.extra.num :=
  #0 'number.label :=
}

FUNCTION {forward.pass}
{ last.label label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      label 'last.label :=
    }
  if$
  number.label #1 + 'number.label :=
}

FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  extra.label 'next.extra :=
  extra.label
  duplicate$ empty$
    'skip$
    { "{\natexlab{" swap$ * "}}" * }
  if$
  'extra.label :=
  label extra.label * 'label :=
}

EXECUTE {initialize.longest.label}

ITERATE {forward.pass}

REVERSE {reverse.pass}

FUNCTION {bib.sort.order}
{ sort.label  'sort.key$ :=
}

ITERATE {bib.sort.order}

SORT

FUNCTION {begin.bib}
{   preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{" number.label int.to.str$ * "}" *
  write$ newline$
  "\providecommand{\natexlab}[1]{#1}"
  write$ newline$
  "\providecommand{\url}[1]{#1}"
  write$ newline$
  "\providecommand{\href}[2]{\url{#2}}"
  write$ newline$
  "\providecommand{\doi}[1]{DOI: \href{https://doi.org/#1}{#1}}"
  write$ newline$
  "\expandafter\ifx\csname urlstyle\endcsname\relax\relax\else"
  write$ newline$
  "  \urlstyle{same}\fi"
  write$ newline$
}

EXECUTE {begin.bib}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
