<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:jst="http://www.oracle.com/XSL/Transform/java/uk.ac.leedsbeckett.lbufilters.StringTransforms"
                exclude-result-prefixes="jst">
  <xsl:output method="text" encoding="UTF-8"/>
  
  <xsl:variable name="nl" select="'&#xa;'"/>

  <xsl:template match="/">{<xsl:value-of select="$nl"/><xsl:apply-templates select="properties/item[value/@changed = 'true']"/>}<xsl:value-of select="$nl"/></xsl:template>    
  
  <xsl:template match="item">
	  <xsl:value-of select="concat( jst:jsonString( key/text() ), ' : ', jst:jsonString( value/text() ) )" />
	  <xsl:if test="position() != last()">
        <xsl:value-of select="','"/>
	  </xsl:if>
	  <xsl:value-of select="$nl"/>
  </xsl:template>    


</xsl:stylesheet>
