#!/usr/bin/gawk -f
@include "opts/nentradas.awk"
@include "opts/cliente.awk"
@include "opts/locsaida.awk"
@include "opts/gmes.awk"
@include "opts/gmesp.awk"
@include "opts/gmesport.awk"
@include "opts/total_trans.awk"

BEGIN {
    PROCINFO["sorted_in"] = std_sorted_in

    opts["nentradas"] = "Número de entradas ao longo do mês"
    opts["locsaida"] = "Lista de locais de saída"
    opts["gmes"] = "Total gasto durante o mês"
    opts["gmesp"] = "Total gasto em parques"
    opts["gmesport"] = "Total gasto em portagens"
    opts["total_trans"] = "Lista total de transferências"
    opts["cliente"] = "Informações do Cliente"

    print_index()
    print_css()
}


function print_index() {
    header = "<head><meta charset='UTF-8'/></meta></head>"
    link = "<li><a href=%s>%s</a></li>"

    print "<html>" header "<body>" > "pages/index.html"

    for (i in opts)
        printf (link, i ".html" , opts[i]) > "pages/index.html"

    print "</body></html>" > "pages/index.html"
}

function print_css() {
    print"\
.bar {\
  font: 10px sans-serif;\
  background-color: steelblue;\
  text-align: right;\
  display: inline-block;\
  padding: 3px;\
  margin: 1px;\
  color: white;\
}" > "pages/all.css"
}
