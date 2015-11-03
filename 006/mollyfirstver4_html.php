<HTML>
 <Form method = "Post" action = "">
       First Name:<input name= "Firstname"/> <br/>
        Last Name:<input name="lastname"/> <br/>
            <input type="submit">
            </form>

<?php

echo "Today is " . date("m-d-Y") . "<br>";

echo "Dear Patron,<br/>";
echo "Today is your lucky day!  Chose a day of the week for free php courses for
the rest of your life!
<br/>";
echo 'This is a list of the days of the week that you may choose from:<br/>';

          $arr = array("Monday<br/>","Tuesday<br/>","Wednesday<br/>","Thursday<br/>","Friday<br/>");
                $arr[0];

for($i=0;$i<5;$i++){
    echo 'Which will you choose??<br/>' .$arr[$i];
}

?>
<HTML>
     Fill in the name of your favorite php programmer to enter them into a
    contest to win One Million Dollars! <br/></b>
<Form method = "POST" action ="">;
        Name:<input name= "name"/> <br/>
            <input type="submit"> <br/>
    </HTML>


<?php
echo "Sincerely Yours,<br/>";
echo "Molly O'Guinness Carlson</br>";
?>

</HTML>
