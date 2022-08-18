% Applied Probability Trust bibliography style (28-Apr-97 version)
% Written by Stephen Webb
%
% This is a curious mixture of acm.bst and apalike.bst
% For journals the format is:
% {\sc Last, initials} (year). Paper title. {\em Journal\/} {\bf vol,}
% first--last_pages.
%
% For books the format is similar:
% {\sc Last, initials} (year). {\em Book title.\/} Publisher, Address.


ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
  }
  {}
  { label }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
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
            { add.period$ " " * write$ }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output.nonnull2}
{ 's :=
  output.state mid.sentence =
    { " " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
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
    'output.nonnull2
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
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

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "{\em " swap$ * "}" * }
  if$
}

FUNCTION {emphasizeic}
{ duplicate$ empty$
    { pop$ "" }
    { "{\em " swap$ * "\/}" * }
  if$
}

FUNCTION {scapify}
{ duplicate$ empty$
    { pop$ "" }
    { "{\sc " swap$ * "}" * }
  if$
}

FUNCTION {boldify}
{ duplicate$ empty$
    { pop$ "" }
    { "{\bf " swap$ * ",}" * }
  if$
}

INTEGERS { nameptr namesleft numnames }

FUNCTION {output.year.check}
{ year empty$
    { "empty year in " cite$ * warning$ }
    { write$
      " (" year * ")" *
      mid.sentence 'output.state :=
    }
  if$
}

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv~}{ll}{, jj}{, f.}" format.name$ 't :=
      nameptr #1 >
        { namesleft #1 >
            { ", " * t * }
            { t "others" =
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

% For names inside entries (e.g., editors of an "In ...");
% this is exactly ABBRV.BST's `format.names' function.
FUNCTION {format.innames}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{f.~}{vv~}{ll}{, jj}" format.name$ 't :=
      nameptr #1 >
        { namesleft #1 >
            { ", " * t * }
            { numnames #2 >
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

FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names scapify }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.names scapify
      editor num.names$ #1 >
        { ", Eds." * }
        { ", Ed." * }
      if$
    }
  if$
}

FUNCTION {format.ineditors}
{
editor empty$
    { "" }
    {
      editor num.names$ #1 >
        { " ed." * }
        { " ed." * }
      if$
     editor format.innames
    }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$ }
  if$
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
                { "-" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {format.date}
{ year empty$
    { month empty$
        { "" }
        { "there's a month but no year in " cite$ * warning$
          month
        }
      if$
    }
    { month empty$
        'year
        { month " " * year * }
      if$
    }
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

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { "vol.~" volume *
      series empty$
        'skip$
        { " of " * series emphasize * }
      if$
      "volume and number" number either.or.check
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        { series field.or.null }
        { output.state mid.sentence =
            { "no.~" }
            { "No.~" }
          if$
          number *
          series empty$
            { "there's a number but no series in " cite$ * warning$ }
            { " in " * series * }
          if$
        }
      if$
    }
    { "" }
  if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
        { edition "l" change.case$ "~ed." * }
        { edition "t" change.case$ "~ed." * }
      if$
    }
  if$
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages n.dashify }
  if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.pp.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
        { "pp.~" pages n.dashify * }
        { "p.~" pages * }
      if$
    }
  if$
}

FUNCTION {format.journal}
{ journal empty$
    { "empty journal in " cite$ * warning$
      ""
    }
    { journal emphasizeic
    }
  if$
}

FUNCTION {format.vol}
{ volume boldify field.or.null
}


FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pp.pages
    { type empty$
        { "ch.~" chapter * }
        { type "l" change.case$ chapter tie.or.space.connect }
      if$
      pages empty$
        'skip$
        { ", " * format.pp.pages * }
      if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { "In " booktitle emphasize *
      editor empty$
        'skip$
        { ", " * format.ineditors * }
      if$
    }
  if$
}

