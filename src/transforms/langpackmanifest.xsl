<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:variable name="nl">
		<xsl:text>
</xsl:text>
	</xsl:variable>

	<!-- put a newline after the xml declaration -->
	<xsl:template match="/">
		<xsl:value-of select="$nl"/>
		<xsl:apply-templates select="@* | node()" />
	</xsl:template>

	<!-- just copy every element but make more readable with a new line after -->
	<xsl:template match="*">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()" />
		</xsl:copy>
		<xsl:value-of select="$nl"/>
	</xsl:template>

	<!-- copy over most attributes by default-->
	<xsl:template match="@*">
		<xsl:copy></xsl:copy>
	</xsl:template>

	<!-- except name of language pack attribute gets replaced -->
	<xsl:template match="manifest/languagepack/name/@value">
		<xsl:attribute name="value">English (Leeds Beckett University)</xsl:attribute>
	</xsl:template>

	<!-- except locale ID of language pack attribute gets replaced -->
	<xsl:template match="manifest/languagepack/locale/@value">
		<xsl:attribute name="value">en_GB_LBU</xsl:attribute>
	</xsl:template>

</xsl:stylesheet>
