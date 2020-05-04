<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        GridView1.DataBind()
        If GridView1.Rows.Count > 0 Then
            Session("username") = username.Text
            If Session("username") = "admin" Then
                Server.Transfer("admin.aspx")
            Else
                Server.Transfer("wife.aspx")
            End If
        Else
            message.Text = "帳號或密碼輸入錯誤，請重新輸入資料。"
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Server.Transfer("register.aspx")
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
    
        肥宅老婆管理系統<br />
        管理者(test001/111)<br />
        普通使用者(test002/222)或自行註冊帳號<br />
        <br />
        --------------------------------------------------------<br />
        <br />
        帳號:<asp:TextBox ID="username" runat="server"></asp:TextBox>
    
    </div>
        <p>
            密碼:<asp:TextBox ID="password" runat="server"></asp:TextBox>
    
        </p>
        <p>
            <asp:Label ID="message" runat="server" Text=""></asp:Label>
    
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Text="登入" OnClick="Button1_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="註冊" OnClick="Button2_Click" />
        </p>
        <p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:login %>" ProviderName="<%$ ConnectionStrings:login.ProviderName %>" SelectCommand="SELECT * FROM [person]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="帳號" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="帳號" HeaderText="帳號" ReadOnly="True" SortExpression="帳號" />
                    <asp:BoundField DataField="暱稱" HeaderText="暱稱" SortExpression="暱稱" />
                    <asp:BoundField DataField="信箱" HeaderText="信箱" SortExpression="信箱" />
                    <asp:BoundField DataField="密碼" HeaderText="密碼" SortExpression="密碼" />
                    <asp:BoundField DataField="電話" HeaderText="電話" SortExpression="電話" />
                </Columns>
            </asp:GridView>
        </p>
    </form>
</body>
</html>
