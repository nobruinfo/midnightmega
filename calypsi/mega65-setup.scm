(define memories
  '(
    (block heap   (size #x0000))
    (block cstack  (size #x0800))
  
    (memory program
            (address (#x2001 . #xCfff)) (type any)
            (section 
              (programStart #x2001) 
              (startup #x200e)
              ))

    (memory cstack
            (address (#x1600 . #x2000))
            (section
              (cstack (#x1600 . #x2000))
            ))
            
    (memory zeroPage 
            (address (#x2 . #xff)) (type ram) (qualifier zpage)
	          (section (registers #x2)))
    (memory stackPage 
            (address (#x100 . #x1ff)) (type ram))
  )
)
