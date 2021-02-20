if exists("b:current_syntax")
  finish
endif

syn cluster agitLogFields contains=agitDate,agitAuthor,agitHash
syn cluster agitRefs contains=agitHead,agitBranch,agitRemote,agitTag

syn match agitLog /.*/ contained contains=@agitLogFields,agitRef

syn match agitTreeEdge9 /_\?\(|\|-\(-\|\.\)\|\/|\?\|\\\|\*\|+\|=\)\s\?/ nextgroup=agitTreeEdge0,agitRef,agitLog skipwhite
syn match agitTreeEdge8 /_\?\(|\|-\(-\|\.\)\|\/|\?\|\\\|\*\|+\|=\)\s\?/ nextgroup=agitTreeEdge9,agitRef,agitLog skipwhite
syn match agitTreeEdge7 /_\?\(|\|-\(-\|\.\)\|\/|\?\|\\\|\*\|+\|=\)\s\?/ nextgroup=agitTreeEdge8,agitRef,agitLog skipwhite
syn match agitTreeEdge6 /_\?\(|\|-\(-\|\.\)\|\/|\?\|\\\|\*\|+\|=\)\s\?/ nextgroup=agitTreeEdge7,agitRef,agitLog skipwhite
syn match agitTreeEdge5 /_\?\(|\|-\(-\|\.\)\|\/|\?\|\\\|\*\|+\|=\)\s\?/ nextgroup=agitTreeEdge6,agitRef,agitLog skipwhite
syn match agitTreeEdge4 /_\?\(|\|-\(-\|\.\)\|\/|\?\|\\\|\*\|+\|=\)\s\?/ nextgroup=agitTreeEdge5,agitRef,agitLog skipwhite
syn match agitTreeEdge3 /_\?\(|\|-\(-\|\.\)\|\/|\?\|\\\|\*\|+\|=\)\s\?/ nextgroup=agitTreeEdge4,agitRef,agitLog skipwhite
syn match agitTreeEdge2 /_\?\(|\|-\(-\|\.\)\|\/|\?\|\\\|\*\|+\|=\)\s\?/ nextgroup=agitTreeEdge3,agitRef,agitLog skipwhite
syn match agitTreeEdge1 /_\?\(|\|-\(-\|\.\)\|\/|\?\|\\\|\*\|+\|=\)\s\?/ nextgroup=agitTreeEdge2,agitRef,agitLog skipwhite
syn match agitTreeEdge0 /_\?\(|\|-\(-\|\.\)\|\/|\?\|\\\|\*\|+\|=\)\s\?/ nextgroup=agitTreeEdge1,agitRef,agitLog skipwhite
syn match agitTreeEdgeH /_/ contained containedin=agitTreeEdge0,agitTreeEdge1,agitTreeEdge2,agitTreeEdge3,agitTreeEdge4,agitTreeEdge5,agitTreeEdge6,agitTreeEdge7,agitTreeEdge8,agitTreeEdge9
" syn match agitTreeEdgeUnmerged /[^\\|/*]\+\n[^^]\+\zs\*/ contained containedin=agitTreeEdge0,agitTreeEdge1,agitTreeEdge2,agitTreeEdge3,agitTreeEdge4,agitTreeEdge5,agitTreeEdge6,agitTreeEdge7,agitTreeEdge8,agitTreeEdge9

syn match agitLogEllipsis /\.\{3}/ contained containedin=agitLog
syn region agitRef matchgroup=agitRefDelimiter start=" \zs(" end=")\ze " matchgroup=agitLogEllipsis end="\.\.\." contained contains=@agitRefs nextgroup=agitLog keepend oneline
syn keyword agitHead HEAD contained
syn match agitRemote /r:[^, :)]\+/ contained
syn match agitTag /t:[^, :)]\+/ contained
syn match agitDate /|>[a-zA-Z0-9, ]\+<|/ contained contains=agitDateMark
syn match agitAuthor /{>[^}]\+<}/ contained contains=agitAuthorMark
syn match agitHash  /\[\x\{7,\}]/ contained conceal

syn match agitDateMark /|>/ contained conceal
syn match agitDateMark /<|/ contained conceal
syn match agitAuthorMark /{>/ contained conceal
syn match agitAuthorMark /<}/ contained conceal

hi def link agitTreeEdge0 Constant
if &background ==# 'dark'
  hi def agitTreeEdge1 ctermfg=magenta     guifg=green1
  hi def agitTreeEdge2 ctermfg=green       guifg=yellow1
  hi def agitTreeEdge3 ctermfg=yellow      guifg=orange1
  hi def agitTreeEdge4 ctermfg=cyan        guifg=greenyellow
  hi def agitTreeEdge5 ctermfg=red         guifg=springgreen1
  hi def agitTreeEdge6 ctermfg=yellow      guifg=cyan1
  hi def agitTreeEdge7 ctermfg=green       guifg=slateblue1
  hi def agitTreeEdge8 ctermfg=cyan        guifg=magenta1
  hi def agitTreeEdge9 ctermfg=magenta     guifg=purple1
else
  hi def agitTreeEdge1 ctermfg=darkyellow  guifg=orangered3
  hi def agitTreeEdge2 ctermfg=darkgreen   guifg=orange2
  hi def agitTreeEdge3 ctermfg=blue        guifg=yellow3
  hi def agitTreeEdge4 ctermfg=darkmagenta guifg=olivedrab4
  hi def agitTreeEdge5 ctermfg=red         guifg=green4
  hi def agitTreeEdge6 ctermfg=darkyellow  guifg=paleturquoise3
  hi def agitTreeEdge7 ctermfg=darkgreen   guifg=deepskyblue4
  hi def agitTreeEdge8 ctermfg=blue        guifg=darkslateblue
  hi def agitTreeEdge9 ctermfg=darkmagenta guifg=darkviolet
endif

hi def link agitTreeEdgeUnmerged ErrorMsg
hi def link agitLog Normal
hi def link agitLogEllipsis agitLog
hi def link agitHead Special
hi def link agitRef Directory
hi def link agitRefDelimiter agitRef
hi def link agitRemote Statement
hi def link agitTag String
hi def link agitDate Statement
hi def link agitAuthor Type
hi def link agitHash Ignore
hi def link agitDateMark Ignore
hi def link agitAuthorMark Ignore

let b:current_syntax = "agit"
