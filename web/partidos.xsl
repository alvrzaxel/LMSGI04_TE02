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
			<h1>PARTIDOS</h1>
			<table>
				<tr>
					<th>PARTIDO</th>
					<th>FECHA</th>
					<th>RESULTADO</th>
				</tr>
				<!-- Bucle para cada elemento "partido" que tenga un atributo "ciudad" con valor "Lima". -->
				<xsl:for-each select="partido[lugar/@ciudad='Lima']">
				<!-- Ordenamos los partidos por fecha de manera descendente. -->
				<xsl:sort select="fecha" data-type="data" order="descending"/>
					<tr>
						<!-- Mostramos el nombre de los equipos que participan en el partido. -->
						<td><xsl:value-of select="equipos/local"/> - <xsl:value-of select="equipos/visitante"/></td>
						<!-- Mostramos la fecha del partido. -->
						<td><xsl:value-of select="fecha"/></td>
						<!-- Condición para mostrar el fondo en azul si el equipo visitante gana al equipo local. -->
						<xsl:choose>
							<xsl:when test="equipos/visitante/@puntuacion>equipos/local/@puntuacion">
								<td class="azul">
									<!-- Mostramos el resultado del partido con fondo azul si se cumple la condición. -->
									<xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td>
									<!-- Mostramos el resultado del partido sin fondo azul si no se cumple la condición. -->
									<xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/>
								</td>
							</xsl:otherwise>

						</xsl:choose>
					</tr>
				</xsl:for-each>
			</table>		
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>



