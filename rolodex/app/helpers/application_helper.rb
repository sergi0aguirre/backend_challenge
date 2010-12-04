module ApplicationHelper
    def table_up(title)
    "<table width='100%' border='0' align='center' cellpadding='0' cellspacing='0'>
      <tr>
        <td   class='tableTopLeft'>&nbsp;</td>
        <td class='tableTop' colspan='2' align='left'><span class='titulo_table'>#{title}</span></td>

        <td  class='tableTopRight'>&nbsp;</td>
      </tr>
     <tr>
     <td class='tableLeft'>&nbsp;</td>
     <td colspan='2'>"

  end

  def table_down
    "<td class='tableRight' >&nbsp;</td>
</tr>
      <tr>

        <td class='tableBottomLeft'>&nbsp;</td>
        <td colspan='2' align='right'  valign='middle' class='tableBottom'>#{image_tag 'table/table_sombra.gif'}</td>
        <td  class='tableBottomRight'>&nbsp;</td>
      </tr>
    </table>

    "
  end
end
