# Readme - German (english below)

![Kossel Plus with 12864 LCD](images/kosselplus_lcd_full.jpg)

Diese Firmwarekonfiguration aktiviert viele neue erweitere Funktionen der Marlin Firmware:

 * Automatische Kalibrierung
 * S-Kurven Beschleunigung
 * Babystepping während des Druckvorgangs (Doppelklick mit dem Kontrollknopf)
 * Unified Bed Leveling (UBL)
 * Manuelles Editieren der Messpunkte über das Display
 * Volle LCD 12864 Unterstützung
 * Fortschrittsbalken für 2004 und 12864 Displays
 * Pause & Filamentwechselfunktion

...Und Spiele! (unten klicken)

[![Games on Anycubic Kossel Plus](https://img.youtube.com/vi/zc9mY9pi9JI/0.jpg)](https://www.youtube.com/watch?v=zc9mY9pi9JI)

**Anmerkung** Wenn du das alte "2004" Display benutzen willst, welches bei dem Drucker mitgeliefert wurde, kommentiere einfach die Zeile `#define REPRAP_DISCOUNT_FULL_GRAPHIC_SMART_CONTROLLER` aus und die Zeile `#define REPRAP_DISCOUNT_SMART_CONTROLLER` in der Datei `configuration.h` ein.

Bevor du irgendwas machst, nachdem du die Firmware geupdated hast, gehe zu `Configuration > Advanced Settings > Initialize EEPROM` um alte Einstellungen zu löschen!

Danach gehst du zu `Configuration > Delta Configuration > Probe Z-offset` um die zusätzliche Hohe des Z-Sensors zu überprüfen.

Nachdem alles überbrüft ist, gehst du zu `Configuration > Delta Calibration > Auto Calibration` um die automatische Kalibrierung auszuführen. Die Einstellungen werden automatisch gespeichert. 

Du solltest danach `Motion > Unified Bed Leveling > Step by Step bed leveling` ausführen und mit `Store Settings` abspeichern.

Bitte teste mit einem Blatt Papier noch einmal die Z0 Höhe. Die Düse sollte bei Z=0.000 fast auf dem Druckbett aufliegen. Falls nicht, stelle die Z-Sensor Höhe noch einmal ganz genau ein und ändere den Wert unter `Configuration > Advanced Settings > Probe Z Offset`.

**WARNUNG! Ändere niemals die Delta-Höhe in den Einstellungen!**

Auf Youtube kursieren einige Videos, in denen gezeigt wird, wie man mit Marlin 1.1.9 den Kossel levelt. Dies ist aber völlig veraltet und trifft nicht mehr auf diese Firmware zu! Im Grunde war es nur der Versuch, das nicht funktionierende Leveling und den falschen Z-Senstor Abstand zu kompensieren - aber es war niemals richtig. Also tue dir selbst einen Gefallen und spiele nicht an den errechneten Werten in der Delta-Konfiguration herum. Alles was du brauchst ist ein perfekter Z-Offset (zusätzliche Z-Höhe des Sensors), der dann erreicht ist, wenn du das leise Klicken hörst. UBL erledigt den Rest und du musst nie wieder mit Papier leveln oder Werte selbst errechnen.


# Wähle deine Konfiguration

**Bitte wähle die korrekten Einstellungen in dere Configuration.h Datei**

Der Kossel wird in 3 Versionen geliefert:

 * Pulley
 * Linear
 * Linear Plus

Pulley und Linear nutzen die selbe Konfiguration, aber der Linear Plus ist größer und benutzt andere Einstellungen.

Im Normalfall kommen die Anycubic Delta Kossel Drucker mit zwei verschiedenen Z-Sensor Versionen:

  * Version 1: Z Probe Offset von -19.0mm

    ![Version 1 Probe](images/Version1Probe.jpg)

  * Version 2: Z Probe Offset von -16.2mm

    ![Version 2 Probe](images/Version2Probe.jpg)

Wenn du in der Konfiguration `ANYCUBIC_PROBE_VERSION 0` ausgewählt hast: Es ist extrem wichtig, dass du die korrekte Prozedur zum Leveln durchführst, nachdem du die Firmware geflashed hast. Andernfalls kann es passieren, dass du deinen Drucker beschädigst, indem du die Düse in das Heizbett rammst.

* `Configuration > Advanced Settings > Initialize EEPROM`
* `Motion > Move Axis > Soft Endstops` : `Off`
* `Auto Home` Und dann langsam(!) runterfahren, bis die Düse ganz leicht das Bett berührt. (Benutze ein stück Papier. Wenn man einen Widerstand beim Verschieben spürt, ist es richtig) und notiere dir diese Zahl auf dem Display.
* Ziehe diese Nummer von der Delta-Höhe ab, bzw addiere sie zu dem Wert unter `Configuration > Delta Calibration > Delta Settings > Height`.
* Speichere und mache den Papier-Test noch mal. Bei Z=0.000 sollte nun die Düse genau das Papier berühren.
* `Configuration > Store Settings`
* `Motion > Unified Bed Leveling (UBL) > Manual Mesh Bed Leveling`

# Download

Du kannst die fertigen Binärdateien hier herunterladen: https://github.com/knutwurst/Marlin-2-0-x-Anycubic-Kossel-Linear-Plus/releases. Natürlich kannst du die Firmware auch selbst mit PlatformIO oder der Arduino IDE selbst kompilieren.

-> `Kossel_Plus_2053.hex` ist für den unmodifizierten originalen Anycubic Kossel Linear Plus.

-> `Kossel_Plus_2053_TMC.hex` hat Optimierungen und invertierte Ausgänge für TMC2100 and TMC2208 Motortreiber.

-> `Kossel_Plus_2053_Graphic_LCD.hex` wird verwendet, wenn du das Display vom einem alten 2004-Style zu einem
12864 Full Graphic Smart Controller getauscht hast.

-> `Kossel_Plus_2053_TMC_Graphic_LCD.hex` benutzt du, wenn du alles gemacht hast. Neues 12864 Full Graphic Smart Controller Display und leise TMC Motortreiber.




# Readme - English

![Kossel Plus with 12864 LCD](images/kosselplus_lcd_full.jpg)

These configurations activate many of the new advanced features of the Marlin firmware:

 * Auto Calibration
 * S-Curve Acceleration
 * Babystepping while printing (double click on control knob)
 * Unified Bed Leveling (UBL)
 * Manual Mesh Edit via LCD
 * Full LCD 12864 Full Graphic Smart Controller Support
 * Progress Bar support for 2004 and 12864 LCD
 * Pause & Filament Change

...and Games! (click below)

[![Games on Anycubic Kossel Plus](https://img.youtube.com/vi/zc9mY9pi9JI/0.jpg)](https://www.youtube.com/watch?v=zc9mY9pi9JI)

**Note** If you want to use the old 2004-Style LCD, which comes with the printer out of the box, just comment `#define REPRAP_DISCOUNT_FULL_GRAPHIC_SMART_CONTROLLER` out and uncomment `#define REPRAP_DISCOUNT_SMART_CONTROLLER` in `configuration.h`.

**Important**: Before doing anything else after updating the firmware, go to `Configuration > Advanced Settings > Initialize EEPROM` to get rid of old configurations.

Then you should execute `Configuration > Delta Configuration > Probe Z-offset` to verify the Probe offset.

After that you should connect the Z-Probe and start `Configuration > Delta Calibration > Auto Calibration`. The Settings are automatically stored inside your EEPROM.

You should also do a `Motion > Unified Bed Leveling > Step by Step bed leveling` followed by `Store Settings` to ensure a perfect leveling.

Please do a manual paper test (moving the nozzle slowly down to Z0 and checking with a piece of paper). If it's not perfect, use `Configuration > Advanced Settings > Probe Z Offset` to correct the difference and execute the calibration again.



**WARNING! DO NOT EDIT THE DELTA HEIGHT!**

It has been around on youtube for a while, but it is a highly outdated procedure, which was a workaroud for a non-working mesh leveling and a wrongly configured Z-Probe offset. So do yourself a favour and do not fiddle around with the Delta settings, which should have been calculated perfectly. Everything you need is a perfect Z-Probe offset (until you hear the clicking noise) and the UBL will do the rest for you.



# Select the Configuration

**Please select the correct values at the start of the Configuration.h file**

The Kossel comes in 3 versions:

 * Pulley
 * Linear
 * Linear Plus

Pulley and Linear use the same configuration, the Linear Plus is bigger and uses slightly different configurations.

Typically the probes for the Anycubic Delta Kossel printers come in two different versions.

  * Version 1: Z Probe Offset of -19.0mm

    ![Version 1 Probe](images/Version1Probe.jpg)

  * Version 2: Z Probe Offset of -16.2mm

    ![Version 2 Probe](images/Version2Probe.jpg)

If you select the `ANYCUBIC_PROBE_VERSION 0`: It's very important to follow the correct procedure to set it up after flashing the firmware, otherwise you might damage the printer by ramming the nozzle into the heatbed:

* `Configuration > Advanced Settings > Initialize EEPROM`
* `Motion > Move Axis > Soft Endstops` : `Off`
* Auto Home and slowly move the nozzle down until it barely touches the bed. (Do a paper-test: A normal sheet of paper should just feel the drag of the nozzle) and note this number.
* Subtract this number from the value in `Configuration > Delta Calibration > Delta Settings > Height`. (If it's negative, add it).
* Save and try the paper test again to verify your height.
* `Configuration > Store Settings`
* `Motion > Unified Bed Leveling (UBL) > Manual Mesh Bed Leveling`

# Download

You can download binary releases from the releases page, which can be found here: https://github.com/knutwurst/Marlin-2-0-x-Anycubic-Kossel-Linear-Plus/releases. Of course you can also build the firmware by yourself using PlatformIO or Arduino IDE.

-> `Kossel_Plus_2053.hex` is for the unmodified original Anycubic Kossel Linear Plus.

-> `Kossel_Plus_2053_TMC.hex` has optimisations and also inverted outputs for TMC2100 and TMC2208 Stepper drivers.

-> `Kossel_Plus_2053_Graphic_LCD.hex` is used, when you changed your LCD from the original 2004-Style to a
12864 Full Graphic Smart Controller.

-> `Kossel_Plus_2053_TMC_Graphic_LCD.hex` is used if you have everything. New 12864 Full Graphic Smart Controller and also quiet TMC Stepper Drivers.
