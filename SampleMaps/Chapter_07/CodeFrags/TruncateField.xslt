<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

<!-- Code fragment showing how to pick out an ID code Qualifier from the LIN segment and then pull the associated code.--> 

<xsl:template name="TruncatePartDescription">
    <xsl:param name="inPart"/>
    <PartDescription><xsl:value-of select="substring($inPart,1,40)"/></PartDescription>
</xsl:template>


</xsl:stylesheet>
