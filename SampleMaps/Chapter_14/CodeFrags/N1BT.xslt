<xsl:for-each select="N1[ ENTITY_ID_CODE = 'BY' ]">
    <xsl:call-template name="BuildN1Loop">
        <xsl:with-param name="Qual" select="ENTITY_ID_CODE"/>
        <xsl:with-param name="Name" select="NAME"/>
        <xsl:with-param name="IDQual" select="IDENTIFICATION_CODE_QUALIFIER"/>
        <xsl:with-param name="IDCode" select="IDENTIFICATION_CODE"/>
    </xsl:call-template>
</xsl:for-each>
<!-- Call N1Build for ST loop here for Shipment here -->
<xsl:for-each select="N1[ ENTITY_ID_CODE = 'ST' ]">
    <xsl:call-template name="BuildN1Loop">
        <xsl:with-param name="Qual" select="ENTITY_ID_CODE"/>
        <xsl:with-param name="Name" select="NAME"/>
        <xsl:with-param name="IDQual" select="IDENTIFICATION_CODE_QUALIFIER"/>
        <xsl:with-param name="IDCode" select="IDENTIFICATION_CODE"/>
    </xsl:call-template>
</xsl:for-each>
