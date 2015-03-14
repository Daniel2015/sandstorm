<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <h1>LOGIN!</h1>

        <form name="loginForm" method="POST" action="loginListener">
            <span> Username: <input type="text" name="username"/>
            </span>
            <span>
                Password:
            <input type="password" name="password"/>
            </span>
            <input type="submit" name="submit"/>
            </form>