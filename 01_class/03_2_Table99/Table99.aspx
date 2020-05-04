<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim i, j


        For i = 1 To 9
            Dim myRow As New TableRow()
            For j = 1 To 9

                Dim myCell As New TableCell()
                myCell.Text = (i & "*" & j & "=" & i * j)

                myRow.Cells.Add(myCell)

            Next
            Table1.Rows.Add(myRow)

        Next


    End Sub

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Table ID="Table1" runat="server" BackColor="#66ccff" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" GridLines="Both" ></asp:Table>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
