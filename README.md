# UT1-RA1-Arquitectura-Web-Jean-Franco-Juarez-Lozano
Trabajo de AWS de Jean Franco Juarez Lozano
Readme creado, prueba de usuario.

# ¿Qué hace este proyecto?

Este repositorio contiene el script user_data.sh, que se pega en el apartado User Data al lanzar una instancia Ubuntu en AWS EC2. Cuando la instancia arranca por primera vez, el script se ejecuta solo (como root) y deja funcionando loq ue está escrito en él:
Un servidor web Apache.
Una aplicación web dinámica hecha con Flask (Python).
La conexión entre ambos mediante mod_wsgi.

Todo ocurre sin conectarse por SSH: se lanza la instancia, se esperan un par de minutos y la web ya responde en http://IP-PUBLICA.

# Como sigue la operacion
El navegador en el http:80 va al grupo de seguridad de la instancia, este en el EC de ubuntu, este en el Apache que es el servidor web que recibe las ordenes del http 80, ejecuta el mod wsgi que es el encargado de ejecutar aplicaciones Phyton, luego pasa por el app.wsdi hasta Flask, que es un microframework de python en el cual se escribe la aplicacion web.

# 
El ssh actualiza e instala paquetes, como el apache2, el módulo que coneca Apache con Python, también instala flask.

Además de crear también las carpetas donde estará la aplicación, por ejemplo en  mkdir  -p /var/www/flaskapp  , es un ubicación estándar de contenido en Ubuntu

Cat genera los ficheros y el py
Crea la aplicacion con Flask(__name__)
Define la ruta / con @app.route("/")

El app.wsgi es un adaptador, añade a la carpeta de aplicacion a las rutas onde Python busca módulos, para que encuentra app.py

# El flaskapp.conf
Es el Virtualhost de Apache, define un sitio que atiende peticiones en este caso el puerto 80 (HTTP)