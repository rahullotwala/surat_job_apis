<?php
include("db_connect.php");

$action = $_REQUEST['action'];

if($action=='resume_theme'){

	getjson("SELECT * FROM `resume_theme`");
}
else if ($action=="login") {

	if (isset($_REQUEST['user'])) {
		if ($_REQUEST['user']=='1') {	

			getjson("SELECT Job_seeker_id FROM `job_seeker_tb` WHERE Student_email = '".$_REQUEST['em']."' AND Student_password = '".$_REQUEST['pass']."'");
		}
		else if ($_REQUEST['user']=='2') {
			getjson("SELECT Company_id FROM `company_tb` WHERE Company_email = '".$_REQUEST['em']."' AND Company_password='".$_REQUEST['pass']);

		}
		else if ($_REQUEST['user']=='3') {
			getjson("SELECT College_id FROM college_tb WHERE College_email = '".$_REQUEST['em']."' AND College_password = '".$_REQUEST['pass']."'");
		}
	}
	else{
		echo "user is not set";
	}

	
	
}
else if ($action=="registration") {
	
	$obj=new DB_Connect;
	$result=$obj->mysqlQuery("SELECT Student_email FROM job_seeker_tb WHERE Student_email = '".$_REQUEST['Student_email']."' AND Student_password = '".$_REQUEST['Student_password']."'");
	$response = array();

	if ($result->num_rows > 0) {
		$response['status'] = 2;
		$response['data'] = null;
		$response['message'] = "email is already taken!";
	}
	else{	
		if(isset($_FILES['Student_profile']) AND isset($_FILES["Student_resume"])){

			$query="INSERT INTO `job_seeker_tb`(`College_course_id`, `Student_name`, `Student_contact`, `Student_email`, `Student_gender`, `Student_profile`, `Student_resume`, `Student_password`, `Student_cgpa`,`IsOther`,`Registered_date`) VALUES (".$_REQUEST['College_course_id'].",'".$_REQUEST['Student_name']."','".$_REQUEST['Student_contact']."','".$_REQUEST['Student_email']."','".$_REQUEST['Student_gender']."','".time().$_FILES['Student_profile']['name']."','".time().$_FILES["Student_resume"]["name"]."','".$_REQUEST['Student_password']."',".$_REQUEST['Student_cgpa'].",".$_REQUEST['isOther'].",CURDATE())";

			$response['status'] = 1;
			$response['data'] = getIjson($query);
			$response['message'] = "student is register!";


			move_uploaded_file($_FILES['Student_profile']['tmp_name'],"./Uploaded_document/Picture/".time().$_FILES['Student_profile']['name']);

			move_uploaded_file($_FILES['Student_resume']['tmp_name'],"./Uploaded_document/Resume/".time().$_FILES["Student_resume"]["name"]);
		}
	}
	echo json_encode($response);
}
else if ($action == "JobFair_data") {

			$query = "SELECT college_tb.College_name,college_tb.College_location,college_tb.College_email,college_tb.College_contact, job_fair_tb.Job_fair_id,job_fair_tb.Job_fair_start_date,job_fair_tb.Job_fair_end_date,job_fair_tb.Company_registration_start_date,job_fair_tb.Company_registration_end_date,job_fair_tb.Student_registration_start_date,job_fair_tb.Student_registration_end_date,job_fair_tb.IsOnline FROM college_tb,job_fair_tb WHERE college_tb.College_id = job_fair_tb.Host_college_id";
			$response['status'] = 1;
			$response['data'] = getDjson($query);
			$response['message'] = "Data retrive successfully!";
	echo json_encode($response);
}


else if ($action == "JobList") {

			$query = "SELECT company_tb.Company_name,company_job_post_tb.Post_name,company_job_post_tb.Post_description,company_job_post_tb.Package_provided FROM company_job_post_tb,participated_company_tb,company_tb WHERE company_job_post_tb.Job_status = 1 AND company_job_post_tb.Participated_company_id = participated_company_tb.Company_id AND company_job_post_tb.Company_job_post_id=company_tb.Company_id AND participated_company_tb.Job_fair_id = ".$_REQUEST['Job_fair_id'];
			$response['status'] = 1;
			$response['data'] = getDjson($query);
			$response['message'] = "Data retrive successfully!";
	echo json_encode($response);
}

function getIjson($query)
{
	$obj=new DB_Connect;
	if($obj->mysqlQuery($query))
	{
		return "valid";
	}
	else{
		return "Invalid";
	}
}

function getDjson($query)
{
	$response['data']=array();
	$data = array();
	$obj=new DB_Connect;
		// mysqli_set_charset($obj->$con1,"utf8");
	$result=$obj->mysqlQuery($query);
	$fields_num = mysqli_num_fields($result);
	while($row=mysqli_fetch_array($result))
	{
		for($i=0;$i<$fields_num;$i++)
		{
			$data[mysqli_field_name($result,$i)]= htmlspecialchars(str_replace("*","'",$row[$i]));
			
		}
		array_push($response['data'], $data);
	}
	return $response;
}

function getjson($query)
{
		// echo $query;
	$response=array();
	$product = array();
	$response["data"]= array();
	$obj=new DB_Connect;
		// mysqli_set_charset($obj->$con1,"utf8");
	$result=$obj->mysqlQuery($query);
	$fields_num = mysqli_num_fields($result);
	while($row=mysqli_fetch_array($result))
	{
		for($i=0;$i<$fields_num;$i++)
		{
			$product[mysqli_field_name($result,$i)]= htmlspecialchars(str_replace("*","'",$row[$i]));
		}

		array_push($response["data"], $product);
	}


	echo str_replace('\/','/',json_encode($response));
}

function mysqli_field_name($result, $field_offset)
{
	$properties = mysqli_fetch_field_direct($result, $field_offset);
	return is_object($properties) ? $properties->name : null;
}

function getinsertjson($query)
{
	$response["data"]= array();
	$data= array();
	$obj=new DB_Connect;
	if($obj->mysqlQuery($query))
	{
		$data["value"]="valid";	  
		array_push($response["data"], $data);
	}
	else{
		$data["value"]="ivalid";	  
		array_push($response["data"], $data);
	}
	echo str_replace('\/','/',json_encode($response));
}
?>