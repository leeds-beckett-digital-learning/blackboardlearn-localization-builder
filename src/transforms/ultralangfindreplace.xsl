<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:jst="http://www.oracle.com/XSL/Transform/java/uk.ac.leedsbeckett.lbufilters.StringTransforms"
				xmlns:lbu="https://my.leedsbeckett.ac.uk" 
                exclude-result-prefixes="jst lbu">
  <xsl:output method="xml" encoding="UTF-8"/>

  <xsl:param name="target" select="'ultra'"/>
  <xsl:param name="changeindicator" select="'true'"/>
  <xsl:variable name="insertci" select="$changeindicator = 'true'"/>
  
  <!-- The file name of the spec file -->
  <xsl:param name="changespec"/>
  
  <xsl:variable name="nl" select="'&#xa;'"/>

  <!-- prefix to all find/replace regex from spec file -->
  <xsl:variable name="prefix" select="string( document($changespec)/lbu:spec/lbu:fixes/@prefix )"/>
  <!-- suffix to all find/replace regex from spec file -->
  <xsl:variable name="suffix" select="string( document($changespec)/lbu:spec/lbu:fixes/@suffix )"/>
  <!-- the list of when/otherwise clauses from the spec file -->
  <xsl:variable name="list" select="document($changespec)/lbu:spec/lbu:choose/*"/>
  <!-- the count of elements in the above list -->
  <xsl:variable name="n" select="count($list)"/>


  <!-- Mostly just copy over content from the template -->
  <xsl:template match="/">
    <xsl:value-of select="$nl"/>
    <xsl:apply-templates select="node()|@*"/>
    <xsl:value-of select="$nl"/>
  </xsl:template>    

  <!-- Identity template duplicates nodes in the template -->
  <xsl:template match="node()|@*">
      <xsl:copy>
          <xsl:apply-templates select="node()|@*"/>
      </xsl:copy>
  </xsl:template>    
  
  <!-- 
  But when a 'value' element is encountered pass the value to the donext template
  along with the key and the number '1' to indicate that processing should start
  with the first when/otherwise in the spec file.
  -->
  <xsl:template match="value">	
	<xsl:call-template name="donext">
		<xsl:with-param name="key"   select="../key/text()"/>
		<xsl:with-param name="value" select="text()"/>
		<xsl:with-param name="i" select="1"/>
	</xsl:call-template>
  </xsl:template>    

  <!-- Run this string value through one of the 'when' or 'otherwise' clauses in the change spec. -->
  <xsl:template name="donext">
	<!-- The key of the current string -->
	<xsl:param name="key"/>
	<!-- The value of it -->
	<xsl:param name="value"/>
	<!-- which when/otherwise clause are we working on -->
	<xsl:param name="i"/>
	<!-- The when/otherwise clause itself -->
	<xsl:variable name="current" select="$list[$i]"/>
	<!-- Is current clause and 'otherwise' clause? -->
	<xsl:variable name="isotherwise" select="name($current) = 'otherwise'"/>
	<!-- Do any of clause's key matches bite? -->
	<xsl:variable name="matchesk" select="'match' = jst:matchesAny( $current/lbu:matches[@part='key']/@spec, $key )"/>
	<!-- Do any of clause's value matches bite? -->
	<xsl:variable name="matchesv" select="'match' = jst:matchesAny( $current/lbu:matches[@part='value']/@spec, $value )"/>
	
	<xsl:choose>
		<!-- When beyond end of clause list do nothing -->
		<xsl:when test="$i &gt; $n">
		</xsl:when>

		<!-- When this clause applies do some processing and then stop -->
		<xsl:when test="$isotherwise or $matchesk or $matchesv">
			<xsl:variable name="replacements" select="$current/lbu:changes/lbu:replace[ not(@target != $target) ]"/>
			<!-- How many changes in this clause -->
			<xsl:variable name="changecount" select="count( $replacements )"/>
			<!-- The changed value of the clause -->
			<xsl:variable name="changed" select="jst:multiReplace( $value, $replacements, $prefix, $suffix )"/>
			
			<!-- output value -->
			<value>
				<xsl:choose>
					<!-- If changes were specified AND the result actually is different... -->
					<xsl:when test="$changecount != 0 and $value != $changed">
						<!-- flag with attribute -->
						<xsl:if test="$insertci">
							<xsl:attribute name="changed">true</xsl:attribute>
						</xsl:if>
						<!-- and output the changed value -->
						<xsl:value-of select="$changed"/>
					</xsl:when>
					<xsl:otherwise>
						<!-- Just output the original value -->
						<xsl:value-of select="$value"/>
					</xsl:otherwise>
				</xsl:choose>
			</value>
		</xsl:when>
		<xsl:otherwise>
			<!-- There are more clauses and the current clause didn't apply so do the next clause -->
			<xsl:call-template name="donext">
				<xsl:with-param name="key"   select="$key"/>
				<xsl:with-param name="value" select="$value"/>
				<xsl:with-param name="i" select="$i + 1"/>
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
	
  </xsl:template>    
  


</xsl:stylesheet>
