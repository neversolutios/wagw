<?php
@$wa_no = $_GET['wa_no'];
@$wa_text = $_GET['wa_text'];
@$wa_media = $_GET['wa_media']; 
@$wa_mode = $_GET['mode']; 

 
$wa_no = str_replace ('+', '', $wa_no) ;
$wa_no = str_replace (' ', '', $wa_no) ;
if (substr($wa_no, 0, 1) == '0' ) { $wa_no = '62' . substr($wa_no,1,30) ; }

if ($wa_no!='') {
    include "key.php"; 
    
    $curl = curl_init();

    if ($wa_mode=='text') { $url = "$host/messages/send-text" ; } else { $url = "$host/messages/send-media";}
    
    $dataarr = [
      "to" => $wa_no,
      "message" => $wa_text,
      "media_url"=> $wa_media,
      "type"=> $wa_mode
    ];
     
    $sendrest = json_encode($dataarr, true); 
    
    curl_setopt_array($curl, [
      CURLOPT_URL => $url,
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => "",
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 30000,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => "POST",
      CURLOPT_POSTFIELDS => $sendrest,
      CURLOPT_HTTPHEADER => [
        "Authorization: Bearer $token",
        "Content-Type: application/json",
        "device-key: $devicekey"
      ],
    ]);
    
    $response = curl_exec($curl);
    $err = curl_error($curl);
    
    curl_close($curl);
    
    if ($err) {
      echo "cURL Error #:" . $err;
    } else {
      echo $response;
    }
}

?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demo Send WhatsApp using API</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body> <hr>

   	   <form class="form-horizontal" style="padding:10px;">
   	       
   <center>
  <h1 style="margin-top:-15px;">Demo Send WhatsApp using API</h1>
   Make sure you already 
   <a href="pairing.php"> <b>PAIRING/SCAN QR</b>  </a> before Send <br>
   <b>DON'T FORGET TO <a href="unpairing.php">LOG OUT</a> AFTER FINISH DEMO</b><hr>
   </center>
   
		<fieldset> 
		<div class="form-group">
		  <label class="col-md-4 control-label" for="">WhatsApp Number</label>  
		  <div class="col-md-4">
		  <input id="" name="wa_no" required type="text" placeholder="example : 6285692961782" class="form-control input-md">
		  </div>
		</div>
 
		<div class="form-group">
		  <label class="col-md-4 control-label" required  for="textarea">Text Message<br>(do'nt use for spamming !)</label>
		  <div class="col-md-4">                     
			<textarea class="form-control" id="textarea" name="wa_text"></textarea>
		  </div>
		</div>
 
         <div class="form-group">
          <label class="col-md-4 control-label" for="mode">Mode</label>
          <div class="col-md-4"> 
            <label class="radio-inline" for="mode-0">
              <input type="radio" name="mode" id="mode-0" value="text" checked="checked">
              Text
            </label> 
            <label class="radio-inline" for="mode-1">
              <input type="radio" name="mode" id="mode-1" value="image">
              Image
            </label> 
            <label class="radio-inline" for="mode-2">
              <input type="radio" name="mode" id="mode-2" value="video">
              Video
            </label> 
            <label class="radio-inline" for="mode-3">
              <input type="radio" name="mode" id="mode-3" value="audio">
              Audio
            </label>
            <label class="radio-inline" for="mode-3">
              <input type="radio" name="mode" id="mode-3" value="document">
              Docs
            </label>            
          </div>
        </div>

 		<div class="form-group">
		  <label class="col-md-4 control-label" for="">URL Media</label>  
		  <div class="col-md-4">
		  <input id="" name="wa_media" type="text" value="http://wa-gw.com/eng/files/about-img.png" placeholder="ikuti format contoh : 6285692961782" class="form-control input-md">
		  </div>
		</div>
		
 
		
		<div class="form-group">
		  <label class="col-md-4 control-label" ></label>
		  <div class="col-md-4">
			<button class="btn btn-primary">SEND WHATSAPP</button>
		  </div>
		</div>
 
 
   	</fieldset>
		</form>
<!--		
<iframe src='pairing.php'  height="100%" width="100%">		
-->
  </body>
</html>
