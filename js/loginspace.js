/**
 * 
 */
 
 loginid.onkeyup = function space(){
   var id = document.getElementById('loginid').value;
   if(window.event.keyCode == 32)             {     // 공백 체크                             
         this.value = id.trim();               
      }
}


loginPassword.onkeyup = function space(){
   var pw = document.getElementById('loginPassword').value;
   if(window.event.keyCode == 32)             {     // 공백 체크                             
         this.value = pw.trim();               
      }
}