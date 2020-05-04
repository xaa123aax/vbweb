<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

    Protected Sub Login_Click(sender As Object, e As EventArgs)

        GridView1.DataBind()
        GridView2.DataBind()
        If GridView1.Rows.Count > 0 Then
            Session("username") = Username.Text
            message.Text = "歡迎進入!"
            If Username.Text = "admin" Then
                Server.Transfer("admin.aspx")
            Else
                If GridView2.Rows.Count > 0 Then
                    message.Text = "你已經做過了 沒機會惹"
                Else
                    Server.Transfer("test.aspx")
                End If
            End If

        Else
            message.Text = "帳號或密碼輸入錯誤，請重新輸入資料。"
        End If

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
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
        <p>ADT105112數學線上測驗系統</p>
        <p>管理員：admin / admin</p>
        <p>學生 ：666 /666&nbsp; (做完測驗的)</p>
        <p>或是自己註冊一個</p>
        帳號：<asp:TextBox ID="Username" runat="server"></asp:TextBox>
        &nbsp;<br />
        密碼：<asp:TextBox ID="Password" runat="server"></asp:TextBox>
        &nbsp;<br /><br />
        <asp:Button ID="Login" runat="server" Text="登入" OnClick="Login_Click" />
        &nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="註冊" OnClick="Button1_Click" /><br />
        <br />
        <asp:Label ID="message" runat="server" Text=""></asp:Label>
        <br />
       </div>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:login1 %>" ProviderName="<%$ ConnectionStrings:login1.ProviderName %>" SelectCommand="SELECT * FROM [login] WHERE (([學號] = ?) AND ([密碼] = ?))">
            <SelectParameters>
                <asp:ControlParameter ControlID="Username" Name="學號" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="Password" Name="密碼" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="學號" DataSourceID="SqlDataSource1" Visible="False">
            <Columns>
                <asp:BoundField DataField="學號" HeaderText="學號" ReadOnly="True" SortExpression="學號" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="密碼" HeaderText="密碼" SortExpression="密碼" />
                <asp:BoundField DataField="手機" HeaderText="手機" SortExpression="手機" />
                <asp:BoundField DataField="電子郵件" HeaderText="電子郵件" SortExpression="電子郵件" />
            </Columns>
        </asp:GridView>
        
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:logintest %>" ProviderName="<%$ ConnectionStrings:logintest.ProviderName %>" SelectCommand="SELECT * FROM [score] WHERE ([學號] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Username" Name="學號" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="學號" DataSourceID="SqlDataSource2" Visible="False">
            <Columns>
                <asp:BoundField DataField="學號" HeaderText="學號" ReadOnly="True" SortExpression="學號" />
                <asp:BoundField DataField="測驗日期" HeaderText="測驗日期" SortExpression="測驗日期" />
                <asp:BoundField DataField="測驗學科" HeaderText="測驗學科" SortExpression="測驗學科" />
                <asp:BoundField DataField="測驗成績" HeaderText="測驗成績" SortExpression="測驗成績" />
            </Columns>
        </asp:GridView>
        
    </form>
</body>
</html>
