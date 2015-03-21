
<div class="container">
    <div class="jumbotron">
        <h2>Login in Sandstorm</h2>
        <form id="login" name="login" action="authenticationUser" method="post">
            <paper-input-decorator floatingLabel label="Username" autovalidate>
                <input type="text" id="username" name="username" is="core-input" maxlength="30" required>

            </paper-input-decorator>
            <paper-input-decorator floatingLabel label="Password" autovalidate>
                <input type="password" id="password" name="password" is="core-input" maxlength="30" required>
        
            </paper-input-decorator>
            <button class="btn btn-success" style="width: 100%;">Login</button>
        </form>
    </div>
</div>