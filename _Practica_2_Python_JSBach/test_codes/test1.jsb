Main |:
    src <- {A B C D E F G}
    dst <- {}
    aux <- {}
    HanoiRec #src src dst aux
:|

HanoiRec n src dst aux |:
    if n > 0 |:
        HanoiRec (n - 1) src aux dst
        note <- src[#src]
        <!> src
        8< src[#src]
        <!> src
        dst << note
        <:> note
        HanoiRec (n - 1) aux dst src
    :|
:|