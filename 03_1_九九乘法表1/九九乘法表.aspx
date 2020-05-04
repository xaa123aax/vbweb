<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        Dim i, j

        For i = 1 To 9
            Response.Write("<br>")
            For j = 1 To 9

                Response.Write(i & "*" & j & "=" & i * j)

            Next

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
    
    </div>
    </form>
</body>
</html>
