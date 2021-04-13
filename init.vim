let g:polyglot_disabled = ['autoindent']
set encoding=UTF-8
set shiftwidth=4
set expandtab
set exrc
set nu
set relativenumber
set hidden
set noerrorbells
set nowrap 
set smartcase
set noswapfile
set nobackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set scrolloff=15
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set nohlsearch
set cmdheight=1
set updatetime=50
set shortmess+=c
set colorcolumn=80
set laststatus=2
set maxmempattern=2000000

"Plugins 
call plug#begin(stdpath('data').'/plugged')

"FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
"COC.VIM
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Vim Fugitive
Plug 'https://github.com/tpope/vim-fugitive'
"NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Vim matchit
Plug 'https://github.com/adelarsq/vim-matchit'
" Lightline
Plug 'itchyny/lightline.vim'
"Rainbows
Plug 'frazrepo/vim-rainbow'
"Vim-Polyglot
Plug 'sheerun/vim-polyglot'
"Autoclose tag
Plug 'alvan/vim-closetag'
"Tmux-Vim
Plug 'christoomey/vim-tmux-navigator'
"Better comments
Plug 'jbgutierrez/vim-better-comments'
"NerdCommenter
Plug 'scrooloose/nerdcommenter'
"Vim colors
Plug 'ap/vim-css-color'
"File line
Plug 'bogado/file-line'
"Git messenger
Plug 'rhysd/git-messenger.vim'
"Gruvbox theme
"Plug 'morhetz/gruvbox'
"Vim.sorround
Plug 'tpope/vim-surround'
"Restore folding
Plug 'vim-scripts/restore_view.vim'
"Startify
Plug 'mhinz/vim-startify'
"Smoothie
Plug 'psliwka/vim-smoothie'
"Gitgutter
Plug 'airblade/vim-gitgutter'
"One Colors
Plug 'kirbycool/one-colors.vim'
call plug#end()

"Custom remaps
inoremap jj <Esc>
"EndCustom remaps

"Mapping leader
let mapleader = " " 
"EndMapping leader

nnoremap , :Git<CR>
nnoremap <leader>df :vertical Gdiffsplit<CR>
nnoremap <leader>gp :G push<CR>
nnoremap <Tab> :tabn<CR>
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <leader>t :split term://zsh<CR>
tnoremap <leader>t clear<Enter>exit<Enter><CR>
nnoremap k kzz
nnoremap j jzz

"Theme config
"colorscheme gruvbox
colorscheme onedark
"EndTheme config 

"COC configuration
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"COC extensions 
let g:coc_global_extensions = [
            \'coc-css',
            \'coc-pairs',
            \'coc-emmet',
            \'coc-eslint',
            \'coc-html',
            \'coc-json',
            \'coc-html-css-support',
            \'coc-prettier',
            \'coc-tsserver']

"NERDTree config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap ; :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"EndNERDTree config 

"Rainbows 
let g:rainbow_active = 1
"End Rainbows

"FZF config
nnoremap <C-p> :GFiles<CR>
nnoremap <leader><C-p> :Buffers<CR>
"FZF config

"Autoclose tag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.jsx, *.tsx,*.js'
let g:closetag_close_shortcut = '<leader>>'
let g:closetag_shortcut = '>'

"NERDTree config
let g:NERDTreeIgnore = ['^node_modules$']

"NERD commenter 
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

"Lightline
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \'%{fugitive#statusline()}'
      \'component_function': {
      \'gitbranch' : 'FugitiveHead'
      \},
      \}
"Coc-pairs 
 inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"Fold.vim
set viewoptions=cursor,folds,slash,unix
set foldmethod=indent
" let g:skipview_files = ['*\.vim']
        if has('termguicolors')
          set termguicolors
        endif

