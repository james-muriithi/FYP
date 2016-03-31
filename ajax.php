<?php



?>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {

            //Delete Button Action
            $("#button").click(function (e) {
                e.preventDefault();

                var clickedID = this.id.split('-'); //Split ID string (Split works as PHP explode)
                var DbNumberID = clickedID[1]; //and get number from array

                var myData = 'recordToDelete=' + DbNumberID; //build a post data structure
                $.ajax({
                    type: "POST", // HTTP method POST or GET
                    url: "ajax.php", //Where to make Ajax calls
                    dataType: "text", // Data type, HTML, json etc.
                    data: myData, //Form variables
                    success: function (response) {


                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        //On error, we alert user
                        alert(thrownError);
                    }
                });


            });




        });
    </script>
</head>
<body>

<button id ='button'>Send an HTTP GET request to a page and get the result back</button>
<div id="data">
    
</div>

</body>
</html>
