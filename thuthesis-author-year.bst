%%
%% This is file `versions/thu/thuthesis-author-year.bst',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% gbt7714.dtx  (with options: `thu,2005,authoryear')
%% -------------------------------------------------------------------
%% GB/T 7714-2015 BibTeX Style
%% https://github.com/CTeX-org/gbt7714-bibtex-style
%% Version: 2019/03/21 v1.1.1
%% -------------------------------------------------------------------
%% Copyright (C) 2016-2019 by Zeping Lee <zepinglee AT gmail.com>
%% -------------------------------------------------------------------
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    https://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% -------------------------------------------------------------------
INTEGERS {
  uppercase.name
  max.num.authors
  period.between.author.year
  sentence.case.title
  link.title
  show.mark
  slash.for.extraction
  in.booktitle
  italic.jounal
  bold.journal.volume
  show.missing.address.publisher
  show.url
  show.doi
  show.note
  lang.zh.order
  lang.ja.order
  lang.en.order
  lang.ru.order
  lang.other.order
}

FUNCTION {load.config}
{
  #0 'uppercase.name :=
  #3 'max.num.authors :=
  #1 'period.between.author.year :=
  #1 'sentence.case.title :=
  #0 'link.title :=
  #1 'show.mark :=
  #1 'slash.for.extraction :=
  #0 'in.booktitle :=
  #0 'italic.jounal :=
  #0 'bold.journal.volume :=
  #0 'show.missing.address.publisher :=
  #1 'show.url :=
  #0 'show.doi :=
  #0 'show.note :=
  #1 'lang.zh.order :=
  #2 'lang.ja.order :=
  #3 'lang.en.order :=
  #4 'lang.ru.order :=
  #5 'lang.other.order :=
}

