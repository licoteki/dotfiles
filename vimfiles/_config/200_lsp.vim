let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_echo_cursor = 0
let g:lsp_diagnostics_float_cursor = 1

let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 100

let g:lsp_diagnostics_signs_enabled = 1
let lsp_diagnostics_signs_error = {"text": "E>"}
let lsp_diagnostics_signs_warning = {"text": "W>"}
let lsp_diagnostics_signs_information = {"text": "I>"}
let lsp_diagnostics_signs_hint = {"text": "H>"}

if empty(globpath(&rtp, 'autoload/lsp.vim'))
  finish
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')


if executable('rustup')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rust-analyzer',
	      \ 'cmd': {server_info->['rust-analyzer']},
        \ 'allowlist': ['rust'],
        \ })
endif

if executable('haskell-language-server-wrapper')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'haskell-language-server',
      \ 'cmd': {server_info->['haskell-language-server-wrapper', '--lsp']},
      \ 'whitelist': ['haskell'],
      \ })
endif
