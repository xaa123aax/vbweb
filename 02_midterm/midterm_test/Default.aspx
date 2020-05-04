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
                Server.Transfer("test.aspx")
            End If
        Else
            message.Text = "帳號或密碼輸入錯誤，請重新輸入資料。"
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
    
        10824數位系數位學習系統<br />
        帳號:<asp:TextBox ID="username" runat="server"></asp:TextBox>
    </div>
    <div>
    
        密碼:<asp:TextBox ID="password" runat="server"></asp:TextBox>
    </div>
        <p>
        <asp:Label ID="message" runat="server" Text=""></asp:Label>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Text="登入" OnClick="Button1_Click" />
        </p>
        <p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:login %>" ProviderName="<%$ ConnectionStrings:login.ProviderName %>" SelectCommand="SELECT * FROM [login] WHERE (([姓名] = ?) AND ([密碼] = ?))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="username" Name="姓名" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="password" Name="密碼" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="學號" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="學號" HeaderText="學號" ReadOnly="True" SortExpression="學號" />
                    <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                    <asp:BoundField DataField="密碼" HeaderText="密碼" SortExpression="密碼" />
                    <asp:BoundField DataField="手機" HeaderText="手機" SortExpression="手機" />
                    <asp:BoundField DataField="電子郵件" HeaderText="電子郵件" SortExpression="電子郵件" />
                </Columns>
            </asp:GridView>
        </p>
    </form>
</body>
</html>
