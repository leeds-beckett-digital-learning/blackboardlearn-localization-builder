<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:vx="http://leedsbeckett.ac.uk/versatilexslt" 
                exclude-result-prefixes="vx">
  <xsl:output method="xml" encoding="UTF-8"/>
  

  <xsl:variable name="nl" select="'&#xa;'"/>
  <xsl:variable name="indent" select="'  '"/>
  <xsl:variable name="indent2" select="'    '"/>

  <xsl:template match="/">
    <xsl:value-of select="$nl"/>
    <xsl:apply-templates select="//results"/>
	 <xsl:value-of select="$nl"/>
  </xsl:template>    

  <xsl:template match="results">
  	 <properties>
      <xsl:value-of select="$nl"/>
      <xsl:apply-templates select="vx:item">
		<xsl:sort select="key"/>
	  </xsl:apply-templates>
    </properties>
  </xsl:template>    
  
  <xsl:template match="vx:item">
    <xsl:value-of select="$indent"/>
  	 <item>
      <xsl:value-of select="$nl"/>
      <xsl:value-of select="$indent2"/>
      <key><xsl:value-of select="key/text()"/></key>
      <xsl:value-of select="$nl"/>
      <xsl:value-of select="$indent2"/>
      <value><xsl:value-of select="baseValue/text()"/></value>
      <xsl:value-of select="$nl"/>
      <xsl:value-of select="$indent"/>
    </item>
	 <xsl:value-of select="$nl"/>
  </xsl:template>    
  
</xsl:stylesheet>
