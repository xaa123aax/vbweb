<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">
    Protected Sub page_load(sender As Object, e As EventArgs)
        number.Text = Session("username")
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim data1 As New Random

        math1.Text = data1.Next(10, 20)
        math2.Text = data1.Next(10, 20)

    End Sub

    Protected Sub Button1_Click2(sender As Object, e As EventArgs)

        Dim data3
        data3 = CInt(math.Text)

        If data3 = CInt(math1.Text) + CInt(math2.Text) Then
            message.Text = “正確”

        Else
            message.Text = “錯誤”

        End If

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
    數學加法系統<br />
        
    </div>
        <p>
        
            <asp:Label ID="number" runat="server"></asp:Label>號
        
            同學 你好</p>
        <p>
                <asp:Button ID="Button1" runat="server" Text="請出題" OnClick="Button1_Click" />
        </p>
        ================================================================
        <p>
            <asp:Label ID="math1" runat="server" Text="加數"></asp:Label>
            +<asp:Label ID="math2" runat="server" Text="被加數"></asp:Label>
            =<asp:TextBox ID="math" runat="server"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="核對答案" OnClick="Button1_Click2" />
        </p>
       <p>
            <asp:Label ID="message" runat="server" Text=""></asp:Label>
        </p>
        
    </form>
</body>
</html>