ENTRY
  { address
    author
    booktitle
    date
    doi
    edition
    editor
    howpublished
    institution
    journal
    key
    language
    mark
    medium
    note
    number
    organization
    pages
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
  { entry.lang entry.is.electronic entry.numbered }
  { label extra.label sort.label short.list entry.mark entry.url }

INTEGERS { output.state before.all mid.sentence after.sentence after.block after.slash }

INTEGERS { lang.zh lang.ja lang.en lang.ru lang.other }

INTEGERS { charptr len }

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

FUNCTION {bbl.anonymous}
{ entry.lang lang.zh =
    { "佚名" }
    { "Anon" }
  if$
}

FUNCTION {bbl.space}
{ entry.lang lang.zh =
    { "\ " }
    { " " }
  if$
}

FUNCTION {bbl.et.al}
{ entry.lang lang.zh =
    { "等" }
    { entry.lang lang.ja =
        { "他" }
        { entry.lang lang.ru =
            { "идр" }
            { "et~al." }
          if$
        }
      if$
    }
  if$
}

FUNCTION {citation.et.al}
{ bbl.et.al }

FUNCTION {bbl.colon} { ": " }

FUNCTION {bbl.wide.space} { "\ " }

FUNCTION {bbl.slash} { " // " }

FUNCTION {bbl.sine.loco}
{ entry.lang lang.zh =
    { "[出版地不详]" }
    { "[S.l.]" }
  if$
}

FUNCTION {bbl.sine.nomine}
{ entry.lang lang.zh =
    { "[出版者不详]" }
    { "[s.n.]" }
  if$
}

FUNCTION {bbl.sine.loco.sine.nomine}
{ entry.lang lang.zh =
    { "[出版地不详: 出版者不详]" }
    { "[S.l.: s.n.]" }
  if$
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

STRINGS { s t }

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
                { bbl.slash * write$
                  newline$
                }
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
                    { bbl.slash * write$ }
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
{ add.period$
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
    { slash.for.extraction
        { after.slash 'output.state := }
        { after.block 'output.state := }
      if$
    }
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

FUNCTION {italicize}
{ duplicate$ empty$
    { pop$ "" }
    { "\textit{" swap$ * "}" * }
  if$
}

INTEGERS { byte second.byte }

INTEGERS { char.lang tmp.lang }

STRINGS { tmp.str }

FUNCTION {get.str.lang}
{ 'tmp.str :=
  lang.other 'tmp.lang :=
  #1 'charptr :=
  tmp.str text.length$ #1 + 'len :=
    { charptr len < }
    { tmp.str charptr #1 substring$ chr.to.int$ 'byte :=
      byte #128 <
        { charptr #1 + 'charptr :=
          byte #64 > byte #91 < and byte #96 > byte #123 < and or
            { lang.en 'char.lang := }
            { lang.other 'char.lang := }
          if$
        }
        { tmp.str charptr #1 + #1 substring$ chr.to.int$ 'second.byte :=
          byte #224 <
            { charptr #2 + 'charptr :=
              byte #207 > byte #212 < and
              byte #212 = second.byte #176 < and or
                { lang.ru 'char.lang := }
                { lang.other 'char.lang := }
              if$
            }
            { byte #240 <
                { charptr #3 + 'charptr :=
                  byte #227 > byte #234 < and
                    { lang.zh 'char.lang := }
                    { byte #227 =
                        { second.byte #143 >
                            { lang.zh 'char.lang := }
                            { second.byte #128 > second.byte #132 < and
                                { lang.ja 'char.lang := }
                                { lang.other 'char.lang := }
                              if$
                            }
                          if$
                        }
                        { byte #239 =
                          second.byte #163 > second.byte #172 < and and
                            { lang.zh 'char.lang := }
                            { lang.other 'char.lang := }
                          if$
                        }
                      if$
                    }
                  if$
                }
                { charptr #4 + 'charptr :=
                  byte #240 = second.byte #159 > and
                    { lang.zh 'char.lang := }
                    { lang.other 'char.lang := }
                  if$
                }
              if$
            }
          if$
        }
      if$
      char.lang tmp.lang >
        { char.lang 'tmp.lang := }
        'skip$
      if$
    }
  while$
  tmp.lang
}

FUNCTION {check.entry.lang}
{ author field.or.null
  title field.or.null *
  get.str.lang
}

FUNCTION {set.entry.lang}
{ language empty$
    { check.entry.lang }
    { language "english" = language "american" = or language "british" = or
        { lang.en }
        { language "chinese" =
            { lang.zh }
            { language "japanese" =
                { lang.ja }
                { language "russian" =
                    { lang.ru }
                    { check.entry.lang }
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

FUNCTION {set.entry.numbered}
{ type$ "patent" =
  type$ "standard" = or
  type$ "techreport" = or
    { #1 'entry.numbered := }
    { #0 'entry.numbered := }
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
      nameptr max.num.authors >
        { bbl.et.al
          #1 'namesleft :=
        }
        { t "others" =
            { bbl.et.al }
            { t get.str.lang 'name.lang :=
              name.lang lang.en =
                { t #1 "{vv~}{ll}{~f{~}}" format.name$
                  uppercase.name
                    { "u" change.case$ }
                    'skip$
                  if$
                  t #1 "{, jj}" format.name$ *
                }
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
{ author empty$ not
    { author format.names }
    { "empty author in " cite$ * warning$
      bbl.anonymous
    }
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
      entry.lang lang.zh =
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
  label ")" *
  make.full.names duplicate$ short.list =
     { pop$ }
     { * }
  if$
  's :=
  s text.length$ 'charptr :=
    { charptr #0 > s charptr #1 substring$ "[" = not and }
    { charptr #1 - 'charptr := }
  while$
  charptr #0 >
    { "{" s * "}" * }
    { s }
  if$
  "]{" * write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {change.sentence.case}
{ entry.lang lang.en =
    { "t" change.case$ }
    'skip$
  if$
}

FUNCTION {add.link}
{ url empty$ not
    { "\href{" url * "}{" * swap$ * "}" * }
    { doi empty$ not
        { "\href{http://dx.doi.org/" doi * "}{" * swap$ * "}" * }
        'skip$
      if$
    }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title
      sentence.case.title
        'change.sentence.case
        'skip$
      if$
      entry.numbered number empty$ not and
        { bbl.colon * number * }
        'skip$
      if$
      link.title
        'add.link
        'skip$
      if$
    }
  if$
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
{ volume empty$ not
    { volume is.number
        { entry.lang lang.zh =
            { "第 " volume * " 卷" * }
            { "volume" volume tie.or.space.connect }
          if$
        }
        { volume }
      if$
    }
    { "" }
  if$
}

FUNCTION {format.number}
{ number empty$ not
    { number is.number
        { entry.lang lang.zh =
            { "第 " number * " 册" * }
            { "number" number tie.or.space.connect }
          if$
        }
        { number }
      if$
    }
    { "" }
  if$
}

FUNCTION {format.volume.number}
{ volume empty$ not
    { format.volume }
    { format.number }
  if$
}

FUNCTION {format.title.vol.num}
{ title
  sentence.case.title
    'change.sentence.case
    'skip$
  if$
  entry.numbered
    { number empty$ not
        { bbl.colon * number * }
        'skip$
      if$
    }
    { format.volume.number 's :=
      s empty$ not
        { bbl.colon * s * }
        'skip$
      if$
    }
  if$
}

FUNCTION {format.series.vol.num.title}
{ format.volume.number 's :=
  series empty$ not
    { series
      sentence.case.title
        'change.sentence.case
        'skip$
      if$
      entry.numbered
        { bbl.wide.space * }
        { bbl.colon *
          s empty$ not
            { s * bbl.wide.space * }
            'skip$
          if$
        }
      if$
      title *
      sentence.case.title
        'change.sentence.case
        'skip$
      if$
      entry.numbered number empty$ not and
        { bbl.colon * number * }
        'skip$
      if$
    }
    { format.title.vol.num }
  if$
  link.title
    'add.link
    'skip$
  if$
}

FUNCTION {format.booktitle.vol.num}
{ booktitle
  entry.numbered
    'skip$
    { format.volume.number 's :=
      s empty$ not
        { bbl.colon * s * }
        'skip$
      if$
    }
  if$
}

FUNCTION {format.series.vol.num.booktitle}
{ format.volume.number 's :=
  series empty$ not
    { series bbl.colon *
      entry.numbered not s empty$ not and
        { s * bbl.wide.space * }
        'skip$
      if$
      booktitle *
    }
    { format.booktitle.vol.num }
  if$
  in.booktitle
    { duplicate$ empty$ not entry.lang lang.en = and
        { "In: " swap$ * }
        'skip$
      if$
    }
    'skip$
  if$
}

FUNCTION {format.journal}
{ journal
  italic.jounal entry.lang lang.en = and
    'italicize
    'skip$
  if$
}

FUNCTION {set.entry.mark}
{ entry.mark empty$ not
    'pop$
    { mark empty$ not
        { pop$ mark 'entry.mark := }
        { 'entry.mark := }
      if$
    }
  if$
}

FUNCTION {format.mark}
{ show.mark
  type$ "phdthesis" = type$ "mastersthesis" = or type$ "patent" = or
  medium empty$ not or entry.is.electronic or
  and
    { medium empty$ not
        { entry.mark "/" * medium * 'entry.mark := }
        { entry.is.electronic
            { entry.mark "/OL" * 'entry.mark := }
            'skip$
          if$
        }
      if$
      " [" entry.mark * "]" *
    }
    { "" }
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
        { entry.lang lang.zh =
            { edition " 版" * }
            { edition num.to.ordinal " ed." * }
          if$
        }
        { entry.lang lang.en =
            { edition change.sentence.case 's :=
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

FUNCTION {format.address.publisher}
{ address empty$ not
    { address
      format.publisher empty$ not
        { bbl.colon * format.publisher * }
        { entry.is.electronic not show.missing.address.publisher and
            { bbl.colon * bbl.sine.nomine * }
            'skip$
          if$
        }
      if$
    }
    { entry.is.electronic not show.missing.address.publisher and
        { format.publisher empty$ not
            { bbl.sine.loco bbl.colon * format.publisher * }
            { bbl.sine.loco.sine.nomine }
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

FUNCTION {extract.before.dash}
{ duplicate$ empty$
    { pop$ "" }
    { 's :=
      #1 'charptr :=
      s text.length$ #1 + 'len :=
        { charptr len <
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
      s text.length$ #1 + 'len :=
        { charptr len <
          s charptr #1 substring$ "-" = not
          and
        }
        { charptr #1 + 'charptr := }
      while$
        { charptr len <
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
          urldate empty$ not
            { "[" urldate extract.before.dash * "]" * }
            { "" }
          if$
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
    { "\allowbreak(" date * ")" * }
    { "" }
  if$
}

FUNCTION {format.urldate}
{ urldate empty$ not entry.is.electronic and
    { "\allowbreak[" urldate * "]" * }
    { "" }
  if$
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

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages hyphenate }
  if$
}

FUNCTION {format.journal.volume}
{ volume empty$ not
    { bold.journal.volume
        { "\textbf{" volume * "}" * }
        { volume }
      if$
    }
    { "" }
  if$
}

FUNCTION {format.journal.number}
{ number empty$ not
    { "\penalty0 (" number * ")" * }
    { "" }
  if$
}

FUNCTION {format.journal.pages}
{ pages empty$
    { "" }
    { ":\penalty0 " pages hyphenate * }
  if$
}

FUNCTION {format.periodical.year.volume.number}
{ year empty$ not
    { year extract.before.dash }
    { "empty year in periodical " cite$ * warning$ }
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

FUNCTION {check.url}
{ url empty$ not
    { "\url{" url * "}" * 'entry.url :=
      #1 'entry.is.electronic :=
    }
    { howpublished empty$ not
        { howpublished #1 #5 substring$ "\url{" =
            { howpublished 'entry.url :=
              #1 'entry.is.electronic :=
            }
            'skip$
          if$
        }
        { note empty$ not
            { note #1 #5 substring$ "\url{" =
                { note 'entry.url :=
                  #1 'entry.is.electronic :=
                }
                'skip$
              if$
            }
            'skip$
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.url}
{ entry.url empty$ not
    { new.block entry.url }
    { "" }
  if$
}

FUNCTION {check.doi}
{ doi empty$ not
    { #1 'entry.is.electronic := }
    'skip$
  if$
}

FUNCTION {is.in.url}
{ 's :=
  s empty$
    { #1 }
    { entry.url empty$
        { #0 }
        { s text.length$ 'len :=
          entry.url text.length$ 'charptr :=
            { entry.url charptr len substring$ s = not
              charptr #0 >
              and
            }
            { charptr #1 - 'charptr := }
          while$
          charptr
        }
      if$
    }
  if$
}

FUNCTION {format.doi}
{ ""
  doi empty$ not show.doi and
    { "" 's :=
      doi 't :=
      #0 'numnames :=
        { t empty$ not}
        { t #1 #1 substring$ 'tmp.str :=
          tmp.str "," = tmp.str " " = or t #2 #1 substring$ empty$ or
            { t #2 #1 substring$ empty$
                { s tmp.str * 's := }
                'skip$
              if$
              s empty$ s is.in.url or
                'skip$
                { numnames #1 + 'numnames :=
                  numnames #1 >
                    { ", " * }
                    { "DOI: " * }
                  if$
                  "\doi{" s * "}" * *
                }
              if$
              "" 's :=
            }
            { s tmp.str * 's := }
          if$
          t #2 global.max$ substring$ 't :=
        }
      while$
      's :=
      s empty$ not
        { new.block s }
        { "" }
      if$
    }
    'skip$
  if$
}

FUNCTION {check.electronic}
{ "" 'entry.url :=
  #0 'entry.is.electronic :=
    'check.doi
    'skip$
  if$
    'check.url
    'skip$
  if$
  medium empty$ not
    { medium "MT" = medium "DK" = or medium "CD" = or medium "OL" = or
        { #1 'entry.is.electronic := }
        'skip$
      if$
    }
    'skip$
  if$
}

FUNCTION {format.note}
{ note empty$ not show.note and
    { note }
    { "" }
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

FUNCTION {monograph}
{ output.bibitem
  author empty$ not
    { format.authors }
    { editor empty$ not
        { format.editors }
        { "empty author and editor in " cite$ * warning$
          bbl.anonymous
        }
      if$
    }
  if$
  output
  period.between.author.year
    'new.sentence
    'skip$
  if$
  format.year "year" output.check
  new.block
  format.series.vol.num.title "title" output.check
  "M" set.entry.mark
  format.mark "" output.after
  new.block
  format.translators output
  new.sentence
  format.edition output
  new.block
  format.address.publisher output
  format.pages bbl.colon output.after
  format.urldate "" output.after
  format.url output
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors output
  author format.key output
  period.between.author.year
    'new.sentence
    'skip$
  if$
  format.year "year" output.check
  new.block
  format.title "title" output.check
  "M" set.entry.mark
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
  format.pages bbl.colon output.after
  format.urldate "" output.after
  format.url output
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {periodical}
{ output.bibitem
  format.authors output
  author format.key output
  period.between.author.year
    'new.sentence
    'skip$
  if$
  format.year "year" output.check
  new.block
  format.title "title" output.check
  "J" set.entry.mark
  format.mark "" output.after
  new.block
  format.periodical.year.volume.number output
  new.block
  format.address.publisher output
  format.urldate "" output.after
  format.url output
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {article}
{ output.bibitem
  format.authors output
  author format.key output
  period.between.author.year
    'new.sentence
    'skip$
  if$
  format.year "year" output.check
  new.block
  format.title "title" output.check
  "J" set.entry.mark
  format.mark "" output.after
  new.block
  format.journal "journal" output.check
  format.journal.volume output
  format.journal.number "" output.after
  format.journal.pages "" output.after
  format.urldate "" output.after
  format.url output
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {patent}
{ output.bibitem
  format.authors output
  author format.key output
  period.between.author.year
    'new.sentence
    'skip$
  if$
  format.year "year" output.check
  new.block
  format.title "title" output.check
  "P" set.entry.mark
  format.mark "" output.after
  new.block
  format.date "year" output.check
  format.urldate "" output.after
  format.url output
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {electronic}
{ #1 #1 check.electronic
  #1 'entry.is.electronic :=
  output.bibitem
  format.authors output
  author format.key output
  period.between.author.year
    'new.sentence
    'skip$
  if$
  format.year "year" output.check
  new.block
  format.series.vol.num.title "title" output.check
  "EB" set.entry.mark
  format.mark "" output.after
  new.block
  format.address.publisher output
  format.pages bbl.colon output.after
  format.editdate "" output.after
  format.urldate "" output.after
  format.url output
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {misc}
{ journal empty$ not
    'article
    { booktitle empty$ not
        'incollection
        { publisher empty$ not
            'monograph
            { entry.is.electronic
                'electronic
                { "Z" set.entry.mark
                  monograph
                }
              if$
            }
          if$
        }
      if$
    }
  if$
  empty.misc.check
}

FUNCTION {archive}
{ "A" set.entry.mark
  misc
}

FUNCTION {book} { monograph }

FUNCTION {booklet} { book }

FUNCTION {collection}
{ "G" set.entry.mark
  monograph
}

FUNCTION {database}
{ "DB" set.entry.mark
  electronic
}

FUNCTION {dataset}
{ "DS" set.entry.mark
  electronic
}

FUNCTION {inbook} { book }

FUNCTION {inproceedings}
{ "C" set.entry.mark
  incollection
}

FUNCTION {conference} { inproceedings }

FUNCTION {map}
{ "CM" set.entry.mark
  misc
}

FUNCTION {manual} { monograph }

FUNCTION {mastersthesis}
{ lang.zh entry.lang =
    { "硕士学位论文" }
    { "D" }
  if$
  set.entry.mark
  monograph
}

FUNCTION {newspaper}
{ "N" set.entry.mark
  article
}

FUNCTION {online}
{ "EB" set.entry.mark
  electronic
}

FUNCTION {phdthesis}
{ lang.zh entry.lang =
    { "博士学位论文" }
    { "D" }
  if$
  set.entry.mark
  monograph
}

FUNCTION {proceedings}
{ "C" set.entry.mark
  monograph
}

FUNCTION {software}
{ "CP" set.entry.mark
  electronic
}

FUNCTION {standard}
{ "S" set.entry.mark
  misc
}

FUNCTION {techreport}
{ "R" set.entry.mark
  misc
}

FUNCTION {unpublished}
{ "Z" set.entry.mark
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

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

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
    { bbl.space * citation.et.al * }
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
    { lang.zh.order }
    { entry.lang lang.ja =
        { lang.ja.order }
        { entry.lang lang.en =
            { lang.en.order }
            { entry.lang lang.ru =
                { lang.ru.order }
                { lang.other.order }
              if$
            }
          if$
        }
      if$
    }
  if$
  int.to.chr$
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

FUNCTION {anonymous.sort}
{ entry.lang lang.zh =
    { "yi4 ming2" }
    { "anon" }
  if$
}

FUNCTION {warn.empty.key}
{ entry.lang lang.zh =
    { "empty key in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {author.sort}
{ key empty$
    { warn.empty.key
      author empty$
        { anonymous.sort }
        { author sort.format.names }
      if$
    }
    { key sortify }
  if$
}

FUNCTION {author.editor.sort}
{ key empty$
    { warn.empty.key
      author empty$
        { editor empty$
            { anonymous.sort }
            { editor sort.format.names }
          if$
        }
        { author sort.format.names }
      if$
    }
    { key sortify }
  if$
}

FUNCTION {author.organization.sort}
{ key empty$
    { warn.empty.key
      author empty$
        { organization empty$
            { anonymous.sort }
            { "The " #4 organization chop.word sortify }
          if$
        }
        { author sort.format.names }
      if$
    }
    { key sortify }
  if$
}

FUNCTION {editor.organization.sort}
{ key empty$
    { warn.empty.key
      editor empty$
        { organization empty$
            { anonymous.sort }
            { "The " #4 organization chop.word sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { key sortify }
  if$
}

FUNCTION {presort}
{ set.entry.lang
  set.entry.numbered
  show.url show.doi check.electronic
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

FUNCTION {bib.sort.order}
{ sort.label  'sort.key$ :=
}

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
  "\expandafter\ifx\csname urlstyle\endcsname\relax\relax\else"
  write$ newline$
  "  \urlstyle{same}\fi"
  write$ newline$
  show.doi
    { "\providecommand{\href}[2]{\url{#2}}"
      write$ newline$
      "\providecommand{\doi}[1]{\href{https://doi.org/#1}{#1}}"
      write$ newline$
    }
    'skip$
  if$
}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

READ

EXECUTE {init.state.consts}

EXECUTE {load.config}

ITERATE {presort}

SORT

EXECUTE {initialize.longest.label}

ITERATE {forward.pass}

REVERSE {reverse.pass}

ITERATE {bib.sort.order}

SORT

EXECUTE {begin.bib}

ITERATE {call.type$}

EXECUTE {end.bib}
