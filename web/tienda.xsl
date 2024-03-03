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
		
		<main class="principal">
			<!-- Iniciamos un bucle para cada elemento "articulo". -->
			<xsl:for-each select="tienda/articulo">
				<article>
					<section>
						<!-- Seleccionamos la imagen del artículo con la ruta del atributo "foto". -->
						<img class="articulo" src="../img/{@foto}"/>			
					</section>
					<section>
						<!-- Concatenamos el precio junto con el símbolo "€". -->
						<h2><xsl:value-of select="concat(precio,' €')"/></h2>
						<!-- Calculamos y mostramos el número comentarios. -->
						<h3>Comentarios: <xsl:value-of select="count(comentarios)"/></h3>
						<ul>
							<!-- Bucle para cada elemento 'comentarios'. -->
							<xsl:for-each select="comentarios">
								<!-- Mostramos la fecha del comentario y su contenido. -->
								<li><xsl:value-of select="@fecha"/> <xsl:value-of select="."/> </li>
							</xsl:for-each>
						</ul>
					</section>
				</article>
			</xsl:for-each>
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>



