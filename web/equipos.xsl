<?xml version="1.0" encoding='utf-8'?>

<!--
Autor: Axel Alvarez Santos
Asignatura: LMGSI
Unidad: UD 4
Tarea: Tarea evaluativa 2 - XSLT
-->

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
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="tienda.xml">Tienda</a>
			<a href="equipos.xml">Equipos</a>
			<a href="partidos.xml">Partidos</a>
		</header>
		
		<main>
			<xsl:variable name="nombreEntrenador" as="xs:string" select="equipo[entrenador/nombre='Julio Velasco']/entrenador/nombre"/>
			<xsl:apply-templates select="equipo[entrenador/nombre=$nombreEntrenador]"/>
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

<xsl:template match="equipo">
	<h1><a href="{entrenador/url}"><xsl:value-of select="entrenador/nombre"/></a></h1>
			<article class="equipos">
				<h4><xsl:value-of select="nombre"/></h4>
				<xsl:apply-templates select="jugadores/jugador"/>
			</article>
</xsl:template>

<xsl:template match="jugador">
	<xsl:if test="@titular='si'">
		<p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>






