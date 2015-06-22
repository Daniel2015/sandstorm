<%@page import="model.User"%>
<%@page import="model.UserBean"%>

<%
    response.setCharacterEncoding("UTF-8");
    Integer userid = (Integer) session.getAttribute("user_id");
    UserBean ub = new UserBean();
    User u = ub.getUser(userid);
%>
<div class="container">
    <div class="jumbotron">
        <h2>My Account</h2>
        <form id="register" name="register" action="updateUser" method="post">
            <input type="hidden" name="userId" id="userId" value="<%=u.getUserId()%>"/>
            <paper-input-decorator floatingLabel label="First Name" error="input is required!" autoValidate>
                <input value="<%=u.getFirstName()%>" type="text" id="first_name" name="first_name" is="core-input" maxlength="20" required>
                <paper-char-counter showCounter="false" target="first_name" class="counter">       
                </paper-char-counter>
            </paper-input-decorator>
            <paper-input-decorator floatingLabel label="Last Name" error="input is required!" autoValidate>
                <input value="<%=u.getLastName()%>" type="text" id="last_name" name="last_name" is="core-input" maxlength="20" required>
                <paper-char-counter showCounter="false" target="last_name" class="counter">       
                </paper-char-counter>
            </paper-input-decorator>
            <paper-input-decorator floatingLabel label="Username" error="input is required!" autoValidate>
                <input value="<%=u.getUsername()%>" type="text" id="username" name="username" is="core-input" maxlength="20" required>
                <paper-char-counter showCounter="false" target="username" class="counter">       
                </paper-char-counter>
            </paper-input-decorator>
            <paper-input-decorator floatingLabel label="New Password" error="input is required!" autoValidate>
                <input value="<%=u.getPassword()%>" type="password" id="password" name="password" is="core-input" maxlength="20" required>
                <paper-char-counter showCounter="false" target="password" class="counter">       
                </paper-char-counter>
            </paper-input-decorator>
            <button class="btn btn-success" style="width: 100%;">Update Account</button>
        </form>
    </div>
</div>
