# main.py - Gravador 27C64 para Raspberry Pi Pico
# Autor: Assistente IA + Você
# Repo: https://github.com/brpico/eprom-27c64-gravador-pico

from machine import Pin
import time

# === Configuração de pinos ===
# Endereços A0-A12
addr_pins = [Pin(i, Pin.OUT) for i in range(0, 13)]  # GP0-GP12

# Dados D0-D7
data_pins = [Pin(i, Pin.OUT) for i in range(13, 21)]  # GP13-GP20

# Controle
ce = Pin(21, Pin.OUT)   # Chip Enable
oe = Pin(22, Pin.OUT)   # Output Enable
vpp_ctrl = Pin(26, Pin.OUT)  # Controle de VPP (via MOSFET)

# Direção do 74HCT245 (opcional)
dir_ctrl = Pin(27, Pin.OUT)  # 0 = escrita, 1 = leitura

# === Funções auxiliares ===
def set_address(addr):
    for i in range(13):
        addr_pins[i].value((addr >> i) & 1)

def set_data_pins(data):
    for i in range(8):
        data_pins[i].value((data >> i) & 1)

def read_data():
    val = 0
    for i in range(8):
        if data_pins[i].value():
            val |= (1 << i)
    return val

def configure_data_as_input():
    global data_pins
    for p in data_pins:
        p.init(Pin.IN)

def configure_data_as_output():
    global data_pins
    for p in data_pins:
        p.init(Pin.OUT)

# === Modos ===
def enable_reading():
    ce.value(0)
    oe.value(0)
    vpp_ctrl.value(0)  # Desligado
    dir_ctrl.value(1)  # B → A (leitura)
    configure_data_as_input()

def enable_writing():
    ce.value(1)
    oe.value(1)
    dir_ctrl.value(0)  # A → B (escrita)
    configure_data_as_output()

def program_byte(address, data):
    set_address(address)
    set_data_pins(data)
    vpp_ctrl.value(1)   # Ativa VPP (MOSFET desliga → VPP = 12.5V)
    ce.value(0)         # Pulso de gravação
    time.sleep_ms(50)
    ce.value(1)
    vpp_ctrl.value(0)   # Desativa VPP
    print(f"Gravado: ${address:04X} = ${data:02X}")

def read_byte(address):
    set_address(address)
    return read_data()

# === Teste ===
def main():
    print("Iniciando gravador 27C64...")
    enable_reading()
    time.sleep(0.1)

    # Leitura de teste
    print("Leitura dos primeiros 16 bytes:")
    for addr in range(16):
        b = read_byte(addr)
        print(f"${addr:04X}: ${b:02X}")

    # Exemplo de gravação (descomente com cuidado!)
    # enable_writing()
    # program_byte(0x0000, 0x42)  # Grava 'B'
    # program_byte(0x0001, 0x4C)  # Grava 'L'

    print("Pronto. Use REPL para comandos.")

if __name__ == "__main__":
    main()