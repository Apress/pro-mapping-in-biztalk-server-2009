<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

<!-- Code fragment showing how to pick out an ID code Qualifier from the PO1 segment and then pull the associated code.--> 

<xsl:for-each select="./s0:PO1/child::*[text()='IB']">
        <xsl:variable name="IDList" select="./following-sibling::*[1]"/>
        <ItemDescription><xsl:value-of select="$IDList"/></ItemDescription>
</xsl:for-each>


</xsl:stylesheet>
