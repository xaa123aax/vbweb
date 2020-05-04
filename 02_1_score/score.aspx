<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim data1, data2, data3

        data1 = CInt(chinese.Text)

        data2 = CInt(english.Text)

        data3 = CInt(math.Text)

        total.Text = (data1 + data2 + data3) / 3
        totala.Text = (data1 + data2 + data3)
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
    成績計算處理系統<br />
        國文:<asp:TextBox ID="chinese" runat="server"></asp:TextBox>
    </div>
        <p>
        英文:<asp:TextBox ID="english" runat="server"></asp:TextBox>
        </p>
        <p>
        數學:<asp:TextBox ID="math" runat="server"></asp:TextBox>

        <asp:Button ID="Button1" runat="server" Text="開始計算" OnClick="Button1_Click" />
        </p>
        ================================================================
        <p>
        總分數:<asp:Label ID="totala" runat="server" Text="0"></asp:Label>
        總平均:<asp:Label ID="total" runat="server" Text="0"></asp:Label>
        </p>
    </form>
</body>
</html>
