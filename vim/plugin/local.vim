
command! -nargs=* Zetedit call local#zettel#edit("edit", <f-args>)
command! -nargs=* Zetvsplit call local#zettel#edit("vsplit", <f-args>)
command! -nargs=* Zetsplit call local#zettel#edit("split", <f-args>)
command! -nargs=* Zettab call local#zettel#edit("tabedit", <f-args>)
