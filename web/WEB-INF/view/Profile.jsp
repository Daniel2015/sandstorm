<%@page import="model.User"%>
<%@page import="model.UserBean"%>
<%
    response.setCharacterEncoding("UTF-8");
    int id;
    if(request.getParameter("userId") == null){
        id =(Integer) session.getAttribute("user_id");
    }
    else{
        id = Integer.parseInt(request.getParameter("userId"));
    }
    UserBean ub = new UserBean();
    User u = ub.getUser(id);
%>
<div id="mystyle" class="myform">
    <form id="form" name="form" action="updateUser" method="post">
        <h1>Update User ID:<%=u.getUserId()%></h1>
        <p>Modify the following information to update user with ID:<%=u.getUserId()%></p>
        <label><input type="hidden" name="userId" id="userId" value="<%=u.getUserId()%>"/></label>                    
        <label>Username:</label>
        <input type="text" name="username" id="username" value="<%=u.getUsername()%>"/>
        <label>First Name:</label>
        <input type="text" name="first_name" id="first_name" value="<%=u.getFirstName()%>"/>
        <label>Last Name</label>
        <input type="text" name="last_name" id="last_name" value="<%=u.getLastName()%>"/>
        <label>Password</label>
        <input type="text" name="password" id="password" value="<%=u.getPassword()%>"/>
        <button class="btn btn-success" type="submit">Update User</button>
    </form>
</div>
