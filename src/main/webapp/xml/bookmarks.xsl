<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>bookmarks</title>
      </head>
      <body>
        <h2>在线书签</h2>
        <table border="1">
          <tr>
            <td>名称</td>
            <td>网址</td>
            <td>分类</td>
          </tr>
          <xsl:for-each select="bookmarks/bookmark">
            <tr>
              <td>
                <xsl:value-of select="title"/>
              </td>
              <td>
                <xsl:value-of select="url"/>
              </td>
              <td>
                <xsl:value-of select="category"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
