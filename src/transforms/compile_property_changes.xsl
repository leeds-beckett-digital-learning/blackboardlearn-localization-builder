<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  
xmlns:lbu="https://my.leedsbeckett.ac.uk" 
exclude-result-prefixes="lbu">

	<xsl:param name="target" select="'classic'"/>
	
	<xsl:variable name="nl">
		<xsl:text>
</xsl:text>
	</xsl:variable>

    <xsl:variable name="w" select="/lbu:spec/lbu:choose/lbu:when"/>
    <xsl:variable name="o" select="/lbu:spec/lbu:choose/lbu:otherwise"/>

    <xsl:variable name="prefix" select="/lbu:spec/lbu:fixes/@prefix"/>
    <xsl:variable name="suffix" select="/lbu:spec/lbu:fixes/@suffix"/>

	<xsl:template match="/">
		<xsl:value-of select="$nl"/>
		<xsl:apply-templates select="document('property_changes_template.xml')/tokenise" />
	</xsl:template>

	<xsl:template match="@*">
		<xsl:copy></xsl:copy>
	</xsl:template>

	<xsl:template match="node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()" />
		</xsl:copy>
	</xsl:template>


	<xsl:template match="*[@id = 'insertpoint']">
		<xsl:copy>
			<xsl:apply-templates select="@*" />
			<xsl:value-of select="$nl"/>
			<xsl:apply-templates select="$w" />
			<xsl:apply-templates select="$o" />
			<xsl:text>		</xsl:text>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="lbu:when[@target != $target]">
			<xsl:value-of select="$nl"/>
			<xsl:comment> Block omitted because has target attribute '<xsl:value-of select="@target"/>' which differs from target '<xsl:value-of select="$target"/>'.</xsl:comment>
			<xsl:value-of select="$nl"/>
	</xsl:template>

	<xsl:template match="lbu:when">
		<!-- double negative helps with case when @target is not present -->
		<xsl:variable name="changes" select="lbu:changes/lbu:replace[ not(@target != $target) ]"/>
		<xsl:variable name="n" select="count($changes)"/>
		<xsl:text>			</xsl:text>
		<when>
			<xsl:value-of select="$nl"/>
			<xsl:text>				</xsl:text>
			<or>
				<xsl:value-of select="$nl"/>
				<xsl:apply-templates select="lbu:matches" />
				<xsl:text>				</xsl:text>
			</or>
			<xsl:value-of select="$nl"/>

			<xsl:text>				</xsl:text>
			<output from="0" to="0"/>
			<xsl:value-of select="$nl"/>
			<xsl:text>				</xsl:text>
			<pass from="1" to="1">
				<xsl:value-of select="$nl"/>
				<xsl:call-template name="tier">
					<xsl:with-param name="i" select="1"/>
					<xsl:with-param name="n" select="count($changes)"/>
					<xsl:with-param name="list" select="$changes"/>				
				</xsl:call-template>
				<xsl:text>				</xsl:text>
			</pass>
			<xsl:value-of select="$nl"/>

			<xsl:text>			</xsl:text>
		</when>
		<xsl:value-of select="$nl"/>

		
	</xsl:template>

	<xsl:template match="lbu:otherwise">
		<xsl:variable name="changes" select="lbu:changes/lbu:replace[ not(@target != $target) ]"/>
		<xsl:text>			</xsl:text>
		<otherwise>
			<xsl:value-of select="$nl"/>
			<xsl:text>				</xsl:text>
			<output from="0" to="0"/>
			<xsl:value-of select="$nl"/>
			<xsl:text>				</xsl:text>
			<pass from="1" to="1">
				<xsl:value-of select="$nl"/>
				<xsl:call-template name="tier">
					<xsl:with-param name="i" select="1"/>
					<xsl:with-param name="n" select="count($changes)"/>
					<xsl:with-param name="list" select="$changes"/>				
				</xsl:call-template>
				<xsl:text>				</xsl:text>
			</pass>
			<xsl:value-of select="$nl"/>
			<xsl:text>			</xsl:text>
		</otherwise>
		<xsl:value-of select="$nl"/>
	</xsl:template>

	<xsl:template match="lbu:matches">
		<xsl:text>					</xsl:text>
		<matches>
			<xsl:attribute name="index">
				<xsl:choose>
					<xsl:when test="@part = 'key'">
						<xsl:value-of select="0"/>
					</xsl:when>
					<xsl:when test="@part = 'value'">
						<xsl:value-of select="1"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'error'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="spec"><xsl:value-of select="@spec"/></xsl:attribute>
		</matches>
		<xsl:value-of select="$nl"/>
	</xsl:template>


	<xsl:template name="tier">
		<xsl:param name="i"/>
		<xsl:param name="n"/>
		<xsl:param name="list"/>

		<xsl:choose>
			<xsl:when test="$i &gt; $n">
				<xsl:text>					</xsl:text>
				<output/>
				<xsl:value-of select="$nl"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>					</xsl:text>
				<replace>
					<xsl:attribute name="match"><xsl:value-of select="concat( $prefix, $list[$i]/@match, $suffix )"/></xsl:attribute>
					<xsl:attribute name="with"><xsl:value-of select="$list[$i]/@with"/></xsl:attribute>
					<xsl:value-of select="$nl"/>
					<xsl:call-template name="tier">
						<xsl:with-param name="i" select="$i + 1"/>
						<xsl:with-param name="n" select="$n"/>
						<xsl:with-param name="list" select="$list"/>
					</xsl:call-template>
					<xsl:text>					</xsl:text>
				</replace>
				<xsl:value-of select="$nl"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
