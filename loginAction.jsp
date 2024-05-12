<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Action</title>
    <script type="text/javascript">
        function welcomeAndRedirect() {
            alert("환영합니다!");
            location.href = "main.jsp";
        }
    </script>
</head>
<body>
    <%
        // 사용자가 제공한 아이디와 비밀번호를 받아옴
        String user_id = request.getParameter("user_id");
        String user_pw = request.getParameter("user_pw");

        // 데이터베이스 연결 정보 
        
        String db_url = "jdbc:mysql://localhost:3306/DICAID_Server?useUnicode=true&characterEncoding=UTF-8"; // 데이터베이스 URL 수정 필요
        String db_user = "root"; // 데이터베이스 사용자명 수정 필요
        String db_pw = "Snu09023!!"; // 데이터베이스 비밀번호 수정 필요

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try 
        {
            // JDBC 드라이버 로드 및 데이터베이스 연결
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(db_url, db_user, db_pw);

            // 사용자 입력과 데이터베이스의 정보를 비교하기 위한 SQL 쿼리 작성
            String sql = "SELECT * FROM users WHERE user_id=? AND user_pw=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_id);
            pstmt.setString(2, user_pw);
            rs = pstmt.executeQuery();
			
            
            session.setAttribute("user_id", "user_id");
            
            // 세션 유지 시간을 30분으로 설정
            session.setMaxInactiveInterval(30 * 60);
            
            // 결과 처리
            if (rs.next()) 
            {
            	//세션에 아이디 저장
            	session.setAttribute("user_id", user_id);
            	String userId = rs.getString("user_id");
            	out.println("<script type=\"text/javascript\">");
                out.println("welcomeAndRedirect();");
                out.println("</script>");
                
            } 
            else 
            {
                out.println("ID 또는 PW가 잘못 입력되었습니다. 다시 시도 해주시기 바랍니다.");
            }
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        } 
        finally 
        { 
            // 자원 해제
            if (rs != null) 
            {
                try 
                {
                    rs.close();
                } 
                catch (SQLException e) 
                {
                    e.printStackTrace();
                }
            }
            if (pstmt != null) 
            {
                try 
                {
                    pstmt.close();
                } 
                catch (SQLException e) 
                {
                    e.printStackTrace();
                }
            }
            if (conn != null) 
            {
                try 
                {
                    conn.close();
                } 
                catch (SQLException e) 
                {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>