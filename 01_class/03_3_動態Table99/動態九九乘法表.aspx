<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">


    Protected Sub Button_Click(sender As Object, e As EventArgs)
        Dim i, j, k, l
        k = Int(inputrow.Text)
        l = Int(inputcell.Text)
        For i = 1 To k
            Dim myRow As New TableRow()
            For j = 1 To l

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
<body>動態九九乘法表
    <form id="form1" runat="server">
    <div>
請輸入：<asp:TextBox ID="inputrow" runat="server"></asp:TextBox>列
        <asp:TextBox ID="inputcell" runat="server"></asp:TextBox>行 
        <asp:Button ID="Button1" Text="送出" runat="server" OnClick="Button_Click" />

        <asp:Table ID="Table1" runat="server" BackColor="#66ccff" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" GridLines="Both" ></asp:Table>

    </div>
    </form>
</body>
</html>
