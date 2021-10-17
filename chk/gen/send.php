    <?php 
  include('../inc/connection.php'); 
  // Be sure to include the file you've just downloaded
    
  require_once('gate.php');
  // Specify your authentication credentials
  $username   = "church_sms";
  $apikey     = "39b8a8f585818766fd26692201d79e61b4800e29bbf3e48fe67bfb3e9ff7b558";
  // Specify the numbers that you want to send to in a comma-separated list
  // Please ensure you include the country code (+254 for Kenya in this case)
  //$recipients = $phone;
  // And of course we want our recipients to know what we really do
  //$message    = $msg;
  // Create a new instance of our awesome gateway class
  $gateway    = new AfricasTalkingGateway($username, $apikey);
  /*************************************************************************************
    NOTE: If connecting to the sandbox:
    1. Use "sandbox" as the username
    2. Use the apiKey generated from your sandbox application
       https://account.africastalking.com/apps/sandbox/settings/key
    3. Add the "sandbox" flag to the constructor
    $gateway  = new AfricasTalkingGateway($username, $apiKey, "sandbox");
  **************************************************************************************/
  // Any gateway error will be captured by our custom Exception class below, 
  // so wrap the call in a try-catch block
  try { 
    $get_sms = mysqli_query($connection,"SELECT phone,msg FROM kp_sms WHERE status=2");
    foreach ($get_sms  as $mat) {
        $recipients=$mat['phone'];
        $message=$mat['msg'];
        $results = $gateway->sendMessage($recipients, $message);
         foreach($results as $result) {
          //echo " StatusCode: " .$result->statusCode;
            $status=$result ->status;
            if ($status=='Success') {
              $get_sms = mysqli_query($connection,"UPDATE kp_sms SET status=1 WHERE phone='$recipients'") or die("Could not get the balances");
            }
        }
      }
    }
    catch ( AfricasTalkingGatewayException $e )
    {
      echo "Encountered an error while sending: ".$e->getMessage();
    }

   // header("Location:../admin/sms.php?msg=1");  
    // DONE!!! 