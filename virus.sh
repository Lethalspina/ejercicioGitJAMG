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
# -------------------------------
# Propagación Simulada:
# -------------------------------
dest_folder="$HOME/Documents/Infectados"
echo "Simulación de propagación: Copiando el script a $dest_folder"
mkdir -p "$dest_folder"
cp "$0" "$dest_folder/"
# Persistencia Simulada:
# Agrega una línea al inicio del sistema (ejemplo: en ~/.bashrc)
# para simular que el script se ejecuta al iniciar sesión.
# -------------------------------
echo "Simulación de persistencia: Añadiendo línea a ~/.bashrc"
echo "# Simulación de persistencia para virus.sh" >> "$HOME/.bashrc"
echo "$HOME/virus.sh" >> "$HOME/.bashrc"

# -------------------------------
# Ofuscación:
# Codifica en Base64 parte del código y luego lo decodifica y ejecuta.
# -------------------------------
echo "Simulación de ofuscación: Ejecutando código ofuscado"
# Codificamos la instrucción de impresión
encoded=$(echo "echo 'Ejecutando función oculta...'" | base64)
# Decodificamos y ejecutamos el código ofuscado
echo "$encoded" | base64 --decode | bash
# -------------------------------
# Autodestrucción:
# Elimina el script después de ejecutarse.
# -------------------------------
echo "Simulación de autodestrucción: Eliminando el script"
rm -- "$0"