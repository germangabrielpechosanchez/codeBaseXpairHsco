
   <!-- 
	No. Date       User     Description / commentaires (Optionnel)
	+++ ++++++++++ ++++++++ +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
	1   2020-11-17 hakara01 Création
	2	2021-04-30 garely01	Normée le fichier xsl
-->
   <xsl:stylesheet xmlns:exsl="http://exslt.org/common"
                   xmlns:functx="http://www.functx.com"
                   xmlns:util="http://whatever"
                   xmlns:xp="http://www.w3.org/2005/xpath-functions"
                   xmlns:xs="http://www.w3.org/2001/XMLSchema"
                   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                   exclude-result-prefixes="#all"
                   extension-element-prefixes="exsl"
                   version="3.0">
      <!-- options, format de sortie -->
      <xsl:strip-space elements="*"/>
      <xsl:output encoding="UTF-8"
                  indent="yes"
                  method="xml"
                  omit-xml-declaration="yes"
                  version="1.0"/>
      <!-- Inclusion des Templates  -->
      <xsl:include href="util-Templates.xsl"/>
      <!-- ************************************************************************************************************************* -->
      <!--                                               Déclaration des paramètres                                                  -->
      <!-- ************************************************************************************************************************* -->
      <xsl:param name="varParam1"/>
      <xsl:param name="varParam2"/>
      <xsl:param name="varParam3"/>
      <xsl:param name="varParam4"/>
      <xsl:param name="varParam5"/>
      <xsl:param name="varParam6"/>
      <xsl:param name="varParam7"/>
      <xsl:param name="varParam8"/>
      <xsl:param name="varParam9"/>
      <!-- ************************************************************************************************************************* -->
      <!--                                          Déclaration des variables perso                                                  -->
      <!-- ************************************************************************************************************************* -->
      <xsl:variable name="persoDocType"/>
      <xsl:variable name="persoDocClassification"/>
      <xsl:variable name="persoPath"/>
      
      <xsl:variable name="persoFilename">
      <xsl:value-of select="concat('xpair-', /HL7/MSH/MSH.7.1)"/>
      </xsl:variable>
      <!-- ************************************************************************************************************************* -->
      <!--                                               Déclaration des variables                                                   -->
      <!-- ************************************************************************************************************************* -->
      <xsl:variable name="pdfAnnule"/>
      <xsl:variable name="pdfEnCours"/>
      <!-- ************************************************************************************************************************* -->
      <!--                                                       Principal                                                  -->
      <!-- ************************************************************************************************************************* -->
      <xsl:template match="/">
         <xsl:element name="MSG_LIST">
            <xsl:call-template name="fichier"/>
            <xsl:call-template name="fichierDeControle"/>
         </xsl:element>
      </xsl:template>
      <!-- ************************************************************************************************************************* -->
      <!--                                                       fichier                                                    -->
      <!-- ************************************************************************************************************************* -->
      <xsl:template name="fichier">
         <xsl:for-each select="/HL7/OBR/OBX[starts-with(OBX.5.5,'JVBER')]">
            <xsl:element name="MSG_ELEMENT">
               <xsl:call-template name="fichier.type"/>
               <xsl:call-template name="fichier.perso"/>
               <xsl:call-template name="fichier.chemin"/>
               <xsl:call-template name="fichier.nom"/>
               <xsl:call-template name="fichier.contenu"/>
               <xsl:call-template name="fichier.ordre">
                  <xsl:with-param name="newValue" select="position()"/>
               </xsl:call-template>
               <xsl:call-template name="fichier.contenuEncodeeEnBase64"/>
            </xsl:element>
         </xsl:for-each>
      </xsl:template>
      <!--fichier.type-->
      <xsl:template name="fichier.type">
         <xsl:element name="type">
            <xsl:value-of select="'fichier'"/>
         </xsl:element>
      </xsl:template>
      <!--fichier.perso-->
      <xsl:template name="fichier.perso">
         <xsl:element name="perso">
            <xsl:element name="statut">
               <xsl:choose>
                  <xsl:when test="./OBX.5.1/text() = 'Annule'">
                     <xsl:value-of select="'Annulé'"/>
                  </xsl:when>
                  <xsl:when test="./OBX.5.1/text() = 'EnCours'">
                     <xsl:value-of select="'EnCours'"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="'Final'"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:element>
         </xsl:element>
      </xsl:template>
      <!--fichier.chemin-->
      <xsl:template name="fichier.chemin">
         <xsl:element name="chemin">
            <xsl:value-of select="$persoPath"/>
         </xsl:element>
      </xsl:template>
      <!--fichier.nom-->
      <xsl:template name="fichier.nom">
         <xsl:element name="nom">
            <xsl:value-of select="concat($persoFilename, '.', format-number(position(), '000'))"/>
         </xsl:element>
      </xsl:template>
      <!--fichier.contenu-->
      <xsl:template name="fichier.contenu">
         <xsl:element name="contenu">
            <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
            <xsl:choose>
               <xsl:when test="./OBX.5.1/text() = 'Annule'">
                  <xsl:value-of select="$pdfAnnule"/>
               </xsl:when>
               <xsl:when test="./OBX.5.1/text() = 'EnCours'">
                  <xsl:value-of select="$pdfEnCours"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="./OBX.5.5/text()"/>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
         </xsl:element>
      </xsl:template>
      <!--fichier.ordre-->
      <xsl:template name="fichier.ordre">
         <xsl:param name="newValue" select="0"/>
         <xsl:element name="ordre">
            <xsl:value-of select="$newValue"/>
         </xsl:element>
      </xsl:template>
      <!--fichier.contenuEncodeeEnBase64-->
      <xsl:template name="fichier.contenuEncodeeEnBase64">
         <xsl:element name="contenuEncodeeEnBase64">
            <xsl:value-of select="'true'"/>
         </xsl:element>
      </xsl:template>
      <!-- ************************************************************************************************************************* -->
      <!--                                                       fichierDeControle                                          -->
      <!-- ************************************************************************************************************************* -->
      <xsl:template name="fichierDeControle">
         <xsl:element name="MSG_ELEMENT">
            <xsl:call-template name="fichierDeControle.type"/>
            <xsl:call-template name="fichierDeControle.perso"/>
            <xsl:call-template name="fichierDeControle.chemin"/>
            <xsl:call-template name="fichierDeControle.nom"/>
            <xsl:call-template name="fichierDeControle.contenu"/>
            <xsl:call-template name="fichierDeControle.ordre"/>
            <xsl:call-template name="fichierDeControle.contenuEncodeeEnBase64"/>
         </xsl:element>
      </xsl:template>
      <!--fichierDeControle.type-->
      <xsl:template name="fichierDeControle.type">
         <xsl:element name="type">
            <xsl:value-of select="'fichierDeControle'"/>
         </xsl:element>
      </xsl:template>
      <!--fichierDeControle.perso-->
      <xsl:template name="fichierDeControle.perso">
         <xsl:element name="perso">
            <xsl:element name="statut"/>
         </xsl:element>
      </xsl:template>
      <!--fichierDeControle.chemin-->
      <xsl:template name="fichierDeControle.chemin">
         <xsl:element name="chemin">
            <xsl:value-of select="$persoPath"/>
         </xsl:element>
      </xsl:template>
      <!--fichierDeControle.nom-->
      <xsl:template name="fichierDeControle.nom">
         <xsl:element name="nom">
            <xsl:value-of select="concat($persoFilename, '.xml')"/>
         </xsl:element>
      </xsl:template>
      <!-- ************************************************************************************************************************* -->
      <!--                                                       fichierDeControle.contenu                                  -->
      <!-- ************************************************************************************************************************* -->
      <xsl:template name="fichierDeControle.contenu">
         <xsl:element name="contenu">
            <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
            <xsl:element name="IndexInfo">
               <xsl:call-template name="IndexInfo.fileCount"/>
               <xsl:call-template name="IndexInfo.mrn"/>
               <xsl:call-template name="IndexInfo.facility"/>
               <xsl:call-template name="IndexInfo.visit"/>
               <xsl:call-template name="IndexInfo.docType"/>
               <xsl:call-template name="IndexInfo.docDate"/>
               <xsl:call-template name="IndexInfo.docClassification"/>
               <xsl:call-template name="IndexInfo.indexingAction"/>
               <xsl:call-template name="IndexInfo.externalSystemIds"/>
               <xsl:call-template name="IndexInfo.manifestId"/>
            </xsl:element>
            <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
         </xsl:element>
      </xsl:template>
      <!--IndexInfo.fileCount-->
      <xsl:template name="IndexInfo.fileCount">
         <xsl:element name="fileCount">
            <xsl:value-of select="count(//HL7/OBR)"/>
         </xsl:element>
      </xsl:template>
      <!--IndexInfo.mrn-->
      <xsl:template name="IndexInfo.mrn">
         <xsl:variable name="HopitalEntity" select="/HL7/MSH/MSH.4.1"/>
         <xsl:element name="mrn">
            <xsl:variable name="HopitalSantaCabrini" select="'E'"/>
            <xsl:variable name="HopitalMaRosemont" select="'I'"/>
            <xsl:choose>
               
               <xsl:when test="$HopitalEntity = 'HMR'">  
                  <xsl:value-of select="substring-after(/HL7/PID/PID.4.1[1]/text(),$HopitalMaRosemont)"/>
               </xsl:when>
  
               <xsl:when test="$HopitalEntity = 'HSCO'">  
                  <xsl:value-of select="substring-after(/HL7/PID/PID.4.1[1]/text(),$HopitalSantaCabrini)"/>
               </xsl:when>
  
            </xsl:choose>
         </xsl:element>
      </xsl:template>
      <!--IndexInfo.facility-->
      <xsl:template name="IndexInfo.facility">
         <xsl:element name="facility">
            <xsl:value-of select="/HL7/MSH/MSH.6.1/text()"/>
         </xsl:element>
      </xsl:template>
      <!--IndexInfo.visit-->
      <xsl:template name="IndexInfo.visit">
         <xsl:element name="visit">
            <xsl:value-of select="//PV1/PV1.19.1/text()"/>
         </xsl:element>
      </xsl:template> 
      <!--IndexInfo.docType-->
      <xsl:template name="IndexInfo.docType">
         <xsl:element name="docType">
            <xsl:value-of select="$persoDocType"/>
         </xsl:element>
      </xsl:template>
      <!--IndexInfo.docDate-->
      <xsl:template name="IndexInfo.docDate">
         <xsl:element name="docDate">
            <xsl:value-of select="concat(substring(/HL7/MSH/MSH.7.1/text(),1,4),'/',substring(/HL7/MSH/MSH.7.1/text(),5,2),'/',substring(/HL7/MSH/MSH.7.1/text(),7,2))"/>
         </xsl:element>
      </xsl:template>
      <!--IndexInfo.docClassification-->
      <xsl:template name="IndexInfo.docClassification">
         <xsl:element name="docClassification">
            <xsl:value-of select="$persoDocClassification"/>
         </xsl:element>
      </xsl:template>
      <!--IndexInfo.indexingAction-->
      <xsl:template name="IndexInfo.indexingAction">
         <xsl:element name="indexingAction">R</xsl:element>
      </xsl:template>
      <!--IndexInfo.externalSystemIds-->
      <xsl:template name="IndexInfo.externalSystemIds">
         <xsl:element name="externalSystemIds">
            <xsl:call-template name="externalSystemIds.externalSystemId"/>
         </xsl:element>
      </xsl:template>
      <!--externalSystemIds.externalSystemId-->
      <xsl:template name="externalSystemIds.externalSystemId">
         <xsl:element name="externalSystemId">
            <xsl:call-template name="externalSystemId.externalSystem"/>
            <xsl:call-template name="externalSystemId.externalId"/>
         </xsl:element>
      </xsl:template>
      <!--externalSystemId.externalSystem-->
      <xsl:template name="externalSystemId.externalSystem">
         <xsl:element name="externalSystem">
            <xsl:value-of select="'XPAIR'"/>
         </xsl:element>
      </xsl:template>
      <!--externalSystemId.externalId-->
      <xsl:template name="externalSystemId.externalId">
         <xsl:element name="externalId">
            <xsl:value-of select="concat(/HL7/MSH/MSH.3.1/text(),'_',/HL7/MSH/MSH.7.1/text())"/>
         </xsl:element>
      </xsl:template>
      <!--externalSystemId.manifestId-->
      <xsl:template name="IndexInfo.manifestId">
         <xsl:element name="manifestId">
            <xsl:value-of select="concat(/HL7/MSH/MSH.3.1/text(),'_',/HL7/MSH/MSH.7.1/text())"/>
         </xsl:element>
      </xsl:template>
      <!--fichierDeControle.ordre-->
      <xsl:template name="fichierDeControle.ordre">
         <xsl:element name="ordre">
            <xsl:value-of select="count(//HL7/OBR/OBX) + 1"/>
         </xsl:element>
      </xsl:template>
      <!--fichierDeControle.contenuEncodeeEnBase64-->
      <xsl:template name="fichierDeControle.contenuEncodeeEnBase64">
         <xsl:element name="contenuEncodeeEnBase64">false</xsl:element>
      </xsl:template>
   </xsl:stylesheet>

