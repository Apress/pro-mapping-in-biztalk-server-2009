<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

<!-- Code fragment showing how to pick out an ID code Qualifier from the LIN segment and then pull the associated code.--> 

<xsl:template name="PutFullName">
    <xsl:param name="UserCode"/>
    <xsl:param name="UserLast"/>
    <xsl:param name="UserFirst"/>
    <xsl:variable name="NewFirst">
		<xsl:if test="$UserFirst != '' "><xsl:value-of select="concat(', ', $UserFirst)"/></xsl:if>
    </xsl:variable>
    <xsl:variable name="UserType">
        <xsl:choose>
			<xsl:when test="$UserCode = '001' ">CUSTOMER: </xsl:when>
			<xsl:when test="$UserCode = '002' ">SUPPLIER: </xsl:when>
			<xsl:otherwise>MISC: </xsl:otherwise>
		</xsl:choose>    
    </xsl:variable>
    <FullName><xsl:value-of select="concat($UserType, $UserLast, $NewFirst)"/></FullName>
</xsl:template>


</xsl:stylesheet>
