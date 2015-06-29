
<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page import="model.UserBean"%>
<div>
    <div class="panel">
    <h2>Users</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>User ID</th>
                <th>Username</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Password</th>
                <th colspan="3">Operations</th>
            </tr>
        </thead>
        <tbody>
            <%
                response.setCharacterEncoding("UTF-8");
                UserBean ub = new UserBean();
                List<User> list = ub.getUsers();
                for (User u : list) {
            %>

            <tr>
                <td><%=String.valueOf(u.getUserId())%></td>
                <td><%=u.getUsername()%></td>
                <td><%=u.getFirstName()%></td>
                <td><%=u.getLastName()%></td>
                <td><%=u.getPassword()%></td>
                <td>
                    <div>
                        <form method="post" action="updateUserView">
                            <input type="hidden" id="updateId" name="updateId" value="<%=String.valueOf(u.getUserId())%>"/> 
                            <button type="submit" class="btn btn-warning">Modify</button>
                        </form>
                    </div>
                </td>
                <td>
                    <div>
                        <form method="post" action="deleteUser">
                            <input type="hidden" id="delId" name="delId" value="<%=String.valueOf(u.getUserId())%>"/> 
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </div>
                </td>
                <td>
                    <div>
                        <form method="post" action="Profile">
                            <input type="hidden" id="userId" name="userId" value="<%=String.valueOf(u.getUserId())%>"/> 
                            <button type="submit" class="btn btn-success">Profile</button>
                        </form>
                    </div>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
        </div>