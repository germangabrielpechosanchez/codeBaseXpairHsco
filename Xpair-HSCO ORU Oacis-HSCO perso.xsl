
   <!-- 
	No. Date       User     Description / commentaires (Optionnel)
	+++ ++++++++++ ++++++++ +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
	 1  2021-04-30 EG        Version normée avec l'équipe de développement
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
      <!-- Inclusion du xsl de base -->
      <xsl:import href="Xpair ORU Oacis.xsl"/>
      <!-- ************************************************************************************************************************* -->
      <!--                                                          XSL PERSO                                                        -->
      <!-- ************************************************************************************************************************* -->
      <!-- options, format de sortie -->
      <!--  <xsl:strip-space elements="*"/>
      <xsl:output omit-xml-declaration="yes" indent="yes" encoding="UTF-8" method="xml" version="1.0"/>
   
      <xsl:template match="/">
         <xsl:element name="HL7">
            <xsl:call-template name="MSH"/>
            <xsl:call-template name="PID"/>
            <xsl:call-template name="OBR"/>
         </xsl:element>  
      </xsl:template>      
   
      <xsl:template name="MSH">
         <xsl:element name="MSH">
   
     
         <xsl:element name="MSH.1.1">
            <xsl:value-of select="/HL7/MSH/MSH.1.1"/>
         </xsl:element>
    
      
     
     
         <xsl:element name="MSH.2.1">
            <xsl:value-of select="/HL7/MSH/MSH.2.1"/>
         </xsl:element>
   
      
      
    
         <xsl:element name="MSH.3.1">
            <xsl:value-of select="/HL7/MSH/MSH.3.1"/>
         </xsl:element>
   
      
      
   
         <xsl:element name="MSH.4.1">
            <xsl:value-of select="'HSCO'"/>
         </xsl:element>
         
         <xsl:element name="MSH.4.2">
            <xsl:value-of select="'12934659'"/>
         </xsl:element> 
     
      
      
         <xsl:element name="MSH.5.1">
            <xsl:value-of select="'HSCO_XPAIR_HL7'"/>
         </xsl:element> 
    
      
     
         <xsl:element name="MSH.6.1">
            <xsl:value-of select="'HSCO'"/>
         </xsl:element> 
      
      
    
         <xsl:element name="MSH.7.1">
            <xsl:value-of select="/HL7/MSH/MSH.7.1"/>
         </xsl:element>
      
      
      
         <xsl:element name="MSH.8.1">
            <xsl:value-of select="/HL7/MSH/MSH.8.1"/>
         </xsl:element>
  
      
     
         <xsl:element name="MSH.9.1">
            <xsl:value-of select="/HL7/MSH/MSH.9.1"/>
         </xsl:element>
         
         <xsl:element name="MSH.9.2">  
            <xsl:value-of select="/HL7/MSH/MSH.9.2"/>
         </xsl:element>
            
      
    
         <xsl:element name="MSH.10.1">
            <xsl:value-of select="/HL7/MSH/MSH.10.1"/>
         </xsl:element>
      
      
     
         <xsl:element name="MSH.11.1">
            <xsl:value-of select="/HL7/MSH/MSH.11.1"/>
         </xsl:element>
            
      
    
         <xsl:element name="MSH.12.1">
            <xsl:value-of select="/HL7/MSH/MSH.12.1"/>
         </xsl:element>
       
      
    
         <xsl:element name="MSH.13.1">
            <xsl:value-of select="/HL7/MSH/MSH.13.1"/>
         </xsl:element>
       
      
     
         <xsl:element name="MSH.14.1">
            <xsl:value-of select="/HL7/MSH/MSH.14.1"/>
         </xsl:element>
       
      
    
         <xsl:element name="MSH.15.1">
            <xsl:value-of select="/HL7/MSH/MSH.15.1"/>
         </xsl:element>
       
      
     
         <xsl:element name="MSH.16.1">
            <xsl:value-of select="/HL7/MSH/MSH.16.1"/>
         </xsl:element>
       
      
    
         <xsl:element name="MSH.17.1">
            <xsl:value-of select="/HL7/MSH/MSH.17.1"/>
         </xsl:element>
       
      
      
         <xsl:element name="MSH.18.1">
            <xsl:value-of select="/HL7/MSH/MSH.18.1"/>
         </xsl:element>

         </xsl:element>
      </xsl:template> 
 
      <xsl:template name="PID">
         <xsl:element name="PID">
            
            <xsl:element name="PID.1.1">
               <xsl:value-of select="/HL7/PID/PID.1.1"/>
            </xsl:element>
            
            <xsl:element name="PID.2.1">
               <xsl:value-of select="/HL7/PID/PID.2.1"/>
            </xsl:element> 
            
            <xsl:element name="PID.3.1">
               <xsl:value-of select="/HL7/PID/PID.3.1"/>
            </xsl:element>
            
            <xsl:variable name="HopitalSantaCabrini" select="'E'"/>
            <xsl:element name="PID.4.1">
               <xsl:value-of select="substring-after(/HL7/PID/PID.4.1[1],$HopitalSantaCabrini)"/>
            </xsl:element> 
            
            <xsl:element name="PID.4.2">
               <xsl:value-of select="/HL7/PID/PID.4.2"/>
            </xsl:element> 
            
            <xsl:element name="PID.4.3">
               <xsl:value-of select="''"/>
            </xsl:element> 
            
            <xsl:element name="PID.4.4">
               <xsl:value-of select="/HL7/PID/PID.4.4"/>
            </xsl:element> 
            
            <xsl:element name="PID.4.5">
               <xsl:value-of select="/HL7/PID/PID.4.5[1]"/>
            </xsl:element> 
            
            <xsl:element name="PID.4.6">
               <xsl:value-of select="/HL7/PID/PID.4.6"/>
            </xsl:element> 
            
            <xsl:element name="PID.4.1">
               <xsl:value-of select="/HL7/PID/PID.4.1[2]"/>
            </xsl:element> 
            
            <xsl:element name="PID.4.2">
               <xsl:value-of select="''"/>
            </xsl:element> 
            
            <xsl:element name="PID.4.3">
               <xsl:value-of select="''"/>
            </xsl:element> 
            
            <xsl:element name="PID.4.4">
               <xsl:value-of select="''"/>
            </xsl:element> 
            
            <xsl:element name="PID.4.5">
               <xsl:value-of select="/HL7/PID/PID.4.5[2]"/>
            </xsl:element> 
            
            <xsl:element name="PID.4.6">
               <xsl:value-of select="''"/>
            </xsl:element> 
            
            <xsl:element name="PID.5.1">
               <xsl:value-of select="/HL7/PID/PID.5.1"/>
            </xsl:element> 
            
            <xsl:element name="PID.5.2">
               <xsl:value-of select="/HL7/PID/PID.5.2"/>
            </xsl:element> 
            
            <xsl:element name="PID.6.1">
               <xsl:value-of select="/HL7/PID/PID.6.1"/>
            </xsl:element>           
            
            <xsl:element name="PID.7.1">
               <xsl:value-of select="/HL7/PID/PID.7.1"/>
            </xsl:element> 
            
            <xsl:element name="PID.8.1">
               <xsl:value-of select="/HL7/PID/PID.8.1"/>
            </xsl:element> 
         </xsl:element>
      </xsl:template>
      
      <xsl:template name="OBR">
         <xsl:element name="OBR">
            <xsl:element name="OBR.1.1">
               <xsl:value-of select="/HL7/OBR/OBR.1.1[1]"/>
            </xsl:element>
            
            <xsl:element name="OBR.2.1">
               <xsl:value-of select="/HL7/OBR/OBR.2.1"/>
            </xsl:element> 
            
            <xsl:element name="OBR.3.1">
               <xsl:value-of select="/HL7/OBR/OBR.3.1"/>
            </xsl:element>
            
            <xsl:element name="OBR.4.1">
               <xsl:value-of select="/HL7/OBR/OBR.4.1"/>
            </xsl:element> 
            
            <xsl:element name="OBR.4.2">
               <xsl:value-of select="/HL7/OBR/OBR.4.2"/>
            </xsl:element> 
            
            <xsl:element name="OBR.5.1">
               <xsl:value-of select="''"/>
            </xsl:element> 
            
            <xsl:element name="OBR.6.1">
               <xsl:value-of select="''"/>
            </xsl:element> 
            
            <xsl:element name="OBR.7.1">
               <xsl:value-of select="/HL7/OBR/OBR.7.1"/>
            </xsl:element> 
            
            <xsl:element name="OBR.8.1">
               <xsl:value-of select="/HL7/OBR/OBR.8.1"/>
            </xsl:element> 
            
            <xsl:element name="OBX">
               <xsl:element name="OBX.1.1">
                  <xsl:value-of select="/HL7/OBR/OBX[1]/OBX.1.1"/>
               </xsl:element>
               
               <xsl:element name="OBX.2.1">
                  <xsl:value-of select="/HL7/OBR/OBX[1]/OBX.2.1"/>
               </xsl:element> 
               
               <xsl:element name="OBX.3.1">
                  <xsl:value-of select="/HL7/OBR/OBX[1]/OBX.3.1"/>
               </xsl:element>
               
               <xsl:element name="OBX.4.1">
                  <xsl:value-of select="''"/>
               </xsl:element> 
               
               <xsl:element name="OBX.5.1">
                  <xsl:value-of select="/HL7/OBR/OBX[1]/OBX.5.1"/>
               </xsl:element> 
               
               <xsl:element name="OBX.5.2">
                  <xsl:value-of select="/HL7/OBR/OBX[1]/OBX.5.2"/>
               </xsl:element> 
            </xsl:element> 
            
            <xsl:element name="OBX">
               <xsl:element name="OBX.1.1">
                  <xsl:value-of select="/HL7/OBR/OBX[2]/OBX.1.1"/>
               </xsl:element>
               
               <xsl:element name="OBX.2.1">
                  <xsl:value-of select="/HL7/OBR/OBX[2]/OBX.2.1"/>
               </xsl:element> 
               
               <xsl:element name="OBX.3.1">
                  <xsl:value-of select="/HL7/OBR/OBX[2]/OBX.3.1"/>
               </xsl:element>
               
               <xsl:element name="OBX.3.2">
                  <xsl:value-of select="/HL7/OBR/OBX[2]/OBX.3.2"/>
               </xsl:element>
               
               <xsl:element name="OBX.4.1">
                  <xsl:value-of select="''"/>
               </xsl:element> 
               
               <xsl:element name="OBX.5.1">
                  <xsl:value-of select="/HL7/OBR/OBX[2]/OBX.5.1"/>
               </xsl:element> 
               
               <xsl:element name="OBX.5.2">
                  <xsl:value-of select="/HL7/OBR/OBX[2]/OBX.5.2"/>
               </xsl:element>
               
               <xsl:element name="OBX.5.3">
                  <xsl:value-of select="/HL7/OBR/OBX[2]/OBX.5.3"/>
               </xsl:element>         
   
               <xsl:element name="OBX.5.4">
                  <xsl:value-of select="/HL7/OBR/OBX[2]/OBX.5.4"/>
               </xsl:element>         
               
               <xsl:element name="OBX.5.5">
                  <xsl:value-of select="/HL7/OBR/OBX[2]/OBX.5.5"/>
               </xsl:element>  
          
               <xsl:element name="OBX.6.1">
                  <xsl:value-of select="/HL7/OBR/OBX[2]/OBX.6.1"/>
               </xsl:element>  
               
               <xsl:element name="OBX.7.1">
                  <xsl:value-of select="/HL7/OBR/OBX[2]/OBX.7.1"/>
               </xsl:element>  
               
               <xsl:element name="OBX.8.1">
                  <xsl:value-of select="/HL7/OBR/OBX[2]/OBX.8.1"/>
               </xsl:element>  
               
               <xsl:element name="OBX.9.1">
                  <xsl:value-of select="/HL7/OBR/OBX[2]/OBX.9.1"/>
               </xsl:element>  
               
               <xsl:element name="OBX.10.1">
                  <xsl:value-of select="/HL7/OBR/OBX[2]/OBX.10.1"/>
               </xsl:element>  
               
               <xsl:element name="OBX.11.1">
                  <xsl:value-of select="/HL7/OBR/OBX[2]/OBX.11.1"/>
               </xsl:element>  
               
            </xsl:element> 
         
         </xsl:element>
      </xsl:template>-->
            
   </xsl:stylesheet>

