<!-- N3 loop to generate multiple output address nodes from one or two N3 segmengts-->
<xsl:template name="N103Template" xmlns:ns0="http://www.covast.com/schemas/EDI/Accelerator2006">

<!-- Collect N301 from the first N3 loop.   If present, concatenate with a pipe-->
<xsl:variable name = "N301a">
    <xsl:if test="./*[local-name()='N3'][1]/*[local-name()='N301'] != '' ">
        <xsl:value-of select="concat( ./*[local-name()='N3'][1]/*[local-name()='N301'] , '|')"/>
    </xsl:if>
</xsl:variable> 
<!-- Collect N302 from the first N3 loop   If present, concatenate with a pipe-->
<xsl:variable name = "N302a">
    <xsl:if test="./*[local-name()='N3'][1]/*[local-name()='N302'] != '' ">
        <xsl:value-of select="concat( ./*[local-name()='N3'][1]/*[local-name()='N302'] , '|')"/>
    </xsl:if>
</xsl:variable> 
<!-- Collect N301 from the second N3 loop   If present, concatenate with a pipe-->
<xsl:variable name = "N301b">
    <xsl:if test="./*[local-name()='N3'][2]/*[local-name()='N301'] != '' ">
        <xsl:value-of select="concat( ./*[local-name()='N3'][2]/*[local-name()='N301'] , '|')"/>
    </xsl:if>
</xsl:variable> 
<!-- Collect N302 from the second N3 loop   If present, concatenate with a pipe-->
<xsl:variable name = "N302b">
    <xsl:if test="./*[local-name()='N3'][2]/*[local-name()='N302'] != '' ">
        <xsl:value-of select="concat( ./*[local-name()='N3'][2]/*[local-name()='N302'] , '|')"/>
    </xsl:if>
</xsl:variable> 

<!-- Concatenate all variables, creating a pipe delimited string-->
<xsl:variable name="AddrString1" select="concat($N301a, $N302a, $N301b, $N302b)"/>
<!-- If the string has data, remove the first address and write to AddressLine1-->
<xsl:if test="$AddrString1 != '' ">
	<AddressLine1><xsl:value-of select="substring-before($AddrString1, '|' )"/></AddressLine1>
</xsl:if>

<!-- If the AddrString 1 has data, create AddrString 2 with any data after the first pipe
      if the new string has any data, write it out to AddressLine2-->
<xsl:variable name="AddrString2" select="substring-after($AddrString1, '|') "/>
<xsl:if test="$AddrString2 != '' ">
	<AddressLine2><xsl:value-of select="substring-before($AddrString2, '|' )"/></AddressLine2>
</xsl:if>

<!-- If the AddrString 2 has data, create AddrString 3 with any data after the first pipe
      if the new string has any data, write it out to AddressLine3-->
<xsl:variable name="AddrString3" select="substring-after($AddrString2, '|' )"/>
<xsl:if test="$AddrString3 != '' ">
	<AddressLine3><xsl:value-of select="substring-before($AddrString3, '|' )"/></AddressLine3>
</xsl:if>

<!-- If the AddrString 3 has data, create AddrString 4 with any data after the first pipe
      if the new string has any data, write it out to AddressLine4-->
<xsl:variable name="AddrString4" select="substring-after($AddrString3, '|' )"/>
<xsl:if test="$AddrString4 != '' ">
	<AddressLine4><xsl:value-of select="substring-before($AddrString4, '|' )"/></AddressLine4>
</xsl:if>

</xsl:template>
