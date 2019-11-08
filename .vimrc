" ~/.vimrc (configuration file for vim only)
" skeletons
function! SKEL_spec()
	0r /usr/share/vim/current/skeletons/skeleton.spec
	language time en_US
	let login = system('whoami')
	if v:shell_error
	   let login = 'unknown'
	else
	   let newline = stridx(login, "\n")
	   if newline != -1
		let login = strpart(login, 0, newline)
	   endif
	endif
	let hostname = system('hostname -f')
	if v:shell_error
	    let hostname = 'localhost'
	else
	    let newline = stridx(hostname, "\n")
	    if newline != -1
		let hostname = strpart(hostname, 0, newline)
	    endif
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
endfunction
" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif
autocmd BufNewFile	*.spec	call SKEL_spec()
autocmd BufNewFile,BufRead *.md setlocal textwidth=80
autocmd BufNewFile,BufRead *.rst setlocal textwidth=80
nnoremap ; :
nnoremap <F5> :buffers<CR>:buffer<Space>
set ignorecase
set smartcase
set hlsearch
set incsearch
syn match fortranComment excludenl "^[!c*].*$" contains=@fortranCommentGroup,@spell
syn match fortranComment excludenl "!.*$" contains=@fortranCommentGroup,@spell
let fortran_free_source=1
let fortran_have_tabs=1
filetype plugin indent on
if has('syntax') && (&t_Co > 2)
  syntax enable
endif
filetype on
colorscheme desert
set background=dark
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
"set smartindent
set number
set pastetoggle=<F10>
" ~/.vimrc ends here
