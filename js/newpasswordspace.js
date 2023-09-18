/**
 * 
 */
 
password.onkeyup = function space(){
   var pw = document.getElementById('password').value;
   if(window.event.keyCode == 32)             {     // 공백 체크                             
         this.value = pw.trim();               
      }
}
   
newpassword.onkeyup = function space(){
   var pw = document.getElementById('newpassword').value;
   if(window.event.keyCode == 32)             {     // 공백 체크                             
         this.value = pw.trim();               
      }
}

newrepeatpassword.onkeyup = function space(){
   var pw = document.getElementById('newrepeatpassword').value;
   if(window.event.keyCode == 32)             {     // 공백 체크                             
         this.value = pw.trim();               
      }
}
   