<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0" version="1.0" xmlns:s0="http://schemas.microsoft.com/BizTalk/EDI/X12/2006">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:X12_00401_850" />
  </xsl:template>
  <xsl:template match="/s0:X12_00401_850">
    <Orders>
      <HeaderInfo>
        <TestFlag>
          <xsl:text>T</xsl:text>
        </TestFlag>
        <DocumentID>
          <xsl:text>850</xsl:text>
        </DocumentID>
        <DocumentType>
          <xsl:text>PurchaseOrder</xsl:text>
        </DocumentType>
        <DocumentPurposeCode>
          <xsl:text>OR</xsl:text>
        </DocumentPurposeCode>
        <DocumentCode>
          <xsl:text>850</xsl:text>
        </DocumentCode>
      </HeaderInfo>
      <DetailLoop>
        <xsl:for-each select="s0:PO1Loop1">
          <LineItem>
            <xsl:if test="s0:PO1/PO101">
              <LineNumber>
                <xsl:value-of select="s0:PO1/PO101/text()" />
              </LineNumber>
            </xsl:if>
            <xsl:for-each select="s0:PO1/child::*[text()='IB']">
                <!--xsl:variable name="IDList" select="./following-sibling::*[1]" /-->
                <VendorPart><xsl:value-of select="./following-sibling::*[1]" /></VendorPart>
            </xsl:for-each>
            <xsl:if test="s0:PO1/PO102">
              <OrderedQuantity>
                <xsl:value-of select="s0:PO1/PO102/text()" />
              </OrderedQuantity>
            </xsl:if>
            <xsl:if test="s0:PO1/PO103">
              <QuantityUOM>
                <xsl:value-of select="s0:PO1/PO103/text()" />
              </QuantityUOM>
            </xsl:if>
            <xsl:if test="s0:PO1/PO104">
              <Price>
                <xsl:value-of select="s0:PO1/PO104/text()" />
              </Price>
            </xsl:if>
            <xsl:if test="s0:PO1/PO105">
              <PriceUOM>
                <xsl:value-of select="s0:PO1/PO105/text()" />
              </PriceUOM>
            </xsl:if>
          </LineItem>
        </xsl:for-each>
      </DetailLoop>
    </Orders>
  </xsl:template>
</xsl:stylesheet>