FUNCTION {format.in.proc}
{ booktitle empty$
    { "" }
    { "In " booktitle emphasize * "." * }
  if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { "Technical report" emphasize}
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

FUNCTION {format.article.crossref}
{ key empty$
    { journal empty$
        { "need key or journal for " cite$ * " to crossref " * crossref *
          warning$
          ""
        }
        { "In {\em " journal * "\/}" * }
      if$
    }
    { "In " key * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.crossref.editor}
{ editor #1 "{vv~}{ll}" format.name$
  editor num.names$ duplicate$
  #2 >
    { pop$ " et~al." * }
    { #2 <
        'skip$
        { editor #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
            { " et~al." * }
            { " and " * editor #2 "{vv~}{ll}" format.name$ * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      "In "
    }
    { "Vol.~" volume *
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
            { "{\em " * series * "\/}" * }
          if$
        }
        { key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
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
            { "In {\em " booktitle * "\/}" * }
          if$
        }
        { "In " key * }
      if$
    }
    { "In " format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  new.block
  output.year.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { format.journal output
      format.vol output
      format.pages output
    }
    { format.article.crossref output.nonnull
      format.pp.pages output
    }
  if$
  new.block
  note output
  fin.entry
}


FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  output.year.check
  new.block
  format.btitle "title" output.check
  format.edition output
  crossref missing$
    { format.bvolume output
      new.block
      format.number.series output
      new.sentence
      publisher output
      address "address" output.check
    }
    { new.block
      format.book.crossref output.nonnull
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  output.year.check
  new.block
  format.btitle "title" output.check
  format.edition output
  crossref missing$
    { format.bvolume output
      new.block
      format.number.series output
      new.sentence
      publisher output
      address "address" output.check
      new.block
    }
    { new.block
      format.book.crossref output.nonnull
    }
  if$
  format.chapter.pages "chapter and pages" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  new.block
  output.year.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
%    { format.in.ed.booktitle "booktitle" output.check
     { format.in.proc "booktitle" output.check
       format.ineditors output
       new.block
      format.edition output
      format.bvolume output
      format.number.series output
      new.sentence
      publisher output
      address "address" output.check
    }
    { format.incoll.inproc.crossref output.nonnull }
  if$
  format.chapter.pages output
  new.block
  note output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  new.block
  output.year.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { format.in.proc "booktitle" output.check
      format.ineditors output
      new.block
      format.bvolume output
      format.number.series output
      organization output
      new.block
      publisher output
      address "address" output.check
    }
    { format.incoll.inproc.crossref output.nonnull }
  if$
  new.block
  format.pp.pages output
  new.block
  note output
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization scapify output }
    { format.authors output.nonnull }
  if$
  new.block
  output.year.check
  new.block
  format.btitle "title" output.check
  format.edition output
  author empty$
    { address new.block.checka }
    { organization address new.block.checkb
      organization output
    }
  if$
  address output
  new.block
  note output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  output.year.check
  new.block
  format.title "title" output.check
  new.block
  "Master's thesis" emphasize output.nonnull
  new.block
  school "school" output.check
  address output
  new.block
  note output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  title howpublished new.block.checkb
  format.title output
  howpublished new.block.checka
  howpublished output
  format.date output
  new.block
  note output
  fin.entry
  empty.misc.check
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  output.year.check
  new.block
  format.title "title" output.check
  new.block
  "PhD thesis" emphasize output.nonnull
  new.block
  school "school" output.check
  address output
  new.block
  note output
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  new.block
  output.year.check
  new.block
  format.title "title" output.check
  new.block
  format.tr.number output.nonnull
  new.block
  institution "institution" output.check
  address output
  new.block
  note output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  new.block
  output.year.check
  new.block
  format.title "title" output.check
  new.block
  note "note" output.check
  fin.entry
}

FUNCTION {default.type} { misc }

MACRO {jan} {"Jan."}

MACRO {feb} {"Feb."}

MACRO {mar} {"Mar."}

MACRO {apr} {"Apr."}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"Aug."}

MACRO {sep} {"Sept."}

MACRO {oct} {"Oct."}

MACRO {nov} {"Nov."}

MACRO {dec} {"Dec."}

MACRO {AAP}  {"Adv. Appl. Prob."}
MACRO {ADM}  {"Ann. Discrete Math."}
MACRO {AM}  {"Acta Math."}
MACRO {AMM}  {"Amer. Math. Monthly"}
MACRO {AMS}  {"Ann. Math. Statist."}
MACRO {AP}  {"Ann. Prob."}
MACRO {AS}  {"Amer. Statistician"}
MACRO {APS}  {"Appl. Statist."}
MACRO {ANS}  {"Ann. Statist."}
MACRO {ASM}  {"Acta Sci. Math."}

MACRO {B}  {"Biometrika"}
MACRO {BAMS}  {"Bull. Amer. Math. Soc."}
MACRO {BIMA}  {"Bull. Inst. Math. Appl."}

MACRO {CB}  {"Computer Bull."}
MACRO {CJ}  {"Computer J."}
MACRO {CCERO}   {"Cahiers Centre Etudes Rech. Op\'erat."}
MACRO {CJS}  {"Canad. J. Statist."}
MACRO {CMA}  {"Computers Math. Appl."}
MACRO {CMP}  {"Commun. Math. Phys."}
MACRO {CPAM}  {"Commun. Pure Appl. Math."}
MACRO {CS}  {"Commun. Statist."}
MACRO {CRA}  {"C. R. Acad. Sci. Paris"}

MACRO {DE}  {"Differential Equns"}
MACRO {DMJ}  {"Duke Math. J."}

MACRO {E}  {"Econometrica"}

MACRO {IETAC}   {"IEEE Trans. Automatic Control"}
MACRO {IETC}  {"IEEE Trans. Commun."}
MACRO {IETIT}   {"IEEE Trans. Inf. Theory"}
MACRO {IETR}  {"IEEE Trans. Rel."}
MACRO {IJC}  {"Int. J. Control"}
MACRO {IJGT}    {"Int. J. Game Theory"}
MACRO {IJM}  {"Israel J. Math."}

MACRO {JASA}  {"J. Amer. Statist. Soc."}
MACRO {JAM}  {"J. Appl. Mech."}
MACRO {JAMS}  {"J. Austral. Math. Soc."}
MACRO {JAP}  {"J. Appl. Prob."}
MACRO {JDE}  {"J. Differential Equns"}
MACRO {JET}  {"J. Econom. Theory"}
MACRO {JIMA}  {"J. Inst. Math. Appl."}
MACRO {JISA}  {"J. Indian Statist. Assoc."}
MACRO {JLMS}  {"J. London Math. Soc."}
MACRO {JMA}  {"J. Multivariate Anal."}
MACRO {JMAA}  {"J. Math. Anal. Appl."}
MACRO {JMB}  {"J. Math. Biol."}
MACRO {JMP}  {"J. Math. Phys."}
MACRO {JOTA}  {"J. Optimization Theory Appl."}
MACRO {JPE}  {"J. Political Econ."}
MACRO {JRSS}  {"J. R. Statist. Soc."}
MACRO {JS}  {"J. SIAM"}
MACRO {JSCS}  {"J. Statist. Comput. Simulation"}
MACRO {JSR}  {"J. Statist. Res."}
MACRO {JTB}  {"J. Theoret. Biol."}
MACRO {JTSA}    {"J. Time Series Anal."}

MACRO {MAMS}  {"Mem. Amer. Math. Soc."}
MACRO {MB}  {"Math. Biosci."}
MACRO {MC}  {"Math. Comput."}
MACRO {MF}  {"Math. Finance"}
MACRO {MN}  {"Math. Nachr."}
MACRO {MOR}  {"Math. Operat. Res."}
MACRO {MS}  {"Management Sci."}

MACRO {NMJ}  {"Nagoya Math. J."}
MACRO {N}  {"Nature"}
MACRO {NRLQ}  {"Naval Res. Logistics Quart."}

MACRO {OR}  {"Operat. Res."}
MACRO {ORQ}  {"Operat. Res. Quart."}

MACRO {PTRF}  {"Prob. Theory Relat. Fields"}
MACRO {PTRS}  {"Phil. Trans. R. Soc."}
MACRO {PAMS}  {"Proc. Amer. Math. Soc."}
MACRO {PCPS}  {"Proc. Camb. Phil. Soc."}
MACRO {PLMS}  {"Proc. London Math. Soc."}
MACRO {PNAS}  {"Proc. Nat. Acad. Sci. USA"}
MACRO {PRS}  {"Proc. R. Soc."}

MACRO {QAM}  {"Quart. Appl. Math."}
MACRO {QS}  {"Queueing Systems"}

MACRO {RES}  {"Rev. Econom. Stud."}
MACRO {RISI}  {"Rev. Internat. Statist. Inst."}
MACRO {RSA}  {"Rev. Statist. Appl."}

MACRO {SA}  {"Sankhy\=a"}
MACRO {SJAM}  {"SIAM J. Appl. Math."}
MACRO {SJMA}  {"SIAM J. Math. Anal."}
MACRO {SN}  {"Statist. Neerlandica"}
MACRO {SPA}  {"Stoch. Process. Appl."}
MACRO {SR}  {"SIAM Rev."}

MACRO {TAMS}  {"Trans. Amer. Math. Soc."}
MACRO {TPA}  {"Theory Prob. Appl."}
MACRO {TPB}  {"Theoret. Pop. Biol."}

MACRO {ZW}  {"Z. Wahrscheinlichkeitsth."}

READ

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

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
        { "   " * }
        'skip$
      if$
      s nameptr "{vv{ } }{ll{ }}{  f{ }}{  jj{ }}" format.name$ 't :=
      nameptr numnames = t "others" = and
        { "et al" * }
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

FUNCTION {author.sort}
{ author empty$
    { key empty$
        { "to sort, need author or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
        { key empty$
            { "to sort, need author, editor, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
        { key empty$
            { "to sort, need author, organization, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
        { key empty$
            { "to sort, need editor, organization, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {presort}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
        'editor.organization.sort
        { type$ "manual" =
            'author.organization.sort
            'author.sort
          if$
        }
      if$
    }
  if$
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}

SORT

STRINGS { longest.label }

INTEGERS { number.label longest.label.width }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}

FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}

EXECUTE {initialize.longest.label}

ITERATE {longest.label.pass}

FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
 "\begin{thebibliography}{"  longest.label  * "}" * write$ newline$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
