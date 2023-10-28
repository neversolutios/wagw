<?php 
include "key.php"; 

$data = file_get_contents("php://input");
$getdata = json_decode($data);
$event = $getdata->event;

if ($event == 'received::message') {
	$from = $getdata->data->from;
	$msg = $getdata->data->message;
	$msgid = $getdata->data->id;
	$media = $getdata->data->media_url;
	$type = $getdata->data->type;
	$curl = curl_init();
	curl_setopt_array($curl, [
		CURLOPT_URL => "$host/chats/".$from,
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_ENCODING => "",
		CURLOPT_MAXREDIRS => 10,
		CURLOPT_TIMEOUT => 30,
		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		CURLOPT_CUSTOMREQUEST => "GET",
		CURLOPT_POSTFIELDS => "",
		CURLOPT_HTTPHEADER => [
			"Authorization: Bearer $token",
			"device-key: $devicekey"
		],
	]);
	$response = curl_exec($curl);
	$getname = json_decode($response);
	$yourname = $getname->name;
	$mymsg = "Hallo {yourname} : Your Message ".$msg;
	$mymsgreplace = str_replace("{yourname}", $yourname, $mymsg);
	if ($media != NULL) {
		$sendarr = [
			"to" => $from,
			"message" => $mymsgreplace,
			"media_url" => "$host".$media,
			"type" => $type,
			"reply_for" => $msgid
		];
		$sendrest = json_encode($sendarr, true);
		$curl = curl_init();
		curl_setopt_array($curl, [
			CURLOPT_URL => "$host/messages/send-media",
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => "",
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 30,
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
	}else{
		$sendarr = [
			"to" => $from,
			"message" => $mymsgreplace,
			"reply_for" => $msgid
		];
		$sendrest = json_encode($sendarr, true);
		$curl = curl_init();
		curl_setopt_array($curl, [
			CURLOPT_URL => "$host/messages/send-text",
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => "",
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 30,
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
	}

}
// if ($event == 'battery::device') {
// 	$battery = $getdata->data->battery;
// 	if ($battery == 100) {
// 		$msg = "Battery Anda Sudah Penuh".$battery."%";
// 	}elseif($battery < 20){
// 		$msg = "Battery Low Silahkan Isi Ulang Daya, Sisa Battery : ".$battery."%";
// 	}else{
// 		$msg = "Battery Anda : ".$battery."%";
// 	}
// 	$sendarr = [
// 		"to" => '6282288777821',
// 		"message" => $msg
// 	];
// 	$sendrest = json_encode($sendarr, true);
// 	$curl = curl_init();
// 	curl_setopt_array($curl, [
// 		CURLOPT_URL => "$host/messages/send-text",
// 		CURLOPT_RETURNTRANSFER => true,
// 		CURLOPT_ENCODING => "",
// 		CURLOPT_MAXREDIRS => 10,
// 		CURLOPT_TIMEOUT => 30000,
// 		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
// 		CURLOPT_CUSTOMREQUEST => "POST",
// 		CURLOPT_POSTFIELDS => $sendrest,
// 		CURLOPT_HTTPHEADER => [
// 			"Authorization: Bearer $token",
// 			"Content-Type: application/json",
// 			"device-key: $devicekey"
// 		],
// 	]);

// 	$response = curl_exec($curl);
// }elseif ($event == 'voice::missed-call') {
// 	$msg = $getdata->data->from;
// 	$sendarr = [
// 		"to" => '6282288777821',
// 		"message" => "Panggilan Suara Tak Terjawab Dari : ".$msg
// 	];
// 	$sendrest = json_encode($sendarr, true);
// 	$curl = curl_init();
// 	curl_setopt_array($curl, [
// 		CURLOPT_URL => "$host/messages/send-text",
// 		CURLOPT_RETURNTRANSFER => true,
// 		CURLOPT_ENCODING => "",
// 		CURLOPT_MAXREDIRS => 10,
// 		CURLOPT_TIMEOUT => 30000,
// 		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
// 		CURLOPT_CUSTOMREQUEST => "POST",
// 		CURLOPT_POSTFIELDS => $sendrest,
// 		CURLOPT_HTTPHEADER => [
// 			"Authorization: Bearer $token",
// 			"Content-Type: application/json",
// 			"device-key: $devicekey"
// 		],
// 	]);

// 	$response = curl_exec($curl);
// }elseif ($event == 'video::missed-call') {
// 	$msg = $getdata->data->from;
// 	$sendarr = [
// 		"to" => '6282288777821',
// 		"message" => "Panggilan Video Tak Terjawab Dari : ".$msg
// 	];
// 	$sendrest = json_encode($sendarr, true);
// 	$curl = curl_init();
// 	curl_setopt_array($curl, [
// 		CURLOPT_URL => "$host/messages/send-text",
// 		CURLOPT_RETURNTRANSFER => true,
// 		CURLOPT_ENCODING => "",
// 		CURLOPT_MAXREDIRS => 10,
// 		CURLOPT_TIMEOUT => 30000,
// 		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
// 		CURLOPT_CUSTOMREQUEST => "POST",
// 		CURLOPT_POSTFIELDS => $sendrest,
// 		CURLOPT_HTTPHEADER => [
// 			"Authorization: Bearer $token",
// 			"Content-Type: application/json",
// 			"device-key: $devicekey"
// 		],
// 	]);

// 	$response = curl_exec($curl);
// }
?>