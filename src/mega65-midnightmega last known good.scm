(define memories
  '((memory program
            (address (#x2001 . #xcfff)) (type any)
;             (section code data heap cdata zdata (programStart #x2001) (startup #x200e)))
            (section (programStart #x2001) (startup #x200e)))
    (memory zeroPage (address (#x2 . #x7f)) (type ram) (qualifier zpage)
	    (section (registers #x2)))
    (memory stackPage (address (#x1600 . #x16ff)) (type ram))
    (block cstack (size #xff))
    ))
