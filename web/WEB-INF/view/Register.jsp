<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page import="model.UserBean"%>
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