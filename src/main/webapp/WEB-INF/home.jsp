<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Ninja Gold</title>
      <style>
      #top h3, #top p{
  display: inline-block;
}
#top p{
  border: 2px black solid;
  width: 100px;
}
main {
  width: 80%;
  margin-left: auto;
  margin-right: auto;
}
.boxes{
  display: inline-block;
  width: 200px;
  height: 200px;
  border: 2px black solid;
  text-align: center;
}
#boxes h2, #boxes h3{
  padding-top: 10px;
  padding-bottom: 5px;
}
footer{
  width: 80%;
  margin-left: auto;
  margin-right: auto;
  border: 2px black solid;
}
 .lost{
          color: red;
        }
        .win{
          color: green;
        }
      </style>
  </head>
  <body>
    <div id="top">
      <h3>Your Gold: </h3>
      <p> <c:out value="${gold}"/> </p>
      <form action="/reset" method="post">
        <button>Reset!</button>
      </form>
    </div>
    <p>val count</p> 
    <main>
      <div class="boxes">
        <h2>Farm</h2>
        <h3>(earns 10-20 golds)</h3>
        <form action="/processMoney" method="post">
          <input type="hidden" name="action" value="farm">
          <button>Find Gold!</button>
        </form>
      </div>
      <div class="boxes">
        <h2>Cave</h2>
        <h3>(earns 5-10 golds)</h3>
        <form action="/processMoney" method="post">
          <input type="hidden" name="action" value="cave">
          <button>Find Gold!</button>
        </form>
      </div>
      <div class="boxes">
        <h2>House</h2>
        <h3>(earns 2-5 golds)</h3>
        <form action="/processMoney" method="post">
          <input type="hidden" name="action" value="house">
          <button>Find Gold!</button>
        </form>
      </div>
      <div class="boxes">
        <h2>Casino</h2>
        <h3>(earns 0-50 golds)</h3>
        <form action="processMoney" method="post">
          <input type="hidden" name="action" value="casino">
          <button>Find Gold!</button>
        </form>
      </div>
    </main>

    <p>Activities:</p>
    <footer>
    	<c:forEach var="result" items="${activities}">
    		<c:if test="${result.chance == '2' }">
    			<p class="win">You earned <c:out value="${result.gold}"/> golds from <c:out value="${result.action}"/> at <c:out value="${result.time}"/>! </p>
    		</c:if>
    		<c:if test="${ result.chance == '1' }">
    			<p class="lost">You lost <c:out value="${result.gold}"/> golds from <c:out value="${result.action}"/> at <c:out value="${result.time}"/>! </p>
    		</c:if>
    	</c:forEach>
       
    </footer>

  </body>
</html>