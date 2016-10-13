<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

<xsl:template name="GetIT1Data">
    <xsl:for-each select="//DetailLoop/_x0034_000[not(PURCHASE_ORDER_LINE_NUMBER=preceding::_x0034_000/PURCHASE_ORDER_LINE_NUMBER)]">
        <xsl:if test="../_x0039_000/LINE_ITEM_TYPE != 'FRT' 
                                   and LINE_ITEM_NUMBER != '*999901' ">
            <xsl:variable name="LineNumber"><xsl:value-of select="PURCHASE_ORDER_LINE_NUMBER"/></xsl:variable>
            <xsl:variable name="LineQty"><xsl:value-of select="sum(//DetailLoop[_x0034_000/PURCHASE_ORDER_LINE_NUMBER = $LineNumber]/_x0034_000/QUANTITY)"/></xsl:variable>
            <xsl:variable name="LineUOM"><xsl:value-of select="UOM_CODE"/></xsl:variable>
            <xsl:variable name="LinePrice"><xsl:value-of select="sum(//DetailLoop[_x0034_000/PURCHASE_ORDER_LINE_NUMBER = $LineNumber]/_x0034_000/UNIT_SELLING_PRICE)"/></xsl:variable>
            <xsl:variable name="LineDesc"><xsl:value-of select=" 'LIGHTING PRODUCT' "/></xsl:variable>
            <xsl:call-template name="BuildIT1Loop">
                <xsl:with-param name="LineNumber" select="$LineNumber"/>
                <xsl:with-param name="LineQty" select="$LineQty"/>
                <xsl:with-param name="LineUOM" select="$LineUOM"/>
                <xsl:with-param name="LinePrice" select="$LinePrice"/>
                <xsl:with-param name="LineDesc" select="$LineDesc"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:for-each>
</xsl:template>

<xsl:template name="BuildIT1Loop">
    <xsl:param name="LineNumber"/>
    <xsl:param name="LineQty"/>
    <xsl:param name="LineUOM"/>
    <xsl:param name="LinePrice"/>
    <xsl:param name="LineDesc"/>
    <xsl:if test="$LineQty != '' or $LinePrice != '' ">
        <xsl:element name="ns0:IT1Loop1">
			<xsl:element name="ns0:IT1">
				<xsl:element name="IT101"><xsl:value-of select="$LineNumber"/></xsl:element>
				<xsl:element name="IT102"><xsl:value-of select="$LineQty"/></xsl:element>
				<xsl:element name="IT103"><xsl:value-of select="$LineUOM"/></xsl:element>
				<xsl:element name="IT104"><xsl:value-of select="$LinePrice"/></xsl:element>
				<xsl:if test="$LineDesc != '' ">
					<xsl:element name="ns0:PID">
						<xsl:element name="PID01">F</xsl:element>
						<xsl:element name="PID05"><xsl:value-of select="$LineDesc"/></xsl:element>
					</xsl:element>
				</xsl:if>            
			</xsl:element>
        </xsl:element>
    </xsl:if>
</xsl:template>    
        
    </xsl:stylesheet>
