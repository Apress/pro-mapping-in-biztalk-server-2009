<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>


<!-- Select all Item records that have no sub-item part number -->    
<xsl:for-each select="//DetailLoop/LineItem[ SubPartNumber = '' ]">
    <xsl:variable name="CurrentPartID">
        <xsl:value-of select="PartNumber"/>
    </xsl:variable>
<!-- Write out an ItemInfo Loop and an ItemNumber node-->    
    <xsl:element name="ItemInfo">
        <xsl:element name="ItemNumber">
            <xsl:value-of select="$CurrentPartID"/>
        </xsl:element>

<!-- For the current ParentPartID, select Item nodes where the PartNumber is equal to the 
      current part, and the SubPartNumber is not empty -->    
        <xsl:for-each select="//DetailLoop/LineItem[ PartNumber = $CurrentPartID 
                                                 and SubPartNumber != '' ]">
            <xsl:variable name="ChildPart">
                <xsl:value-of select="SubPartNumber"/>
            </xsl:variable>

<!-- Write out a SubItemInfo loop and a SubItemPart for the current ChildPart -->    
            <xsl:element name="SubItemInfo">
                <xsl:element name="SubItemPart">
                    <xsl:value-of select="$ChildPart"/>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:element>
</xsl:for-each>

    
    
</xsl:stylesheet>
