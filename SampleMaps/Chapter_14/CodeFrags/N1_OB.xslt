<xsl:template name="N1STLoop">
<xsl:template name="N1OBLoop">
        <xsl:param name="SICCode"/>
        <xsl:param name="Attribute6"/>
        <xsl:if test="$SICCode != '' or $Attribute6 != '' ">
            <xsl:element name="ns0:N1_Party_Identification_S7">
                <xsl:element name="ns0:_98_Entity_Identifier_Code_E1">OB</xsl:element>
                <xsl:element name="ns0:_66_Identification_Code_Qualifier_E3">92</xsl:element>
                <xsl:element name="ns0:_67_Identification_Code_E4">
                    <xsl:choose>
                        <xsl:when test="SICCode != '' ">
                            <xsl:value-of select="$SICCode"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$Attribute6"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:element>
            </xsl:element>
        </xsl:if>
    </xsl:template>