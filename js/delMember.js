/**
 * 
 */
 
 function delMember() {
   
   if(confirm("정말 탈퇴 하시겠습니까 ?") == true){      
      var formdel = document.formdel;
      var password = repeatpw;
         formdel.method = "post";
         formdel.action = "delall.lg";
         formdel.submit();    // 자바스크립트에서 서블릿으로 전송
         
     }else{
      return;
   }
}