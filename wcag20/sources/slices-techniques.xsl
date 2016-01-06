<?xml version="1.0" encoding="utf-8"?>
<!--This file was created automatically by html2xhtml-->
<!--from the HTML stylesheets. Do not edit this file.-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:saxon="http://icl.com/saxon" xmlns:lxslt="http://xml.apache.org/xslt" xmlns:xalanredirect="org.apache.xalan.xslt.extensions.Redirect" xmlns="http://www.w3.org/1999/xhtml" extension-element-prefixes="saxon xalanredirect lxslt" version="2.0">

	<!--<xsl:param name="output.dir" select="'.'"/>-->
	
<!-- BBC: No differences from slices-understanding.xsl except for include below. -->
<xsl:include href="slices-techniques-common.xsl"/>

<!-- ==================================================================== -->
<!-- This is a workaround for a XalanJ1 bug in element-available. 

<lxslt:component prefix="xalanredirect" elements="write">
  <lxslt:script lang="javaclass" src="org.apache.xalan.xslt.extensions.Redirect"/>
</lxslt:component>-->

<!-- ==================================================================== -->

<xsl:template name="write.chunk">
  <xsl:param name="filename" select="''"/>
  <xsl:param name="content" select="''"/>

	<xsl:result-document method="xml" href="file:///{$output.dir}/{$filename}" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" indent="no">
	<xsl:copy-of select="$content"/>
	<xsl:fallback>
		<xalanredirect:write file="{$output.dir}/{$filename}">
			<xsl:copy-of select="$content"/>
			<xsl:fallback>
				<saxon:output method="xml" href="{$output.dir}/{$filename}" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" indent="no">
					<xsl:copy-of select="$content"/>
					<xsl:fallback>
						<xsl:copy-of select="$content"/>
					</xsl:fallback>
				</saxon:output>
			</xsl:fallback>
		</xalanredirect:write>
	</xsl:fallback>
</xsl:result-document>
</xsl:template>

</xsl:stylesheet>
