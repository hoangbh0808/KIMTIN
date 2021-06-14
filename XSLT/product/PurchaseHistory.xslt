<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="table-wrapper">
      <table class="table-admin-stripe" cellspacing="0" cellpadding="0">
        <thead>
          <tr>
            <th>
              <xsl:value-of select="/OrderList/OrderCodeLabel"></xsl:value-of>
            </th>
            <th>
              <xsl:value-of select="/OrderList/OrderProductLabel"></xsl:value-of>
            </th>
            <th>
              <xsl:value-of select="/OrderList/OrderDateLabel"></xsl:value-of>
            </th>
            <th>
              <xsl:value-of select="/OrderList/OrderTotalLabel"></xsl:value-of>
            </th>
            <th>
              <xsl:value-of select="/OrderList/OrderStatusLabel"></xsl:value-of>
            </th>
          </tr>
        </thead>
        <tbody>
          <xsl:apply-templates select="/OrderList/Order"></xsl:apply-templates>
        </tbody>
      </table>
    </div>
  </xsl:template>
  <xsl:template match="Order">
    <tr>
      <td>
        <a>
        <xsl:attribute name="href">
        <xsl:text>/account/OrderView.aspx?ordercode=</xsl:text>
        <xsl:value-of select="OrderCode"/>
        </xsl:attribute> 
          <xsl:attribute name="target">
            <xsl:value-of select="Target"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="title">
            <xsl:value-of select="OrderCode"></xsl:value-of>
          </xsl:attribute>
          <xsl:value-of select="OrderCode"></xsl:value-of>
        </a>
      </td>
      <td>
        <div class="text">
          <xsl:apply-templates select="Product"></xsl:apply-templates>
        </div>
      </td>
      <td>
        <xsl:value-of select="OrderDate"></xsl:value-of>
      </td>
      <td align="right">
        <xsl:value-of select="OrderTotal"></xsl:value-of>
      </td>
      <td align="right">
        <div class="status news">
          <xsl:value-of select="OrderStatus"></xsl:value-of>
        </div>
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="Product">
    <xsl:if test="position()=1">
      <label>
        <xsl:value-of select="Title"></xsl:value-of>
      </label>
      <xsl:text> ...</xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
