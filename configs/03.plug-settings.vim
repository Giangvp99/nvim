""""""""""""""""""""""""""""""""""""""""
""""""""""""""NERDTree""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""
map <C-b> :NERDTreeToggle<CR>                               
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nmap <C-r> :NERDTreeFocus<cr>R<C-w><C-p>

"""""""""""""NERDTree-git"""""""""""""""
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

""""""""""""""""""""""""""""""""""""""""
""""""""""""""""Theme"""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
highlight Normal ctermbg=None
colorscheme monokai
set termguicolors



"""""""""""""""""""""""""""""""""""""""
""""""""""""lightline""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch','gitdiff', 'readonly', 'filename', 'modified' ], 
	  \				[  ] ]
      \ },
	  \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': [[ 'exit' ]],
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename', 'gitversion' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \   'gitdiff': 'lightline#gitdiff#get',
	  \ },
      \ 'component_type': {
      \   'buffers': 'tabsel', 
	  \	  'gitdiff': 'middle', 
	  \ },
      \ }
let g:lightline#gitdiff#indicator_added = '+'
let g:lightline#gitdiff#indicator_deleted = '-'
let g:lightline#gitdiff#indicator_modified = '~'
let g:lightline#gitdiff#separator = ' '


"""""""""""""""""""""""""""""""""""""""
""""""""""""""Prettier"""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
let g:prettier#config#tab_width = 2
"""""""""""""""""""""""""""""""""""""""
""""""""""Syntastic""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



"""""""""""""""""""""""""""""""""""""""
"""""""""""""Tagbar""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>



"""""""""""""""""""""""""""""""""""""""
"""""""""""""""Coc.nvim""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
			\ 'coc-snippets',
			\ 'coc-tsserver',
			\ 'coc-eslint',
			\ 'coc-prettier',
			\ 'coc-json',
			\ 'coc-css',
			\ 'coc-html'
			\]

set hidden
set updatetime=300
set signcolumn=yes
set shortmess+=c

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col-1] =~# '\s'
endfunction

"use <c-space> for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <NUL> coc#refresh()

"use <tab> and <s-tab> to navigate the completion list
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"use <cr> to confim completion
if has('patch8.1.1068')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
inoremap <expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)




"""""""""""""""""""""""""""""""""""""""
"""""""""""""OmniSharp"""""""""""""""""

let g:OmniSharp_server_stdio = 1



"""""""""""""""""""""""""""""""""""""""
""""""""""""""""""FZF""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
nnoremap <C-f> :Files<CR>
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-s': 'split',
			\ 'ctrl-v': 'vsplit'
			\ }
command! -bang -nargs=* Rg
			\ call fzf#vim#grep(
			\   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
			\   fzf#vim#with_preview(), <bang>0)




"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""Ale'""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_fixers = {
			\ '*' :['remove_trailing_lines', 'trim_whitespace'],
			\ 'javascript':['eslint'],
			\ }
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {
			\ 'html': ['prettier'],
			\ 'css': ['stylelint'],
			\}
let g:ale_linters = {
			\ 'html': ['htmlhint'],
			\ 'css': ['stylelint'],
			\ 'javascript': ['eslint'],
			\}
let g:ale_linters_explicit = 1



"""""""""""""""""""""""""""""""""""""""
""""""""""""rainbow""""""""""""""""""""

let g:rainbow_active = 1




"""""""""""""""""""""""""""""""""""""""
"""""""""""""""emmet"""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
let g:user_emmet_leader_key=','



""""""""""""""""""""""""""""""""""""""""
"""""""""""""""Signify""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""
" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_change            = '~'
let g:signify_sign_delete_first_line = '‾'

let g:signify_vcs_list               = [ 'git' ]
let g:signify_cursorhold_insert      = 0
let g:signify_cursorhold_normal      = 0
let g:signify_update_on_bufenter     = 0
let g:signify_update_on_focusgained  = 0
let g:signify_sign_show_count        = 0
let g:signify_sign_show_text = 1
" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)




""""""""""""""""""""""""""""""""""""""""
"""""""""""""Javascript"""""""""""""""""
""""""""""""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1
