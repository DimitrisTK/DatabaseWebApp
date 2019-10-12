    
    var photocounter = 1;
    function addanotherphoto(divName){
            var newdiv = document.createElement('div');
            newdiv.innerHTML = '<label>Photo</label>' + (photocounter + 1) + '<br> <input type="text" name="photos" placeholder="Insert link for photo">';
            document.getElementById(divName).appendChild(newdiv);
            photocounter++;
         }
    
    var videocounter = 1;
    function addanothervideo(divName){
            var newdiv = document.createElement('div');
            newdiv.innerHTML = '<label>Video</label>' + (videocounter + 1) + '<br> <input type="text" name="videos" placeholder="Insert link for video">';
            document.getElementById(divName).appendChild(newdiv);
            videocounter++;
         } 
         

    var quotecounter = 1;
    function addanotherquote(divName){
            var newdiv = document.createElement('div');
            newdiv.innerHTML = '<label>Quote</label>' + (quotecounter + 1) + '<br> <input type="text" name="quotes">';
            document.getElementById(divName).appendChild(newdiv);
            quotecounter++;
         } 
         
         
    function addanotherinterest(divName){
            var newdiv = document.createElement('div');
            newdiv.innerHTML = '<select name="interests">\n\
                <option value=""></option>\n\
                <option value="1">Database</option>\n\
                <option value="2">Web programming</option>\n\
                <option value="3">Human Computer Interaction</option>\n\
                <option value="4">Data Mining</option>\n\
                <option value="5">Software Engineering</option>\n\
                <option value="6">Information Retrieval</option>\n\
                <option value="7">Software Quality</option>\n\
                <option value="8">e-commerce</option>\n\
                <option value="9">Management Information Systems</option>\n\
                <option value="10">Information Systems</option>\n\
            </select>';
            document.getElementById(divName).appendChild(newdiv);
         } 
         
         
    function addanotherhobby(divName){
            var newdiv = document.createElement('div');
            newdiv.innerHTML = '<select name="hobbies"> \n\
                <option value=""></option>\n\
                <option value="1">Football</option>\n\
                <option value="2">Basketball</option>\n\
                <option value="3">Volleyball</option>\n\
                <option value="4">Tennis</option>\n\
                <option value="5">Swimming</option>\n\
                <option value="6">Art</option>\n\
                <option value="7">Music</option>\n\
                <option value="8">Martial Arts</option>\n\
                <option value="9">Cinema</option>\n\
                <option value="10">Photography</option>\n\
                </select>';
            document.getElementById(divName).appendChild(newdiv);
         }  
         
    function addnewhobby(divName){
            var newdiv = document.createElement('div');
            newdiv.innerHTML = 'New Hobby: <input type="text" name="newhobbies" placeholder="Insert new hobby">';
            document.getElementById(divName).appendChild(newdiv);
            }
         
    
    function addanotherlanguage(divName){
            var newdiv = document.createElement('div');
            newdiv.innerHTML = 'Foreign Language:<select name="languages"> \n\
                <option value=""></option>\n\
                <option value="1">English</option>\n\
                <option value="2">French</option>\n\
                <option value="3">German</option>\n\
                <option value="4">Spanish</option>\n\
                <option value="5">Italian</option>\n\
                <option value="6">Chinese</option>\n\
                <option value="7">Japanese</option>\n\
                <option value="8">Russian</option>\n\
                <option value="9">Turkish</option>\n\
                <option value="10">Arabics</option>\n\
                </select>\n\
                Level:<select name="langlevels"> \n\
                <option value="0"></option>\n\
                <option value="1">Elementary</option>\n\
                <option value="2">Intermediate</option>\n\
                <option value="3">Advanced</option>\n\
                <option value="4">Proficient</option>\n\
                </select>';
            document.getElementById(divName).appendChild(newdiv);
        }  
         
    function addnewlang(divName){
            var newdiv = document.createElement('div');
            newdiv.innerHTML = 'New Language: <input type="text" name="newlanguages" placeholder="Insert new language">\n\
                Level:<select name="newlvls"> \n\
                <option value="0"></option>\n\
                <option value="1">Elementary</option>\n\
                <option value="2">Intermediate</option>\n\
                <option value="3">Advanced</option>\n\
                <option value="4">Proficient</option>\n\
                </select>';
            document.getElementById(divName).appendChild(newdiv);
        }
         
         
    function quotessuccess(){
            alert("Quotes added succesfully in your profile");} 
        
    function studentexists(){
            alert("Student already exists in database");
            window.location = 'submitform.html';} 
        
    function usernameexists(){
            alert("Username is taken.Try again with a different username");
            window.location = 'registerform.html';} 
        
    function loginfailed(){
            alert("Invalid Username or Password.Try again");
            window.location = 'index.html';} 