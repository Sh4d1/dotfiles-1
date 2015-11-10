

" Use keywords from Octave syntax language file for autocomplete 
if exists("+omnifunc") 
    if &omnifunc == "" | 
        setlocal omnifunc=syntaxcomplete#Complete | 
    endif 
endif 
