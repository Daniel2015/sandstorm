<div class="container">
    <div class="jumbotron">
        <h2>Create a new account</h2>
        <form id="register" name="register" action="registerUser" method="post">
            <paper-input-decorator  floatingLabel label="First Name" error="input is required!" autoValidate>
                <input type="text" id="first_name" name="first_name" is="core-input" maxlength="20" required>
                <paper-char-counter target="first_name" class="counter">       
                </paper-char-counter>
            </paper-input-decorator>
            <paper-input-decorator floatingLabel label="Last Name" error="input is required!" autoValidate>
                <input type="text" id="last_name" name="last_name" is="core-input" maxlength="20" required>
                <paper-char-counter target="last_name" class="counter">       
                </paper-char-counter>
            </paper-input-decorator>
            <paper-input-decorator floatingLabel label="Username" error="input is required!" autoValidate>
                <input type="text" id="username" name="username" is="core-input" maxlength="20" required>
                <paper-char-counter target="username" class="counter">       
                </paper-char-counter>
            </paper-input-decorator>
            <paper-input-decorator floatingLabel label="Password" error="input is required!" autoValidate>
                <input type="password" id="password" name="password" is="core-input" maxlength="20" required>
                <paper-char-counter target="password" class="counter">       
                </paper-char-counter>
            </paper-input-decorator>
            <button class="btn btn-success" style="width: 100%;">Register</button>
        </form>
    </div>
</div>
        <div>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>Username</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Password</th>
                        <th colspan="2">Operations</th>
                    </tr>
                </thead>
                <tbody>
                    <%
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
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>