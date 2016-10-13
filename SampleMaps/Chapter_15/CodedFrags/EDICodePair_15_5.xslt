<xsl:template name="PutMessage">
    <xsl:param name="PONumber"/>
    <xsl:param name="PODate"/>
    <xsl:param name="Currency"/>
    <xsl:param name="Contract"/>
    <xsl:param name="ScheduleDate"/>
    <xsl:param name="CancelDate"/>

    <xsl:if test="$PONumber != '' ">
        <xsl:call-template name="BuildMessageSegment">
            <xsl:with-param name="Qual" select=" 'PON' "/>
            <xsl:with-param name="Text" select="$PONumber"/>
        </xsl:call-template>
    </xsl:if>
    <xsl:if test="$PODate != '' ">
        <xsl:call-template name="BuildMessageSegment">
            <xsl:with-param name="Qual" select=" 'POD' "/>
            <xsl:with-param name="Text" select="translate($PODate,'-','')"/>
        </xsl:call-template>
    </xsl:if>
    <xsl:if test="$Contract != '' ">
        <xsl:call-template name="BuildMessageSegment">
            <xsl:with-param name="Qual" select=" 'CON' "/>
            <xsl:with-param name="Text" select="$Contract"/>
        </xsl:call-template>
    </xsl:if>
    <xsl:if test="$Currency != '' ">
        <xsl:call-template name="BuildMessageSegment">
            <xsl:with-param name="Qual" select=" 'CUR' "/>
            <xsl:with-param name="Text" select="$Currency"/>
        </xsl:call-template>
    </xsl:if>
    <xsl:if test="$ScheduleDate != '' ">
        <xsl:call-template name="BuildMessageSegment">
            <xsl:with-param name="Qual" select=" 'SSD' "/>
            <xsl:with-param name="Text" select="$ScheduleDate"/>
        </xsl:call-template>
    </xsl:if>
    <xsl:if test="$CancelDate != '' ">
        <xsl:call-template name="BuildMessageSegment">
            <xsl:with-param name="Qual" select=" 'RSD' "/>
            <xsl:with-param name="Text" select="$CancelDate"/>
        </xsl:call-template>
    </xsl:if>
</xsl:template>

<xsl:template name="BuildMessageSegment">
    <xsl:param name="Qual"/>
    <xsl:param name="Text"/>
    <xsl:if test="$Qual != '' and $Text != '' ">
        <xsl:element name="Message">
            <xsl:element name="MsgType">
                <xsl:value-of select="$Qual"/>
            </xsl:element>
            <xsl:element name="MsgText">
                <xsl:value-of select="$Text"/>
            </xsl:element>
        </xsl:element>
    </xsl:if>
</xsl:template>