# UT1-RA1-Arquitectura-Web-Jean-Franco-Juarez-Lozano
Trabajo de AWS de Jean Franco Juarez Lozano
Readme creado, prueba de usuario.

# ¿Qué hace este proyecto?

Este repositorio contiene el script user_data.sh, que se pega en el apartado User Data al lanzar una instancia Ubuntu en AWS EC2. Cuando la instancia arranca por primera vez, el script se ejecuta solo (como root) y deja funcionando loq ue está escrito en él:
Un servidor web Apache.
Una aplicación web dinámica hecha con Flask (Python).
La conexión entre ambos mediante mod_wsgi.

Todo ocurre sin conectarse por SSH: se lanza la instancia, se esperan un par de minutos y la web ya responde en http://IP-PUBLICA.

