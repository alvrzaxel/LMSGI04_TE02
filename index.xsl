<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat" />
<xsl:template match='/club_voleibol'>
<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "./img/logotipo.png" alt= "Reservas" />
			<a href="web/tienda.xml">Tienda</a>
			<a href="web/equipos.xml">Equipos</a>
			<a href="web/partidos.xml">Partidos</a>
		</header>
		
		<main class="principal">
				<h1>TRABAJANDO CON PLANTILLAS XSLT</h1>
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>