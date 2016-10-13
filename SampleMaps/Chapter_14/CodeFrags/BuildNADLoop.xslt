<!--******************************************************
Creates an output NAD Loop 
*******************************************************-->
<xsl:template name="BuildNADLoop">
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

    <xsl:if test="$Name != ''  ">
        <xsl:element name = "ns0:NADLoop1">
            <xsl:element name="ns0:NAD">
                <xsl:element name="NAD01"><xsl:value-of select="$Qual"/></xsl:element>
                
                <xsl:if test="$IDCode != '' and $IDQual != ''  ">
                    <xsl:element name="ns0:C082">
                        <xsl:element name="C08201"><xsl:value-of select="$IDCode"/></xsl:element>
                        <xsl:element name="C08203"><xsl:value-of select="$IDQual"/></xsl:element>
                    </xsl:element>
                </xsl:if>

                <xsl:if test="$Name != '' ">
                    <xsl:element name="ns0:C080">
                        <xsl:element name="C08001"><xsl:value-of select="$Name"/></xsl:element>
                    </xsl:element>
                </xsl:if>

                <xsl:if test="$Address1 != '' ">
                    <xsl:element name="ns0:C059">
                        <xsl:element name="C05901"><xsl:value-of select="$Address1"/></xsl:element>
                        <xsl:if test="$Address2 != '' ">
                            <xsl:element name="C05902"><xsl:value-of select="$Address2"/></xsl:element>
                        </xsl:if>
                        <xsl:if test="$Address3 != '' ">
                            <xsl:element name="C05903"><xsl:value-of select="$Address3"/></xsl:element>
                        </xsl:if>
                        <xsl:if test="$Address4 != '' ">
                            <xsl:element name="C05904"><xsl:value-of select="$Address4"/></xsl:element>
                        </xsl:if>
                    </xsl:element>
                </xsl:if> 

                <xsl:if test="$City != '' ">
                    <xsl:element name="NAD06"><xsl:value-of select="$City"/></xsl:element>
                </xsl:if>

                <xsl:if test="$State != '' ">
                    <xsl:element name="ns0:C819">
                        <xsl:element name="C81901"><xsl:value-of select="$State"/></xsl:element>
                    </xsl:element>
                </xsl:if>

                <xsl:if test="$Zip != '' ">
                    <xsl:element name="NAD08"><xsl:value-of select="$Zip"/></xsl:element>
                </xsl:if>

                <xsl:if test="$Country != '' ">
                    <xsl:element name="NAD09"><xsl:value-of select="$Country"/></xsl:element>
                </xsl:if>
            </xsl:element>
        </xsl:element>
    </xsl:if>
</xsl:template>
