<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:f="http://hl7.org/fhir">
  <xsl:output method="text"/>
  <xsl:template match="f:StructureDefinition"><xsl:result-document href="{concat(f:id/@value,'-summary.md')}" method="text">This profile contains the following variations from [<xsl:value-of select="f:type/@value"/>](<xsl:value-of select="replace(f:baseDefinition/@value,'http://hl7.org/fhir/StructureDefinition/','http://hl7.org/fhir/STU3/')"/>):

<xsl:apply-templates select="f:differential/f:element[ fn:position() != 1]"/>
</xsl:result-document>
 </xsl:template>
  <xsl:template match="f:element">
    <xsl:variable name="idvalue" select="@id"/>
    <xsl:variable name="parts" select="fn:tokenize(f:path/@value,'\.')"/>
    <xsl:variable name="rname" select="concat($parts[1],'.')"/>
    
    <xsl:if test="(f:sliceName or ( (f:slicing or count($parts)=2) and not(contains(f:path/@value,'.extension')))) ">
      <xsl:if test="f:sliceName and not(contains(f:path/@value,'.extension')) and not(f:type/f:code[@value='Reference'])"><xsl:text>&#x20;&#x20;&#x20;</xsl:text></xsl:if>
      <xsl:if test="not(f:sliceName) or f:type/f:code[@value='Reference']">1. <xsl:apply-templates select="//f:snapshot/f:element[@id = $idvalue]" mode="card"/><xsl:text> </xsl:text>&lt;span style='color:green'&gt;<xsl:value-of select="replace(f:path/@value, $rname, '')"/>&lt;/span&gt;<xsl:if test="f:type/f:code/@value='Reference' and f:short/@value and not(f:slicing)"> as</xsl:if><xsl:text> </xsl:text><xsl:value-of select="f:short/@value"/></xsl:if>
      <xsl:if test="f:sliceName">
        <xsl:if test="f:short and ( (count($parts)=2 and $parts[count($parts)] = 'extension' ) or not(contains(f:path/@value,'.extension')) and not(f:type/f:code[@value='Reference']) )"><xsl:if test="$parts[count($parts)] = 'extension' and count($parts)=2">1. <xsl:apply-templates select="//f:snapshot/f:element[@id = $idvalue]" mode="card"/></xsl:if><xsl:if test="not(contains(f:path/@value,'.extension'))">* <xsl:apply-templates select="//f:snapshot/f:element[@id = $idvalue]" mode="card"/></xsl:if><xsl:if test="f:type/f:code/@value='Reference' and f:short/@value and not(f:slicing)"> as</xsl:if><xsl:text> </xsl:text><xsl:value-of select="f:short/@value"/>
        <xsl:if test="$parts[count($parts)] = 'extension'"> extension</xsl:if></xsl:if>
      </xsl:if>
      <xsl:if test="f:sliceName and not(contains(f:path/@value,'.extension'))"><xsl:text>&#x20;slice</xsl:text></xsl:if>
      <xsl:if test="(f:sliceName or f:short or f:slicing or count($parts)=2) and ( (count($parts)=2 and $parts[count($parts)] = 'extension' ) or not(contains(f:path/@value,'.extension')))"><xsl:if test="f:slicing"> sliced</xsl:if><xsl:text>
</xsl:text></xsl:if>
      
    </xsl:if>
    <xsl:if test="not(contains(f:path/@value,'.extension'))">
      <xsl:apply-templates select="following-sibling::f:element[1]" mode="ext"/>
    </xsl:if>
  </xsl:template>
  <xsl:template match="f:element" mode="ext">
    <xsl:variable name="idvalue" select="@id"/>
   <xsl:variable name="parts" select="fn:tokenize(f:path/@value,'\.')"/>
    <xsl:if test="f:sliceName and $parts[count($parts)] = 'extension'">
      <xsl:text>&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;</xsl:text>
      <xsl:if test="f:short">* <xsl:apply-templates select="//f:snapshot/f:element[@id = $idvalue]" mode="card"/><xsl:text> </xsl:text><xsl:value-of select="f:short/@value"/> extension</xsl:if>
      <xsl:if test="not(f:short)">* <xsl:apply-templates select="//f:snapshot/f:element[@id = $idvalue]" mode="card"/><xsl:text> </xsl:text><xsl:value-of select="f:sliceName/@value"/> extension</xsl:if>
      <xsl:text>
</xsl:text>
    </xsl:if>
    <xsl:if test="$parts[count($parts)]= 'extension'">
      <xsl:apply-templates select="following-sibling::f:element[1]" mode="ext"/>
    </xsl:if>
  </xsl:template>
  <xsl:template match="f:element" mode="card">
     <xsl:if test="f:min/@value='0' and f:max/@value='1'">at most one</xsl:if>
     <xsl:if test="f:min/@value='0' and f:max/@value='*'">zero or more</xsl:if>
     <xsl:if test="f:min/@value='0' and f:max/@value!='1' and f:max/@value!='*'">zero to <xsl:value-of select="f:max/@value"/></xsl:if>
     <xsl:if test="(f:min/@value='1' and f:max/@value='1') or (not(f:max) and not(f:min))">exactly one</xsl:if>
     <xsl:if test="f:min/@value='1' and f:max/@value='*'">one or more</xsl:if>
     <xsl:if test="f:min/@value='1' and f:max/@value!='1' and f:max/@value!='*'">one to <xsl:value-of select="f:max/@value"/></xsl:if>
     
  </xsl:template>
</xsl:stylesheet>
