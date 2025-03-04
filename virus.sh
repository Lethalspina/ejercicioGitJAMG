#!/bin/bash
# Mensaje inicial humorístico
echo "¡Hola! Soy un virus 🦠"
echo "¡Tu sistema está infectado! 😈"

# -------------------------------
# Payload Simulado:
# -------------------------------
tmp_file="/tmp/infectado.txt"
echo "Simulación de payload: Creando archivo temporal en $tmp_file"
touch "$tmp_file"
for i in {1..10}; do
    echo "Mensaje aleatorio $RANDOM" >> "$tmp_file"
done