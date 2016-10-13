<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                       xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                       xmlns:s0="http://schemas.microsoft.com/BizTalk/EDI/X12/2006" 
                       xmlns:ns0="http://Chapter_17.FlatFileSchema1"
                       xmlns:var="urn:var" xmlns:userCSharp="urn:user" exclude-result-prefixes="msxsl var userCSharp" version="1.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <xsl:element name="ns0:Shipment">
            <xsl:variable name="RailRoadCar" select="concat(//s0:TD3/TD302,//s0:TD3/TD303 )"/>
            <xsl:variable name="OrderNum" select="//s0:PRF/PRF01"/>
            <xsl:for-each select="//s0:HLLoop1[s0:HL/HL03='I']/s0:MAN[not(MAN02=preceding::s0:MAN/MAN02)]">
                <xsl:variable name="ItemID" select="MAN02"/>
                <xsl:element name="ItemLoop">
                    <xsl:element name="ItemID">
                        <xsl:value-of select="$ItemID"/>
                    </xsl:element>
                    <xsl:element name="OrderNum">
                        <xsl:value-of select="$OrderNum"/>
                    </xsl:element>
                    <xsl:element name="RailRoadCar">
                        <xsl:value-of select="$RailRoadCar"/>
                    </xsl:element>
                    <xsl:for-each select="//s0:HLLoop1[s0:HL/HL03='I' and s0:MAN/MAN02 = $ItemID]">
                        <xsl:variable name="HLPack" select="s0:HL/HL02"/>
                        <xsl:element name="PackLoop">
                            <xsl:element name="PackID">
                                <xsl:value-of select="//s0:HLLoop1[s0:HL/HL01=$HLPack and s0:HL/HL03='P' ]/s0:MAN/MAN02"/>
                            </xsl:element>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
