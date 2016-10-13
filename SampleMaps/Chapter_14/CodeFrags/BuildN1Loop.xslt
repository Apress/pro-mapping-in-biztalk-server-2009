<!--******************************************************
Creates an output N1 Loop 
*******************************************************-->
<xsl:template name="BuildN1Loop">
    <xsl:param name="Qual"/>
    <xsl:param name="Name"/>
    <xsl:param name="IDQual"/>
    <xsl:param name="IDCode"/>
    <xsl:param name="Address1"/>
    <xsl:param name="Address2"/>
    <xsl:param name="Address3"/>
    <xsl:param name="Address4"/>
    <xsl:param name="City"/>
    <xsl:param name="State"/>
    <xsl:param name="Zip"/>
    <xsl:param name="Country"/>

    <xsl:if test="$Name != '' or $IDCode != '' ">
        <xsl:element name = "ns0:N1Loop1">
            <xsl:element name="ns0:N1">
                <xsl:element name="N101"><xsl:value-of select="$Name"/></xsl:element>
                <xsl:if test="$Name != '' ">
                    <xsl:element name="N102">
                        <xsl:value-of select="substring($Name,1,35)"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="$IDCode != '' and $IDQual != '' ">
                    <xsl:element name="N103"><xsl:value-of select="$IDQual"/></xsl:element>
                    <xsl:element name="N104"><xsl:value-of select="$IDCode"/></xsl:element>
                </xsl:if>
        
                <xsl:if test="$Address1 != '' or $Address2 != '' ">
                    <xsl:element name="ns0:N3">
                        <xsl:choose>
                            <xsl:when test="$Address1 != '' ">
                                <xsl:element name="N301">
                                    <xsl:value-of select="$Address1"/>
                                </xsl:element>
                                <xsl:if test="$Address2 != '' ">
                                    <xsl:element name="N302">
                                        <xsl:value-of select="$Address2"/>
                                    </xsl:element>
                                </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:element name="N301">
                                    <xsl:value-of select="$Address2"/>
                                </xsl:element>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:element>
                </xsl:if>
        
                <xsl:if test="$Address3 != '' or $Address4 != '' ">
                    <xsl:element name="ns0:N3">
                        <xsl:choose>
                            <xsl:when test="$Address3 != '' ">
                                <xsl:element name="N301">
                                    <xsl:value-of select="$Address3"/>
                                </xsl:element>
                                <xsl:if test="$Address4 != '' ">
                                    <xsl:element name="N302">
                                        <xsl:value-of select="$Address4"/>
                                    </xsl:element>
                                </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:element name="N301">
                                    <xsl:value-of select="$Address4"/>
                                </xsl:element>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:element>
                </xsl:if>
                
                <xsl:variable name="n4" select="concat($City, $State, $Zip, $Country)"/>
                <xsl:if test="$n4 != ''">
                    <xsl:element name="ns0:N4">
                        <xsl:if test="$City != ''">
                            <xsl:element name="N401">
                                <xsl:value-of select="substring($City,1,19)"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="$State != ''">
                            <xsl:element name="N402">
                                <xsl:value-of select="substring($State,1,2)"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="$Zip != ''">
                            <xsl:element name="N403">
                                <xsl:value-of select="substring(translate($Zip,'-',''),1,9)"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="$Country != ''">
                            <xsl:element name="N404">
                                <xsl:value-of select="substring($Country,1,2)"/>
                            </xsl:element>
                        </xsl:if>
                    </xsl:element>
                </xsl:if>

            </xsl:element>
        </xsl:element>
    </xsl:if>
</xsl:template>
