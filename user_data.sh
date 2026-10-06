#!/bin/bash
# =============================================================
# user_data.sh - Despliegue automatizado de Flask + Apache + WSGI
# Se ejecuta como root en el primer arranque de la instancia EC2
# =============================================================
set -e
export DEBIAN_FRONTEND=noninteractive

# 1. Actualización e instalación
apt-get update -y
apt-get install -y apache2 libapache2-mod-wsgi-py3 python3-flask

# 2. Estructura de directorios y permisos
mkdir -p /var/www/flaskapp

# 3. Generación de ficheros
# --- app.py ---
cat > /var/www/flaskapp/app.py << 'EOF'
from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    return "Aplicación Flask en AWS de Jean Franco Juarez - 05/10/2026 desplegada automáticamente en AWS"

if __name__ == "__main__":
    app.run()
EOF

# --- app.wsgi ---
cat > /var/www/flaskapp/app.wsgi << 'EOF'
import sys
sys.path.insert(0, "/var/www/flaskapp")

from app import app as application
EOF

# --- flaskapp.conf ---
cat > /etc/apache2/sites-available/flaskapp.conf << 'EOF'
<VirtualHost *:80>
    ServerAdmin webmaster@localhost

    WSGIScriptAlias / /var/www/flaskapp/app.wsgi

    <Directory /var/www/flaskapp>
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/flaskapp_error.log
    CustomLog ${APACHE_LOG_DIR}/flaskapp_access.log combined
</VirtualHost>
EOF

# Permisos adecuados
chown -R www-data:www-data /var/www/flaskapp
chmod -R 755 /var/www/flaskapp

# 4. Activación del sitio
a2ensite flaskapp.conf
a2dissite 000-default.conf
systemctl enable apache2
systemctl reload apache2
