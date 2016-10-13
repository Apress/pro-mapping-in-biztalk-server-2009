<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- Cummulative Sum with scope paramater of null (not entered)  -->
    <LineItem>
        <xsl:variable name="var:v1" select="userCSharp:InitCumulativeSum(0)"/>
        <xsl:for-each select="/Invoice/DetailLoop/LineItem">
            <xsl:variable name="var:v2" select="userCSharp:AddToCumulativeSum(0,string(OrderedQuantity/text()),'1000')"/>
        </xsl:for-each>
        <xsl:variable name="var:v3" select="userCSharp:GetCumulativeSum(0)"/>
        <UnitQuantity>
            <xsl:value-of select="$var:v3"/>
        </UnitQuantity>
    </LineItem>
    <!-- Cummulative Sum with scope paramater of "0"  -->
    <LineItem>
        <xsl:variable name="var:v1" select="userCSharp:InitCumulativeSum(0)"/>
        <xsl:for-each select="/Invoice/DetailLoop/LineItem">
            <xsl:variable name="var:v2" select="userCSharp:AddToCumulativeSum(0,string(OrderedQuantity/text()),'0')"/>
        </xsl:for-each>
        <xsl:variable name="var:v3" select="userCSharp:GetCumulativeSum(0)"/>
        <UnitQuantity>
            <xsl:value-of select="$var:v3"/>
        </UnitQuantity>
    </LineItem>
    <!-- Cummulative Sum with scope paramater of "1"  -->
    <LineItem>
        <xsl:for-each select="LineItem">
            <xsl:variable name="var:v1" select="userCSharp:InitCumulativeSum(0)"/>
            <xsl:for-each select="LineItem">
                <xsl:variable name="var:v2" select="userCSharp:AddToCumulativeSum(0,string(OrderedQuantity/text()),'1')"/>
            </xsl:for-each>
            <xsl:variable name="var:v3" select="userCSharp:GetCumulativeSum(0)"/>
            <UnitQuantity>
                <xsl:value-of select="$var:v3"/>
            </UnitQuantity>
        </xsl:for-each>
    </LineItem>
    <!-- Cummulative Sum with scope paramater of "2"  -->
    <LineItem>
        <xsl:variable name="var:v1" select="userCSharp:InitCumulativeSum(0)"/>
        <xsl:for-each select="DetailLoop/LineItem">
            <xsl:variable name="var:v2" select="userCSharp:AddToCumulativeSum(0,string(OrderedQuantity/text()),'2')"/>
        </xsl:for-each>
        <xsl:variable name="var:v3" select="userCSharp:GetCumulativeSum(0)"/>
        <UnitQuantity>
            <xsl:value-of select="$var:v3"/>
        </UnitQuantity>
    </LineItem>
    <!-- Cummulative Sum with scope paramater of "3"  -->
    <LineItem>
        <xsl:variable name="var:v1" select="userCSharp:InitCumulativeSum(0)"/>
        <xsl:for-each select="/Invoice/DetailLoop/LineItem">
            <xsl:variable name="var:v2" select="userCSharp:AddToCumulativeSum(0,string(OrderedQuantity/text()),'2')"/>
        </xsl:for-each>
        <xsl:variable name="var:v3" select="userCSharp:GetCumulativeSum(0)"/>
        <UnitQuantity>
            <xsl:value-of select="$var:v3"/>
        </UnitQuantity>
    </LineItem>
</xsl:stylesheet>
