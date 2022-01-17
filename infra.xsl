<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
				<body>
					<h1 style="text-align:center">Hospital Infrastructure Details</h1>
					<xsl:apply-templates select = "Hospital/Infrastructure" /> 
					<table border="2" align="center">
						<tr>
							<th>Room_No</th>
		                    <th>Floor_No</th>
		                    <th>Facility_Name</th>
		                    <th>Availability</th>
		                    <th>Fare</th>
		                    <th>no_of_facility</th>
		                </tr>

		                <xsl:for-each select="Hospital/Infrastructure">
		                	<xsl:sort select="Room_No" order="ascending"/>
		                	<xsl:if test="Fare &lt; 15000">
		                	<tr>
		                		<td>
		                			<xsl:value-of select="Room_No"/>
		                		</td>
		                		<td>
		                			<xsl:value-of select="Floor_No"/>
		                        <td>
		                            <xsl:value-of select="Facility_Name"/>
		                        </td>
		                        <td>
		                            <xsl:value-of select="Fare"/>
		                        </td>
		                        <td>
		                            <xsl:value-of select="no_of_facility"/>
		                        </td>
		                        <td>
		                        	<xsl:choose>
		                        		<xsl:when test="no_of_facility &gt; 0">
									     Many seats are available
									    </xsl:when>
									    <xsl:otherwise>not available</xsl:otherwise>
							        </xsl:choose>
						        </td>
					        </tr>
		                   </xsl:if>
		                </xsl:for-each>
		            </table>
		        </body>
		    </html>
		    <xsl:template match = "Hospital/Infrastructure"> 
      <xsl:apply-templates select = "Facility_Name" /> 
      <br /> 
   </xsl:template>  

   <xsl:template match = "Facility_Name"> 
      <span style = "font-size = 24px;"> 
         <xsl:value-of select = "." /> 
      </span> 
      <br /> 
   </xsl:template>  
		</xsl:template>
</xsl:stylesheet>