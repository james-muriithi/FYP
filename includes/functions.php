<?php
/**
 * Get excerpt from string
 *
 * @param String $str String to get an excerpt from
 * @param Integer $startPos Position int string to start excerpt from
 * @param Integer $maxLength Maximum length the excerpt may be
 * @return String excerpt
 */
function getExcerpt($str, $startPos = 0, $maxLength = 100)
{
    if (strlen($str) > $maxLength) {
        $excerpt = substr($str, $startPos, $maxLength - 3);
        $lastSpace = strrpos($excerpt, ' ');
        $excerpt = substr($excerpt, 0, $lastSpace);
        $excerpt .= '...';
    } else {
        $excerpt = $str;
    }

    return $excerpt;
}


/**
 * Function to convert timestamp to relative time
 *
 * @param String $timestamp
 * @return bool|string
 */
function time2str($ts) {
    if (!ctype_digit($ts))
        $ts = strtotime($ts);

    $diff = time() - $ts;
    if ($diff == 0)
        return 'now';
    elseif ($diff > 0) {
        $day_diff = floor($diff / 86400);
        if ($day_diff == 0) {
            if ($diff < 60)
                return 'just now';
            if ($diff < 120)
                return '1 minute ago';
            if ($diff < 3600)
                return floor($diff / 60) . ' minutes ago';
            if ($diff < 7200)
                return '1 hour ago';
            if ($diff < 86400)
                return floor($diff / 3600) . ' hours ago';
        }
        if ($day_diff == 1)
            return 'Yesterday';
        if ($day_diff < 7)
            return $day_diff . ' days ago';
        if ($day_diff < 31)
            return ceil($day_diff / 7) . ' weeks ago';
        if ($day_diff < 60)
            return 'last month';
        return date('F Y', $ts);
    }
    else {
        $diff = abs($diff);
        $day_diff = floor($diff / 86400);
        if ($day_diff == 0) {
            if ($diff < 120)
                return 'in a minute';
            if ($diff < 3600)
                return 'in ' . floor($diff / 60) . ' minutes';
            if ($diff < 7200)
                return 'in an hour';
            if ($diff < 86400)
                return 'in ' . floor($diff / 3600) . ' hours';
        }
        if ($day_diff == 1)
            return 'Tomorrow';
        if ($day_diff < 4)
            return date('l', $ts);
        if ($day_diff < 7 + (7 - date('w')))
            return 'next week';
        if (ceil($day_diff / 7) < 4)
            return 'in ' . ceil($day_diff / 7) . ' weeks';
        if (date('n', $ts) == date('n') + 1)
            return 'next month';
        return date('F Y', $ts);
    }
}


function getStudentData($id) {
    global $conn;

    // build the query
    $sql = "SELECT * from student WHERE student.studentId = '$id' LIMIT 1";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
            $studentData = array(
                "cms"=>$row['studentCMS'],
                "name"=>$row['studentName'],
                "email"=>$row['studentEmail'],
                "gender"=>$row['studentGender'],
            );

            return $studentData;

        }
    } else {
       return false;
    }

}



function random_password( $length = 8 ) {
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_-=+;:,.?";
    $password = substr( str_shuffle( $chars ), 0, $length );
    return $password;
}



/**
 * Get Filename and return it's icon from Fonts awesome
 *
 * @param String $str String to get an excerpt from
 * @param Integer $startPos Position int string to start excerpt from
 * @param Integer $maxLength Maximum length the excerpt may be
 * @return String excerpt
 */
function getIcon($filename){


    $ext   =   explode('.',$filename);
    $ext   = strtolower(end($filename));
    echo $ext;

/*

    switch ($ext) {

        case 'pdf':
            return " <i class=\"fa fa-file-pdf-o\"></i> ";

        case label2:

        case label3:
            break;
        default:
    }
*/
}



/**
 * Set page class to active of selected page
 *
 * @param String $str String to get an excerpt from
 * @param Integer $startPos Position int string to start excerpt from
 * @param Integer $maxLength Maximum length the excerpt may be
 * @return String excerpt
 */
function selectActive($pageName)
{
   $pageName='timeline';
   
   switch ($pageName) {
    case 'timeline':
        return 'timeline';
    case label2:
        break;
    case label3:
        break;
    default:
} 
    
}
