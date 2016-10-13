<!-- Build the Messsage loop from a delimited string-->
    <xsl:template name="PutMessage">
        <xsl:param name="inString"/>
<!-- If inString is empty, exit the processing loop-->
        <xsl:if test="$inString != '' ">
            <!-- Extract the leading pair of data into $Next1 -->
            <xsl:variable name="Next1">
                <xsl:value-of select="substring-before($inString, '|')"/>
            </xsl:variable>
<!-- Extract the qualifier into variable $Qual from $Next1-->
            <xsl:variable name="Qual">
                <xsl:value-of select="substring-before($Next1, '~')"/>
            </xsl:variable>
<!-- Extract the Reference Number into variable $Text from $Next1-->
            <xsl:variable name="Text">
                <xsl:value-of select="substring-after($Next1, '~')"/>
            </xsl:variable>
<!-- Build the output element from current variables-->
            <xsl:if test=" $Qual != '' and $Text != '' ">
                <xsl:element name="Message">
                    <xsl:element name="MsgType">
                        <xsl:value-of select="$Qual"/>
                    </xsl:element>
                    <xsl:element name="MsgText">
                        <xsl:value-of select="$Text"/>
                    </xsl:element>
                </xsl:element>
            </xsl:if>
<!-- Call the template again after removing the leading set of data -->
            <xsl:call-template name="PutMessage">
                <xsl:with-param name="inString" select="substring-after($inString, '|' )"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>