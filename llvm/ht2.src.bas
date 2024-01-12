    0 goto 10
    1 open 1,8,15,"s:ht2":close1
    2 save"ht2",8
    3 verify"ht2",8
    4 stop
    9 rem *** hauptmenue ***
   10 poke 53280,0 :poke 53281,0 :print chr$(14)chr$(147);
   12 print"{lblu}{rvon}";:for z=1 to 40:print" ";:next
   14 print"         Home-Text Seiteneditor         ";
   16 for z=1 to 40:print" ";:next
   18 print
   20 print"{yel}W{CBM-A}hlen Sie eine Funktion:
   22 print
   24 print"{wht}1 zum Erstellen bzw. Ab{CBM-A}ndern einer
   26 print"  Seite
   28 print
   30 print"2 zum Betrachten einer Seite
   32 print
   34 print"3 zum Kopieren einer Seite von Nummer
   36 print"  zu Nummer und/oder Diskette zu Disket-";
   38 print"  te
   40 print
   42 print"4 zum L{CBM-O}schen einer Seite
   44 print:print:print:print
   46 print"9 zum Verlassen des Programms Richtung
   48 print"  Systemsoftware
   50 print
   52 print"0 zum Verlassen des Programms Richtung
   54 print"  BASIC";
   60 get x$:if x$="" then 60
   65 if x$="1" then 1000
   70 if x$="2" then 2000
   75 if x$="3" then 3000
   80 if x$="4" then 4000
   85 if x$="9" then 9000
   90 if x$="0" then poke 808,237:print"{clr}";:end
   95 goto 60
  199 rem *** zahlen-input-routine ***
  200 input "{down}{wht}Seite";s
  210 if s<0 or s>999 then print"Ung{CBM-U}ltig !":goto 200
  220 return
  299 rem *** lade seite s ***
  300 print"{wht}{clr}";
  302 open 1,8,15,"r:page"+str$(s)+".a=page"+str$(s)+".a"
  305 input#1,x,x$:close1
  310 if x=62 then ff=1:return
  315 if x<>63 then print"{clr}{wht}";x;x$:poke 808,237:end
  320 open1,8,2,"page"+str$(s)+".b,p,r"
  325 get#1,x$,x$
  330 for i=55376 to 56295
  335 get#1,x$:poke i,asc(x$)
  340 next i:close 1
  350 open1,8,2,"page"+str$(s)+".a,p,r"
  355 get#1,x$,x$
  360 for i=52304 to 53223
  365 get#1,x$:poke i,asc(x$)
  370 next i:close 1
  375 return
  399 rem *** speichere seite s ***
  400 open1,8,15,"s:page"+str$(s)+".?"
  405 close1
  410 open1,8,2,"page"+str$(s)+".a,p,w"
  415 print#1,chr$(80);chr$(204);
  420 for i=52304 to 53223
  425 print#1,chr$(peek(i));
  430 next i:close1
  440 open1,8,2,"page"+str$(s)+".b,p,w"
  445 print#1,chr$(80);chr$(216);
  450 for i=55376 to 56295
  455 print#1,chr$(peek(i));
  460 next i:close1
  465 return
  999 rem *** erstellen & abaendern ***
 1000 print"{yel}{clr}Erstellen und Ab{CBM-A}ndern:"
 1005 gosub 200:rem zahleninput
 1015 gosub 300:rem laden
 1020 print"{home}{yel}Seite";s;"editieren"
 1025 print"    Nachher HOME&RETURN{wht}{home}"
 1027 poke 53280,15
 1030 input x$
 1032 poke 53280,0
 1035 gosub 400:rem speichern
 1040 goto 10:rem menu
 1999 rem *** betrachten ***
 2000 print"{yel}{clr}Betrachten:"
 2005 gosub 200:rem zahleninput
 2015 gosub 300:rem laden
 2020 print"{home}{yel}Bitte Taste dr{CBM-U}cken !"
 2025 poke 198,0:wait 198,1:poke 198,0
 2030 goto 10:rem menu
 2999 rem *** kopieren ***
 3000 print"{yel}{clr}Kopieren:"
 3005 print"{wht}{down}Holen von{up}"
 3010 gosub 200:s1=s:rem input
 3015 print"{wht}{down}Bringen nach{up}"
 3020 gosub 200:s2=s:rem input
 3025 print"{down}{lblu}Quelldiskette einlegen, SPACE !"
 3030 get x$:if x$<>" " then 3030
 3035 s=s1:gosub 300:rem laden
 3040 print"{home}Zieldiskette einlegen, SPACE !"
 3045 get x$:if x$<>" " then 3045
 3050 s=s2:gosub 400:rem speichern
 3055 goto 10:rem menu
 3999 rem *** loeschen ***
 4000 print"{yel}{clr}L{CBM-O}schen:"
 4005 print"{wht}{down}Zu l{CBM-O}schende{up}"
 4010 gosub 200:rem input
 4015 print"{down}{lblu}Wollen Sie wirklich Seite";s
 4020 print"l{CBM-O}schen (J/N) ?"
 4025 get x$:if x$="" then 4025
 4030 if x$<>"j" then goto 10
 4035 print"{clr}{wht}L{CBM-O}schen von Seite";s;"{left}."
 4040 open 1,8,15,"s:page"+str$(s)+".?"
 4045 close 1:goto 10:rem menu
 8999 rem *** ruecksprung ins system ***
 9000 print"{blk}{clr}{down}{down}load"+chr$(34)+"?*"+chr$(34)+",8"
 9005 print"{down}{down}{down}{down}run"
 9010 print"{down}{down}{wht}             Bitte warten !{blk}{home}";
 9015 poke 631,13:poke 632,13
 9020 poke 198,2:new
