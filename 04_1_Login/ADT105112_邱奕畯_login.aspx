<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim data1, data2
        data1 = TextBox1.Text

        data2 = TextBox2.Text


        If TextBox1.Text = "abc" And data2 = "123" Then

            message.Text = “歡迎參觀!”
        Else
            message.Text = “帳號或密碼有誤，請重新輸入。”
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
 創意科技工作室

 <p>  帳號：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></p>
   <p>  密碼： <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></p>
       <asp:Button ID="Button1" runat="server" Text="登入" OnClick="Button1_Click" /></p>               
       <p> <asp:Label ID="message" runat="server" Text=""></asp:Label> </p>  
      


    </div>
    </form>
</body>
</html>
