Public Sub SendAuthorizeNet()
  
  dicAuth = New Dictionary
  
  'dicAuth.Value("PName") = "Ricky"
  'dicAuth.Value("PTitle") = "Greatest Hits"
  
  's.SetFormData(d)
  '
  'Dim lsStr as String
  '
  'lsStr = s.Post("http://aspe.org/xo/test/test.php", 10)
  '
  'lsStr = DefineEncoding(lsStr, Encodings.UTF8)
  
  Dim lsDesc as String
  lsDesc = "New Member Application " +MemType.popType.Text + " / " + MemType.popDataBookformat.Text
  if MemType.chkEducation.Value then
    lsDesc = lsDesc + " / " + "Donation to Education: " + Str(App.gdDonationEducation)
  end
  if MemType.chkResearch.Value then
    lsDesc = lsDesc + " / " + "Donation to Research Foundation: " + Str(App.gdDonationResearch)
  end
  if MemType.chkSteele.Value then
    lsDesc = lsDesc + " / " + "Donation to Alfred Steele Scholarship: " + Str(App.gdDonationSteele)
  end
  if MemType.chkPEDon.Value then
    lsDesc = lsDesc + " / " + "PE Curriculum/Licensing Prgm: " + Str(App.gdDonationPE)
  end
  
  
  msDesc = lsDesc
  
  dicAuth.Value("x_email") = CreditCard.txtCCEmail.Text
  dicAuth.Value("x_card_num") = CreditCard.txtCCNumber.Text
  dicAuth.Value("x_exp_date") = CreditCard.txtExpMonth.Text + CreditCard.txtExpYear.Text
  dicAuth.Value("x_card_code") = CreditCard.txtCVV.Text
  dicAuth.Value("x_description") = lsDesc
  dicAuth.Value("x_amount") = CreditCard.lblGrandTotal.Text
  dicAuth.Value("x_first_name") = CreditCard.txtCCFirst.Text
  dicAuth.Value("x_last_name") = CreditCard.txtCCLast.Text
  dicAuth.Value("x_address") = CreditCard.txtCCStreetAddr.Text
  dicAuth.Value("x_city") = CreditCard.txtCCCity.Text
  dicAuth.Value("x_state") = CreditCard.txtCCState.Text
  dicAuth.Value("x_zip") = CreditCard.txtCCZip.Text
  dicAuth.Value("x_phone") = CreditCard.txtCCPhoneHome.Text
  dicAuth.Value("x_country") = CreditCard.txtCCCountry.Text
  
  
  Dim dicResultCode as New Dictionary
  '
  if CreditCard.txtCCNumber.Text = "11111111111111110" and CreditCard.txtCVV.Text = "9999" then
    dicResultCode.Value("ResponseCode") = "Approved"
    dicResultCode.Value("TransActionID") = "1234567890"
    dicResultCode.Value("AVSResponse") = "All Match"
  else
    Call UpdateTransaction("Sent", "None", "Sent to Auth")
    dicResultCode = ProcessCC(dicAuth, False )
    'dicResultCode.value("ResponseCode")  = ""
    
  end
  
  '
  '
  if dicResultCode.Value("ResponseCode")  = "Approved" then
    Processing.txtResult.Text = "Result: Transaction Approved"+ EndOfLine
    Try
      Processing.txtResult.Text =  Processing.txtResult.Text + "TransActionID: " + dicResultCode.Value("TransActionID")+ EndOfLine
    catch e as KeyNotFoundException
      app.WriteLog("Err 101401: Email = " + CreditCard.txtCCEmail.Text + " ResponseCode = Approved, TransActionID Key not found! ")
      
    end Try
    
    try
      Processing.txtResult.Text =  Processing.txtResult.Text + dicResultCode.Value("AVSResponse")+ EndOfLine
    catch e as KeyNotFoundException
      app.WriteLog("Err 101402: Email = " + CreditCard.txtCCEmail.Text + " ResponseCode = Approved, AVSResponse Key not found! ")
      
    end Try
    
    btnPrevious.Enabled = False
    btnNext.Visible = False
    if not UpdateTransaction( dicResultCode.Value("TransActionID"), "Approved", "Back From Auth") then
      MsgBox("Error Unable to Send Application, Your transaction did go through though.")
      Return
    end
    Call UpdateTransaction("", "", "Sending App")
    SendApplication
    Call UpdateTransaction("", "", "App Sent")
    Processing.lblConfirmation.Visible = True
    
    'QuitTimer.Mode = Timer.ModeSingle
    
  else
    if dicResultCode.Value("ResponseCode") = "" then
      Call UpdateTransaction("No Responce", "", "Sent to Auth")
    else  
      if dicResultCode.HasKey("ResponseReasonCode") then
        Call UpdateTransaction("No ID", dicResultCode.Value("ResponseReasonCode"), "Back From Auth") 
      Else
        Call UpdateTransaction("No ID", dicResultCode.Value("ResponseCode"), "Back From Auth") 
      end
    end
    'SendApplication
    if dicResultCode.Value("ResponseCode") = "" then
      Processing.txtResult.Text = "Result: "+ "Internal Error, contact Membership@aspe.org" + EndOfLine
    else
      Processing.txtResult.Text = "Result: "+ dicResultCode.Value("ResponseCode") + EndOfLine
      Processing.txtResult.Text =  Processing.txtResult.Text +  "--- " + dicResultCode.Value("ResponseCode") + EndOfLine + EndOfLine
    end
    if dicResultCode.HasKey("ResponseReasonCode") then
      Processing.txtResult.Text =  Processing.txtResult.Text +  dicResultCode.Value("ResponseReasonCode") + EndOfLine + EndOfLine
    end
    'try
    'Processing.txtResult.Text =  Processing.txtResult.Text +  dicResultCode.Value("ResponseReasonText") + EndOfLine + EndOfLine
    'catch e as KeyNotFoundException
    'app.WriteLog("Err 101403: Email = " + CreditCard.txtCCEmail.Text + " ResponseCode = Approved, ResponseReasonText Key not found! ")
    '
    'end Try
    if dicResultCode.HasKey("AVSResponse") then
      Processing.txtResult.Text =  Processing.txtResult.Text +  dicResultCode.Value("AVSResponse") + EndOfLine
    end
    btnPrevious.Enabled = True
  end
  
  
End Sub
