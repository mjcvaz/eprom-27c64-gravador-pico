# Gravador de EPROM 27C64 com Raspberry Pi Pico

Projeto open-source de um gravador de EPROMs 27C64 controlado pela Raspberry Pi Pico.

![EPROM 27C64](assets/eprom.jpg)

## 🛠 Hardware
- Raspberry Pi Pico (RP2040)
- EPROM 27C64 (8KB)
- 74HCT245 (level shifter 3.3V ↔ 5V)
- 7805 (regulador 5V)
- 2N7000 (MOSFET para controle de VPP)
- Soquete ZIF 28 pinos

## 💾 Firmware
Código em MicroPython para:
- Leitura da EPROM
- Gravação byte a byte (com VPP ativado)
- Verificação

## 📂 Estrutura