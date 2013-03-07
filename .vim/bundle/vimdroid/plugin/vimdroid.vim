" ============================================================================
" VIMDroid global plugin
" Description: vim android mode
" Maintainer:  Vrygoud <vrygoud at gmail dot com>
" Version:     1.0
" Last Change: Thu Oct 25 14:14:49 CEST 2012
" License:	   This file is placed in the public domain.
" ============================================================================


" Section: Script init {{{1
" ===========================================================================

" Allow the user to disable the plugin & prevent multiple loads
if exists("g:loaded_vimdroid")
    finish
endif
if v:version < 700
    echoerr "VIMDroid: this plugin requires vim >= 7"
    finish
endif
let g:loaded_vimdroid = 1

"Look for AndroidManifest.xml file in current and parents directories
let s:projectManifest = findfile("AndroidManifest.xml", ".;")
if empty(s:projectManifest)
  finish
endif
let s:projectRoot = substitute(s:projectManifest, "AndroidManifest.xml", "", "")

" Fix JAVA path on Windows system
if has("win16") || has("win32") || has("win64")
  if empty($JAVA_HOME)
    echo "VIMDroid: You need to set the $JAVA_HOME variable to you Java installation path"
  elseif $JAVA_HOME =~# "Program Files"
    let $JAVA_HOME = substitute($JAVA_HOME, "Program Files", "Progra~1", "")
  endif
endif


" Section: Variables initialization {{{1
" ===========================================================================

" Initialise a given variable to a given value. The variable is only 
" initialised if it does not exist prior.
function s:InitVariable(var, value)
    if !exists(a:var)
        execute 'let ' . a:var . ' = ' . "'" . a:value . "'"
    endif
endfunction

call s:InitVariable("g:VIMDroidCreateDefaultMappings", 1)
call s:InitVariable("g:VIMDroidCreateMenuEntry", 1)


" Section: Functions definitions {{{1
" ===========================================================================

function s:ProjectUpdate()
"Get APK name from build.xml file"
->
endfunction

function s:BuildDebug()
"In debug mode, the build tools automatically sign your application
"with a debug key and optimize the package with zipalign
  execute "!ant -buildfile " . s:projectRoot . "build.xml" . " debug"
endfunction

function s:BuildReleaseUnsigned()
  !ant -buildfile s:projectDir . "build.xml" release
  echo "Done. You know need to manually sign and align the package."
endfunction

function s:InstallDebug()
"Get APK name from build.xml file"
->
endfunction

function s:RunDevice()
  !adb -d -r install s:GetAPKPath()
endfunction


" Section: Create mapping & menu items {{{1
" ===========================================================================

" Create menu items for the specified modes.  If a:combo is not empty, then
" also define mappings and show a:combo in the menu items.
" Thanks NERDCommenter plugin
function! s:CreateMaps(target, desc, combo)

  "Internal mapping
  let plug = '<Plug>VIMDroid' . a:target
  execute 'noremap <unique> <script> ' . plug . ' :call <SID>' . a:target . '()<CR>'

  " Setup default combo
  if strlen(a:combo) && !exists("no_plugin_maps") && g:VIMDroidCreateDefaultMappings
    if !hasmapto(plug)
      execute 'map ' . a:combo . ' ' . plug
    endif
  endif

  " Menu entry
  if g:VIMDroidCreateMenuEntry
    let menu_command = 'amenu <silent>' . '&Plugin.VIMDroid' . '.' . escape(a:desc, ' ')
    if strlen(a:combo)
      let leader = exists('g:mapleader') ? g:mapleader : '\'
      let menu_command .= '<Tab>' . escape(leader, '\') . substitute(a:combo, '<leader>', '', '') . ' ' . plug
    else
      " Separator
      let menu_command .= ' :'
    endif
    execute menu_command
  endif

endfunction

" Function name / Menu entry / Default mapping
call s:CreateMaps('ProjectUpdate',        'Project Update',         '<leader>apu')
call s:CreateMaps('BuildDebug',           'Build Debug',            '<leader>abd')
call s:CreateMaps('BuildReleaseUnsigned', 'Build Release Unsigned', '<leader>abr')
call s:CreateMaps('InstallDebug',         'Install Debug',          '<leader>aid')
call s:CreateMaps('RunDevice',            'Run Device',             '<leader>ard')
call s:CreateMaps('',                     '-Sep-',                  '')
call s:CreateMaps(':help VIMDroid<CR>',   'Help',                   '')

