<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

<!-- Code fragment showing how to block output if no data is present in the source node.--> 
<xsl:variable name="inName"  select="//HeaderRecord/UserLastName"/> 
<xsl:if test="$inName != '' ">
    <AddressRecord2>
        <FullName><xsl:value-of select="$inName"/></FullName>
    </AddressRecord2>
</xsl:if>

<!-- Code fragment to extract one element based on the value of another element--> 
<xsl:if test="//HeaderRecord/UserCode = 'BY' ">
    <AddressRecord2>
        <FullName><xsl:value-of select="//HeaderRecord/UserLastName"/></FullName>
    </AddressRecord2>
</xsl:if>

<!-- Code fragment to extract one element based on the value of another element--> 
	<FullName>
	  <xsl:value-of select="//HeaderRecord[ UserCode = 'BY' ]/UserLastName"/>
	</FullName>

<!-- Code fragment to extract one element based on the value of another element--> 
<AddressRecord2>
	<FullName>
	  <xsl:value-of select="//HeaderRecord[ UserCode != 'BY' ]/UserLastName"/>
	</FullName>
</AddressRecord2>

<FullName>
  <xsl:if test="//UserCode = 'BY' ">
	<xsl:value-of select="//UserLastName"/>
  </xsl:if>
  <xsl:if test="//HeaderRecord/UserCode != 'BY' ">
	<xsl:value-of select=" 'NO SHIPPER NAME"/>
  </xsl:if>
</FullName>


<FullName>
  <xsl:choose>
	<xsl:when test="//UserCode = 'BY' ">
	    <xsl:value-of select="//UserLastName"/>
	</xsl:when>
	<xsl:otherwise>NO SHIPPER NAME</xsl:otherwise>
  </xsl:choose>
</FullName>

<FullName>
  <xsl:choose>
    <xsl:when test="//UserCode = 'SH'">Shipper</xsl:when>
    <xsl:when test="//UserCode = 'ST'">Ship To</xsl:when>
    <xsl:when test="//UserCode = 'BY'">Buyer</xsl:when>
    <xsl:otherwise>Unknown Address Type</xsl:otherwise>
  </xsl:choose>
</FullName> 

</xsl:stylesheet>
