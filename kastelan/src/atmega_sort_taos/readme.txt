Nezavisly modul na trideni puku:

Pouzijeme atmegu8
Chceme:
 - komunikovat pres i2c
 - cist senzor
 - generovat pwm pro servo

pwm muzeme generovat hardwarove
cteni senzoru bude zarucene vyzadovat interrupty
proto i2c muze bezet klidne pollovane

Jake prikazy by mely byt na rozhrani atmega <--> blackfin:
// - cti barvu rgbw a posli rgbw (vsechny slozky musi byt namerene temer soucasne)
// - nastav servo na pozici X
// - zapni vypni svetlo detektoru barvy (kdo vi, jestli to lze)

// - nastav si konstanty:
//   * hodnota serva pro levou a pravou prihradku a pro stred
 - nastav pravidla na detekci barvy (tady je potreba jeste trochu premyslet)
// - nastav timeout jak dlouho nechat servo na prepnute po konci detekce puku

// - zacni tridit / prestan tridit

 - precti / nastav pocet puku vytrizenych puku
 - vezmi nerozlisitelne barvy



aktualni spusteni
i2cset -y 0 0x71 0x07 0x9F
i2cset -y 0 0x71 0x06 0x1D
i2cset -y 0 0x71 0x08 0x60
i2cset -y 0 0x71 0x00 0x0A



18.1.2012
kdyz na TAOS nedopada zadne savetlo, tak ma nulovou frekvenci, vystup je tedy na +5V nebo na GND

Nelze tak frekvenci merit tim, ze bychom meril cas jedne pulperiody, protoze pri spatnem svetle kazdy timer pretece.

Vychazi z toho dalsi verze, ktera podle jednoho casovace omezi interval, ve kterem spocita pocet tiku z TAOSu.

jenze:

TIMER0 ma minimalni frekvenci 8KHz (bez pouziti externiho zdroje)

-> pouzijeme TIMER1
  --  bezi na _presne_ 50Hz
  ->  musime pocitat 16-bitove (snad krome nejnizsi rychlosti TAOSu)


-------------------
 Soucasny software
-------------------

pouziva se:
TIMER1
  bezi na 50Hz
  compare check A servo 1
  compare check B servo 2
  pri preteceni (20ms) ulozi pocet tiku ze senzoru
COUNTER0
  simulovany 16-bit counter (pri preteceni 8-bit counteru se pricte 1 k hornim 8 bitum)

Nepouziva se Counter2, ktery ma sice prescaler. Ten umi delit 8 a 32. My bychom potrebovali delit nejspis 16 (jestli jsem spravne odhadl jak silne sviti ledky).


absolutni maximum senzoru:
  maximum co z toho leze je mezi 800 a 827 kHz
  to odpovida priblizne hodnote 40FF

protoze stihame i tech 827kHz, tak klidne muzeme bezet na max rychlosti senzoru

