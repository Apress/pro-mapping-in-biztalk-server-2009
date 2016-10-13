<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

<xsl:template name="PutAddressRec">
    <xsl:param name="SysDate"/>
    <xsl:for-each select="//AddressRecord">
        <xsl:variable name="UserCode" select="./UserCode"/>
        <xsl:variable name="UserLast" select="./UserLastName"/>
        <xsl:variable name="UserFirst" select="./UserFirstName"/>
        <xsl:variable name="NewFirst">
            <xsl:if test="$UserFirst != '' ">
                <xsl:value-of select="concat(', ', $UserFirst)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="UserType">
            <xsl:choose>
                <xsl:when test="$UserCode = '001' ">CUSTOMER: </xsl:when>
                <xsl:when test="$UserCode = '002' ">SUPPLIER: </xsl:when>
                <xsl:otherwise>MISC: </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <AddressForm>
            <FullName>
                <xsl:value-of select="concat($UserType, $UserLast, $NewFirst)"/>
            </FullName>
            <xsl:if test="./UserAddress1 != '' ">
                <StreetAddress>
                    <xsl:value-of select="./UserAddress1"/>
                </StreetAddress>
            </xsl:if>
            <GeographicLocation>
                <xsl:value-of select="concat(UserCity, ' ', UserState, ' ', UserZip)"/>
            </GeographicLocation>
            <Phone>
                <xsl:value-of select="UserPhone"/>
            </Phone>
            <DateAdded>
                <xsl:value-of select="$SysDate"/>
            </DateAdded>
        </AddressForm>
    </xsl:for-each>
</xsl:template>


</xsl:stylesheet>
