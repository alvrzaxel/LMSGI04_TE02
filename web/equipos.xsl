<?xml version="1.0" encoding='utf-8'?>

<!--
Autor: Axel Alvarez Santos
Asignatura: LMGSI
Unidad: UD 4
Tarea: Tarea evaluativa 2 - XSLT
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- Establecemos la salida como un documento HTML con el sistema de doctype "about:legacy-compat". -->
<xsl:output method="html" doctype-system="about:legacy-compat" />
<!-- Iniciamos el template que coincide con el elemento raíz '/club_voleibol'. -->
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
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="tienda.xml">Tienda</a>
			<a href="equipos.xml">Equipos</a>
			<a href="partidos.xml">Partidos</a>
		</header>
		
		<main>
			<!-- Declaramos una variable que almacena el nombre del entrenador, en este caso "Julio Velasco". -->
			<xsl:variable name="nombreEntrenador" as="xs:string" select="equipo[entrenador/nombre='Julio Velasco']/entrenador/nombre"/>
			<!-- Aplicamos el template solo a los equipos que tienen a el valor de la variable "nombreEntrenador" como entrenador. -->
			<xsl:apply-templates select="equipo[entrenador/nombre=$nombreEntrenador]"/>
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

<!-- Template para los elementos "equipo". -->
<xsl:template match="equipo">
	<!-- Cremos un título con un enlace al URL del entrenador del equipo. -->
	<h1><a href="{entrenador/url}"><xsl:value-of select="entrenador/nombre"/></a></h1>
		<article class="equipos">
			<!-- Mostramos el nombre del equipo. -->
			<h4><xsl:value-of select="nombre"/></h4>
			<!-- Aplicamos templates a los elementos "jugador" dentro del equipo. -->
			<xsl:apply-templates select="jugadores/jugador"/>
		</article>
</xsl:template>

<!-- Template para los elementos "jugador". -->
<xsl:template match="jugador">
	<!-- Verificamos si el jugador es titular. -->
	<xsl:if test="@titular='si'">
		<!-- Mostramos la camiseta y el nombre del jugador. -->
		<p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>






