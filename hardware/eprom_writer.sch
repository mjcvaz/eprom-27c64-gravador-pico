(kicad_sch (version 20231122) (generator eeschema)
  (uuid 00000000-0000-0000-0000-000000000000)
  (paper A4)
  (title_block
    (title "Gravador EPROM 27C64 - Raspberry Pi Pico")
    (date "$date$")
    (rev "1.0")
    (company "DIY")
    (comment 1 "Gravador de 27C64 com level shifting e controle de VPP")
  )

  (sheet (at 0 0) (size A4)
    (title_block
      (title "EPROM Writer 27C64")
      (rev "1.0")
    )
  )

  ; --- COMPONENTES ---

  ; Raspberry Pi Pico
  (symbol (lib_id "controller:RASPBERRY_PI_PICO") (at 100 50 0) (unit 1)
    (uuid 10000000-0000-0000-0000-000000000001)
    (fields_autoplaced)
  )

  ; 74HCT245 (Address Buffer)
  (symbol (lib_id "74xx:74HCT245") (at 140 80 0) (unit 1)
    (uuid 10000000-0000-0000-0000-000000000002)
    (fields_autoplaced)
  )

  ; 74HCT245 (Data Buffer)
  (symbol (lib_id "74xx:74HCT245") (at 140 140 0) (unit 1)
    (uuid 10000000-0000-0000-0000-000000000003)
    (fields_autoplaced)
  )

  ; 27C64 EPROM
  (symbol (lib_id "device:27C64") (at 200 110 0) (unit 1)
    (uuid 10000000-0000-0000-0000-000000000004)
    (in_bom yes) (on_board yes)
    (property "Reference" "U2")
    (property "Value" "27C64")
    (fields_autoplaced)
  )

  ; 7805 Regulador
  (symbol (lib_id "regul:voltage_regulator_3pin") (at 50 90 0) (unit 1)
    (uuid 10000000-0000-0000-0000-000000000005)
    (property "Reference" "U4")
    (property "Value" "7805")
    (fields_autoplaced)
  )

  ; MOSFET 2N7000
  (symbol (lib_id "device:MOSFET_N_3") (at 160 180 0) (unit 1)
    (uuid 10000000-0000-0000-0000-000000000006)
    (property "Reference" "Q1")
    (property "Value" "2N7000")
    (fields_autoplaced)
  )

  ; Diodo 1N4007
  (symbol (lib_id "device:D") (at 190 190 0) (unit 1)
    (uuid 10000000-0000-0000-0000-000000000007)
    (property "Reference" "D1")
    (property "Value" "1N4007")
    (fields_autoplaced)
  )

  ; Conector de alimentação
  (symbol (lib_id "connector:Barrel_Jack_Center_Positive") (at 30 90 0) (unit 1)
    (uuid 10000000-0000-0000-0000-000000000008)
    (property "Reference" "J1")
    (property "Value" "BARREL_JACK")
    (fields_autoplaced)
  )

  ; Resistores
  (symbol (lib_id "device:R") (at 155 175 0) (unit 1)
    (uuid 10000000-0000-0000-0000-000000000009)
    (property "Reference" "R2")
    (property "Value" "1k")
    (fields_autoplaced)
  )

  (symbol (lib_id "device:R") (at 150 190 0) (unit 1)
    (uuid 10000000-0000-0000-0000-000000000010)
    (property "Reference" "R1")
    (property "Value" "10k")
    (fields_autoplaced)
  )

  ; Capacitores
  (symbol (lib_id "device:C") (at 45 95 0) (unit 1)
    (uuid 10000000-0000-0000-0000-000000000011)
    (property "Reference" "C3")
    (property "Value" "10uF")
    (fields_autoplaced)
  )

  (symbol (lib_id "device:C") (at 55 85 0) (unit 1)
    (uuid 10000000-0000-0000-0000-000000000012)
    (property "Reference" "C1")
    (property "Value" "100nF")
    (fields_autoplaced)
  )

  ; Labels e conexões (exemplos)
  (wire (pts (100 52) (105 52)) (stroke (width 0.15) (type default)))
  (label "GP0" (at 105 52) (effects (font (size 1.2 1.2))) (uuid 20000000-0000-0000-0000-000000000001))
  (wire (pts (105 52) (140 52)) (stroke (width 0.15) (type default)))
  (wire (pts (140 52) (140 72)) (stroke (width 0.15) (type default))) ; → A1 74HCT245

  ; Exemplo de conexão A0
  (wire (pts (140 72) (140 82)) (stroke (width 0.15) (type default))) ; A1 → A0
  (wire (pts (140 82) (200 82)) (stroke (width 0.15) (type default)))
  (wire (pts (200 82) (200 100)) (stroke (width 0.15) (type default))) ; → A0 27C64

  ; Linhas de dados (D0-D7) via 74HCT245
  ; (Simplificado: D0 como exemplo)
  (wire (pts (100 54) (140 142)) (stroke (width 0.15) (type default)) (label "D0_DATA"))
  (wire (pts (140 142) (200 142)) (stroke (width 0.15) (type default)) (label "D0_EPROM"))

  ; CE, OE
  (wire (pts (100 56) (200 56)) (stroke (width 0.15) (type default)) (label "CE"))
  (wire (pts (100 58) (200 58)) (stroke (width 0.15) (type default)) (label "OE"))

  ; VPP Control
  (wire (pts (100 60) (155 175)) (stroke (width 0.15) (type default)) (label "VPP_CTRL"))
  (wire (pts (155 175) (160 175)) (stroke (width 0.15) (type default)))
  (wire (pts (160 175) (160 180)) (stroke (width 0.15) (type default))) ; → Gate
  (wire (pts (160 185) (190 190)) (stroke (width 0.15) (type default))) ; Drain → D1
  (wire (pts (190 195) (200 110)) (stroke (width 0.15) (type default)) (label "VPP")) ; D1 → VPP EPROM

  ; Alimentação
  (wire (pts (30 90) (40 90)) (stroke (width 0.15) (type default)))
  (wire (pts (40 90) (50 90)) (stroke (width 0.15) (type default))) ; J1 → 7805
  (wire (pts (50 95) (50 100)) (stroke (width 0.15) (type default)) (label "5V"))
  (wire (pts (50 100) (140 100)) (stroke (width 0.15) (type default)))
  (wire (pts (140 100) (200 100)) (stroke (width 0.15) (type default))) ; → VCC 27C64

  ; GND
  (wire (pts (50 85) (55 85)) (stroke (width 0.15) (type default)))
  (wire (pts (55 85) (55 80)) (stroke (width 0.15) (type default)) (label "GND"))
  (wire (pts (55 80) (160 185)) (stroke (width 0.15) (type default))) ; GND para MOSFET
  (wire (pts (55 80) (200 115)) (stroke (width 0.15) (type default))) ; GND para 27C64

  ; Net Labels (exemplos)
  (label "5V" (at 50 100) (effects (font (size 1.2 1.2))))
  (label "GND" (at 55 80) (effects (font (size 1.2 1.2))))
  (label "VPP" (at 200 110) (effects (font (size 1.2 1.2))))
  (label "CE" (at 200 56) (effects (font (size 1.2 1.2))))
  (label "OE" (at 200 58) (effects (font (size 1.2 1.2))))
  (label "A0" (at 200 100) (effects (font (size 1.2 1.2))))
  (label "D0" (at 200 142) (effects (font (size 1.2 1.2))))

)