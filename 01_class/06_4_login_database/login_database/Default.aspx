<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

    Protected Sub Button1_Click(sender As Object, e As EventArgs)

        GridView1.DataBind()
        If GridView1.Rows.Count > 0 Then
            message.Text = "歡迎進入快樂國小!"
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
    
        ADT105112<span style="color: rgb(0, 0, 0); font-family: 標楷體; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">學生資料管理系統</span></div>
        <p>
            <span style="color: rgb(0, 0, 0); font-family: 標楷體; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">帳號：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            (ID:1)</span></p>
        <p>
            <span style="color: rgb(0, 0, 0); font-family: 標楷體; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">密碼：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            (ID:123)</span></p>
            <span style="color: rgb(0, 0, 0); font-family: 標楷體; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
        <asp:Button ID="Button1" runat="server" Text="確認" OnClick="Button1_Click" />
        <br />
        </span>
        <asp:Label ID="message" runat="server" Text=""></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:login %>" ProviderName="<%$ ConnectionStrings:login.ProviderName %>" SelectCommand="SELECT * FROM [personal] WHERE (([學號] = ?) AND ([密碼] = ?))">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="學號" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox2" Name="密碼" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="學號" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="學號" HeaderText="學號" ReadOnly="True" SortExpression="學號" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="性別" HeaderText="性別" SortExpression="性別" />
                <asp:BoundField DataField="電話" HeaderText="電話" SortExpression="電話" />
                <asp:BoundField DataField="地址" HeaderText="地址" SortExpression="地址" />
                <asp:BoundField DataField="電子郵件" HeaderText="電子郵件" SortExpression="電子郵件" />
                <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                <asp:BoundField DataField="密碼" HeaderText="密碼" SortExpression="密碼" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
