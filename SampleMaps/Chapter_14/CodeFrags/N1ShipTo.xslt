<xsl:template name="N1STLoop">
    <xsl:param name="Name"/>
    <xsl:param name="Address2"/>
    <xsl:param name="Address3"/>
    <xsl:param name="Address4"/>
    <xsl:param name="City"/>
    <xsl:param name="State"/>
    <xsl:param name="Zip"/>
    <xsl:param name="Country"/>

    <xsl:variable name="n4" select="concat($City, $State, $Zip, $Country)"/>
    <xsl:element name="ns0:N1_Party_Identification_S7">
        <xsl:element name="ns0:_98_Entity_Identifier_Code_E1">ST</xsl:element>
        <xsl:element name="ns0:_93_Name_E2">
            <xsl:value-of select="$Name"/>
        </xsl:element>

        <xsl:if test="$Address2 != '' ">
            <xsl:element name="ns0:N3_Party_Location_S9">
                        <xsl:element name="ns0:_166_Address_Information_E1">
                            <xsl:value-of select="$Address2"/>
                        </xsl:element>
            </xsl:element>
        </xsl:if>
        <xsl:if test="$Address3 != '' or $Address4 != '' ">
            <xsl:element name="ns0:N3_Party_Location_S9">
                <xsl:choose>
                    <xsl:when test="$Address3 != '' ">
                        <xsl:element name="ns0:_166_Address_Information_E1">
                            <xsl:value-of select="$Address3"/>
                        </xsl:element>
                        <xsl:if test="$Address4 != '' ">
                            <xsl:element name="ns0:_166_Address_Information_E2">
                                <xsl:value-of select="$Address4"/>
                            </xsl:element>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="ns0:_166_Address_Information_E1">
                            <xsl:value-of select="$Address4"/>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>
        </xsl:if>
        <xsl:if test="$n4 != ''">
            <xsl:element name="ns0:N4_Geographic_Location_S10">
                <xsl:if test="$City != ''">
                    <xsl:element name="ns0:_19_City_Name_E1">
                        <xsl:value-of select="$City"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="$State != ''">
                    <xsl:element name="ns0:_156_State_or_Province_Code_E2">
                        <xsl:value-of select="$State"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="$Zip != ''">
                    <xsl:element name="ns0:_116_Postal_Code_E3">
                        <xsl:value-of select="$Zip"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="$Country != ''">
                    <xsl:element name="ns0:_26_Country_Code_E4">
                        <xsl:value-of select="$Country"/>
                    </xsl:element>
                </xsl:if>
            </xsl:element>
        </xsl:if>
    </xsl:element>
</xsl:template>