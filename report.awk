#!/usr/bin/awk -f

BEGIN {
    nlangs = -1
    n = 0
}

/fib-/ {
    ++nlangs

    lang = $0
    gsub(".*fib-","", lang)
    gsub(" .+","", lang)

    langs[nlangs] = lang
    n = 0
}

/fib\./ {
    ++nlangs

    lang = $0
    gsub(".* time ","", lang)
    gsub(" .+","", lang)

    langs[nlangs] = lang
    n = 0
}

!/fib/{
    map[nlangs,n++] = $1
}

END {
    ++nlangs

    for (j = 0; j < nlangs; ++j) {
        printf("%s,", langs[j])
    }
    print("")

    for (i = 0; i < n; ++i) {
        for (j = 0; j < nlangs; ++j) {
            printf("%s, ", map[j,i])
        }
        print("")
    }
}
