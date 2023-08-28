
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const String login = "Log In";
const String helloAgain = "Hello Again";
const String createChallengePlay = "Create,Challenge,Play";
const String welcomeTo = "Welcome to";
const String pleaseFillInformation = "Please fill in the form below for basic information to complete your profile";
const String pleaseEnterWhatsAppNumber = "Please enter your Phone number to get OTP";
const String  requestNow = " Request Now";
const String  loginAs = "Login As";
const String  academyOwner = "Academy Owner";
const String  player = "Player";
const String  playerMess = "By signing up, you acknowledge that you are a genuine tennis player, ready to connect with other players, challenge in matches, and explore the wide range of exciting  features we offer";
const String  academyOwnerMess = "By signing up as an official academy owner, you have the responsibility to ensure that you represent a legitimate tennis academy.";
const String  requestPending = " Request Pending";
const String getOTP = "Get OTP";
const String editProfile = "Edit Profile";
const String factsheet = "Factsheet";
const String viewRules = "View Rules";
const String participate = "Participate";
const String or = "OR";
const String next = "Next";
const String uploadQRCode = "Upload QR Code";
const String saveNext = "Save & Next";
const String addMore = "+ Add More";
const String AddMore = "Add More";
const String back = "Back";
const String addPartner = "+ Add Partner";
const String addCourt = "+ Add Court";
const String addProgram  = "Add Program";
//const String addTournament  = "Add Tournament";
// const String addRoom = "+ Add Room";
// const String select = "Select";
// const String addpartner = "Add Partner";
// const String save = "Save";
// const String setScore = "Set Score";
// const String ifyourscoreisinvalidyoucanreporttotheadmin = "If your score is invalid, you can report to the admin";
// const String share = "Share";
// const String saveFinish = "Save & Finish";
// const String finish = "Finish";
// const String skipForNow = "Skip for now";
// const String submit = "Submit";
// const String copy = "Copy";
// const String change = "Change";
// const String skip = "Skip";
// const String upload = "Upload";
// const String reUpload = "Reupload";
// const String update = "Update";
// const String updateChanges = "Update Changes";
// const String cancel = "Cancel";
// const String reset = "Reset";
// const String booknow = "Book Now !";
// const String bookNow = "Book Now";
// const String applyFilter = "Apply Filter";
// const String contactUs = "Contact Us";
// const String rejectAppeal = "Reject Appeal";
// const String removePlayer = "Remove Player";
// const String message = "Message";
// const String yes = "Yes";
// const String no = "No";
// const String send = "Send";
// const String done = "Done";
// const String editDetails = "Edit Details";
// const String addPlayer = "Add Player";
// const String deluxeRoom = "Deluxe Room";
// const String suite = "Suite Room";
// const String hardCourt = "Hard Court";
// const String perPerson = "(per person)";
// const String courtFee = "Court Fee";
// const String roomCharges = "Room Charges";
// const String grassCourt = "Grass Court";
// const String clayCourt = "Clay Court";
// const String carpetCourt = "Carpet Court";
// const String add = "Add";
// const String joined = "Joined";
// const String pending = "Pending";
// const String won = "Won";
// const String pastMatches = "Past Matches";
// const String lost = "Lost";
// const String sendReport = "Send Report";
// const String invite = "Invite";
// const String accept = "Accepted";
// const String withDraw = "WithDraw";
// const String allContacts = "All Contacts";
// const String addScoreBy = "Add Score by : ";
// const String details = "Details : ";
// const String detailss = "Details";
// const String reject = "Rejected";
// const String continues = "Continue";
// const String areyouupforachallenge = "Are you up for a challenge?";
// const String leagueRequest = "League Request";
// const String deletePlayer = "Delete Player";
// const String leagueDetails = "League Details";
// const String leaveLeague = "Leave League";
// const String alreadyHaveAAccouny = "Already have a account?";
// const String challengerName = "Challenger name";
// const String opponent = "Opponent";
// const String matchStatus = "Match Status";
// const String winner = "Winner";
// const String numberOfSets = "Number of Sets";
// const String tournamentCategory = "Tournament Category";
// const String tournamentSlots = "Tournament Slots";
// const String tournamentFees = "Tournament Fees";
// const String leagueName = "League Name";
// const String extendLeagueFor = "Extend League For";
// const String scoreCard = "Score Card";
// const String updateScoreCard = "Update Score Card";
// const String selectNumberOfSet = "Select number of set";
// const String selectTheEndResultOfTheMatch = "Select the end result of the match";
// const String selectWinnerPlayerName = "Select a prayer to enter the score";
// const String tennisKhelo = "Tennis Khelo";
// const String myAcademy = "My Leagues & Request";
// const String myLeagues = "My League";
// const String MyAcademy = "My Academy";
// const String totalMatches = "Total Matches";
// const String joinedLeagues = "Joined Leagues";
// const String winRate = "Win Rate";
// const String activeLeagues = "Active Leagues";
// const String playerJoined = "Player Joined";
// const String clickHere = "Click Here";
// const String listYourAcademy = "List Your Academy";
// const String manageLeagueReports = "Manage League Reports";
// const String manageLeagueReportsContens = "Effectively handle and address league reports to ensure prompt resolution ";
// const String listYourAcademySubTTitle = "Promote your sports academy to a wide audience by listing it";
// const String manageYourAcademy = "Manage Your Academy";
// const String manageYourAcademySubTitle = "Promote your sports academy to a wide audience by listing it";
// const String requestAdmin = "Request Admin";
// const String academyDetails = "Academy Details";
// const String filter = "Filter";
// const String camera = "Camera";
// const String removePhoto = "Remove Photo";
// const String chooseFromGallery = "Choose From Gallery";
// const String changePicture = "Change Picture";
// const String chooseAnOption = "Choose an option";
// const String editAlbum = "Edit Album";
// const String deleteAlbum = "Delete Album";
// const String pendingRequestAcademy = "Your Request Send for Admin Creating a Leagues";
// const String sendRequestAcademy = "Awesome! Your Academy creation request is now in the hands of our administrator for review and approval.Sit back and relax while we take care of the process.";
// const String listYourAcademySubTitle = "Showcase your academy and join the excitement of competitive tournaments. List your academy here!";
// const String bookACourt = "Book A Court";
// const String stateAdminStateLeagueContents = "Take proactive measures to address violators, enforce penalties, and uphold league regulations";
// const String bookACourtSubTTitle = "Secure your tennis court reservation in a few simple steps";
// const String mangeACourt = "Manage Your Court";
// const String mangeCourt = "Manage Court";
// const String mangeACourtSubTitle = "Secure your tennis court reservation in a few simple steps";
// const String bookACourtSubTitle = "Choose your court, select your time, and enjoy an amazing time on the court!";
// const String upcomingTournaments = "Upcoming Tournaments";
// const String upcomingTournamentsSubTitle = "Gear up to show off your incredible tennis skills and compete in thrilling upcoming tournaments!";
// const String yourScheduledMatches = "Your Scheduled Matches";
// const String reviewDocuments = "Review Documents";
// const String reviewDocumentsContens = "Thoroughly review and analyze documents for accurate assessment and decision-making.";
// const String yourScheduledMatchesSubTTitle = "Keep track of your upcoming matches and stay on top of your game";
// const String manageYourLeagues = "Manage Your Leagues";
// const String manageYourLeaguesSubTitle = "Secure your tennis court reservation in a few simple steps";
// const String yourScheduledMatchesSubTitle = "Stay in the loop and never miss a beat with your already scheduled matches!";
// const String myChallenge = "My Challenge";
// const String challengeRequest = "Challenge Request";
// const String upcomingTournament = "Upcoming Tournament";
// const String helpSupport = "Help & Support";
// const String canReport = "Leagues Reports";
// const String report = "Report";
// const String reportSent = "Report Sent";
// const String scheduledMatches = "Scheduled Matches";
// const String myResult = "My Result";
// const String documents = "Documents";
// const String myScore = "My Score";
// const String suggestions = "Suggestions";
// const String document = "My Document";
// const String documentDetails = "Document Details";
// const String aadhaarCard = "Aadhaar Card Number";
// const String aadharCardFront = "Aadhaar Card Front";
// const String aadharCardBack = "Aadhaar Card Back";
// const String aboutAcademy = "About Academy";
// const String servicesIncluded = "Services Included";
// const String generalInformation = "General Information";
// const String basicInformation = "Basic Information";
// const String courtInformation = "Court Information";
// const String amenities = "Amenities";
// const String personalInformation = "Personal Information";
// const String myDocuments = "My Documents";
// const String academyImages = "Academy Images";
// const String notesComments = "Notes/Comments";
// const String uploadImages = "Upload Images";
// const String achievements = "Achievements";
// const String addAchievements  = "Add Achievements";
// const String createAlbum  = "Create Album";
// const String programmes = "Programmes";
// const String roomInformation = "Room Information";
// const String otherServices = "Other Services";
// const String tournaments = "Tournaments";
// const String gallery = "Gallery";
// const String markAllAsRead = "Mark all as read";
// const String markAsRead = "Mark as read";
// const String markAllAsUnRead = "Mark all as unread";
// const String markAsUnRead = "Mark as unread";
// const String selectAll = "Select All";
// const String clearAll = "Clear All";
// const String clear = "Clear";
// const String yourIdVerificationRequestPending = "Your ID Verification Request Pending";
// const String yourIDVerificationRequestRejected = "Your ID Verification Request Rejected";
// const String yourIdVerificationRequestApproved = "Your ID Verification Request Approved";
// const String allMatch = "All Matches";
// const String stateLeagues = "State Leagues";
// const String rejected = "Rejected";
// const String verified = "Verified";
// const String notification = "Notification";
// const String oneTimePassword = "One Time Password \nVerification";
// const String CongratulationsyouarepreQualifiedfortheseLeagues = "Congratulations! you are pre-Qualified for these Leagues.";
// const String fourDigitCodeHaveBeenSent = "A 6 digit code have been sent to";
// const String logInWithGoogle = "Log in with google";
// const String reSendCodeIn = "Re-send code in ";
// const String resendOtp = "Resend OTP";
// const String reSend = "Re-send";
// const String donotHaveAccount = "Don't have account? ";
// const String loginDescription = "Please sign in to continue";
// const String enterPhoneNumber = "Enter Phone Number";
// const String enterUserName = "Enter Name";
// const String enterAadharNumber = "XXXX-XXXX-XXXX";
// const String enterEmail = "Enter Email";
// const String termConditions = "Term & Conditions";
// const String privacyPolicy = "Privacy & Policy";
// const String rateTheApp = "Rate The App";
// const String logout = "Logout";
// const String name = "Name";
// const String saveChanges = "Save Changes";
// const String changeprofilepicture = "Change profile picture";
// const String academyName = "Academy Name";
// const String academyWebsite = "Academy Website(optional)";
// const String tournamentBanner = "Tournament Banner";
// const String tournamentDetails = "Tournament Details";
// const String paymentMethod = "Payment Method";
// const String paymentInformation = "Payment Information";
// const String achievementTitle = "Achievement Title";
// const String albumTitle = "Album Title";
// const String images = "Images";
// const String programName = "Program Name";
// const String trainingTime = "Training Time";
// const String courtsAvailable = "Courts Available";
// const String roomsAvailable = "Rooms Available";
// const String streetAddress = "Street Address";
// const String courtAddress = "Court Address";
// const String bookingName = "Booking Name";
// const String numberOfPeople = "Number of people";
// const String courts = "Available Courts";
// const String rooms = "Available Rooms";
// const String academyTiming = "Academy Timing";
// const String howLongAcademyOperation = "How long has the academy been in operation?";
// const String inYears = "in Years";
// const String inMonths = "in Months";
// const String enterYourAcademyName = "Enter your academy name";
// const String enterCourtFeePerPerson = "Enter Court Fee Per Person";
// const String enterRoomFeePerDay = "Enter Room Fee Per Day";
// const String enterTournamentName = "Enter Tournament name";
// const String enterWinnerPrize = "Enter Winner Prize";
// const String enterRunnerUpPrize = "Enter Runner Up Prize";
// const String selectAcademyTime = "Select Academy Time";
// const String selectCourts = "Select Courts";
// const String selectRooms = "Select Rooms";
// const String enterAchievementTitle = "Enter Achievement Title";
// const String enterAlbumTitle = "Enter Album Title";
// const String enterProgramName = "Enter program name";
// const String amenityName = "Amenity Name";
// const String enterAmenityName = "Enter Amenity Name";
// const String enterYourAcademyAddress = "Enter your academy street address";
// const String state = "State";
// const String reportFor = "Report For";
// const String tournamentDrawType = "Tournament Draw Type";
// const String city = "City";
// const String selectState = "Please Select State";
// const String selectCity = "Please Select City";
// const String selectCheckBox = "Please Select Check Box";
// const String dateOfBirth = "Date of birth";
// const String phoneNumber = "Phone Number";
// const String email = "Email";
// const String gender = "Gender";
// const String male = "Male";
// const String updateScore = "Update Score";
// const String female = "Female";
// const String leagues = "Leagues Name";
// const String leaguesName = "League Name";
// const String byDefaultLeague = "By default the league will be created for 3 months.";
// const String leaguesCategory = "League Category";
// const String description = "Description";
// const String pointsBreakdown = "Points Breakdown";
// const String admin = "Admin";
// const String rank = "Rank";
// const String leagueTournamentName = "League / Tournament Name";
// const String opponentName = "Opponent Name";
// const String result = "Result";
// const String points = "Points";
// const String actions = "Actions";
// const String adminEmail = "Admin Email";
// const String updateLeague = "Update League";
// const String updateAchievement = "Update Achievement";
// const String manageMembers = "Manage Members";
// const String leagueRequests = "League Requests";
// const String leagueReports = "League Reports";
// const String viewAcademy = "View Academy";
// const String deleteLeague = "Delete League";
// const String deleteAcademy = "Delete Academy";
// const String deleteAchievement = "Delete Achievement";
// const String deleteProgram = "Delete Program";
// const String set = "Set";
// const String loser = "Loser";
// const String tieBreak = "Tie-Break";
// const String viewRank = "View Rank";
// const String challenge = "Challenge";
// const String enabled = "Enabled";
// const String addScore = "Add Score";
// const String requested = "Requested";
// const String withdraw = "Withdraw";
// const String viewRankingsChallenge = "View Rankings/Challenge";
// const String noRecordData = "No Record Data";
// const String createLeague = "Create League";
// const String bookingInformation = "Booking Information";
// const String youarenoteligibleinthisleague = "Search Player not Eligible in This League";
// const String recevieWhatsAppAlerts = "Receive WhatsApp Message Alerts";
// const String recevieEmailAlerts = "Receive Email Message Alerts";
// const String requestForCreateLeagues = "Currently, you don't have permission for creating your own league. Send a request to the admin for creating an league.";
// const String requestForSendCreateLeagues = "Your Request Send for Admin Creating a Leagues";
// const String uploadPictureOfAadharFront = "Upload Picture of Aadhar Front";
// const String uploadPictureOfAadharBack = "Upload Picture of Aadhar Back";
// const String uploadLogoImage = "Upload Banner Image";
// const String uploadPictureOfBannerImage = "Upload Picture of Banner Image";
// const String uploadPaymentScreenshot = "Upload payment screenshot";
// const String documentUpload = "Document Upload";
// const String uploadImage = "Upload Image";
// const String kycVerification = "KYC Verification";
// const String aadhar = "Aadhar";
// const String verfied = "verified";
// const String create_tournament = "Create Tournament";
// const String participate_tournament = "Participate Tournament";
// const String tournamentName = "Tournament Name";
// const String ageGroup = "Age Group";
// const String reportFrom = "Report From";
// const String ageRange = "Age Range";
// const String totalMember = "Total Member";
// const String reportAgainst = "Report Against";
// const String dobFrom = "DOB From";
// const String from = "From";
// const String dobTo = "DOB To";
// const String to = "To";
// const String searchPlayer = "Search Player";
// const String tournamentStartDate = "Tournament Start Date";
// const String startDate = "Start Date";
// const String tournamentEndDate = "Tournament End Date";
// const String endDate = "End Date";
// const String entryDeadline = "Entry Deadline";
// const String winnerPrizeType = "Winner Prize Type";
// const String withdrawDeadline = "Withdraw Deadline";
// const String stepFirst = "Step 1 : Basic Details";
// const String stepSecond = "Step 2 : Tournament Age Group";
// const String winnerPrize = "Winner Prize";
// const String runnerUpPrize = "Runner Up Prize";
// const String logoImage = "Logo Image";
// const String bannerImage = "Banner Image";
// const String category = "Category";
// const String fees = "Fees";
// const String transitionId = "Transition Id";
// const String partnerName = "Partner Name";
// const String partner = "Partner";
// const String feePayment = "Fee Payment";
// const String screenshot = "Screenshot";
// const String tournamentFee = "Tournament Fee";
// const String tournamentRules = "Tournament Rules";
// const String completeTournamentDetails = "Complete Tournament Details";
// const String searchLocation = "Search Location to Add Address";
// const String yourKycVerification = "Your KYC Verification is";
// const String generatePdf = "Generate Pdf";
// const String important = "Important";
// const String confirm = "Confirm";
// const String challengeMessage = "Did you confirm the venue, time and date with the opponent";
// const String withdrawMessage = "Do You Want to WithDraw The Challenge \n Request?";
// const String emptyNewsText = "Oops!  No new updates available at the moment";
// const String scheduleTennisBattleToday = "Schedule Tennis Battle Today!";
// const String emptyNotificationText = "You have no new notifications right now.\n Come back later";
// const String documentPending = "Thanks for submitting the documents . The verification might take 12-24 hours. Stay tuned for updates.";
// const String documentReject = "WE ARE SORRY! Your ID verification is not successful.\nPlease ensure all criteria are met: clear and legible pictures and accurate details. Kindly resubmit for verification.";
// const String documentVerified = "Congratulations! Your ID verification request has been approved and your verification status is now set to “verified.”";
// const String editProfileMessage = "Changing your state will update your profile's location information to reflect the newly selected state. Please ensure that you have selected the correct state before proceeding with the update.";







/////////////////////////////////////////////////////////////////
const String pleaseEnterAadharNumber = "Please Enter Aadhar Number";
const String invalidAadharNumber = "Invalid Aadhar Number";
const String pleaseEnterLeagueName = "Please Enter League Name";
const String pleaseEnterMinimum5Characters = "Please Enter Minimum 5 Characters";
const String pleaseEnterLeagueDescription = "Please Enter League Description";
const String PleaseEnterminimum20Characters = "Please Enter minimum 20 Characters";
const String pleaseEnterEmail = "Please Enter Email";
const String pleaseEnterName = "Please Enter Name";
const String selectPlayerDateofBirth = "Select Player Date of Birth";
const String nameMust3Characters = "The Name Must be at Least 3 Characters";
const String pleaseEnterValidEmailId = "Please Enter Valid Email Id";
const String clickHereText = "Get ready to witness dazzling skills, and nail-biting moments as your state's finest tennis talent takes center stage. It's an opportunity you don't want to miss!";



////////////////////////////////////////////////////////////////////////////

const String paymentInfo = "Payment Information";
const String payMethod = "Payment Method";
const String addTournament = "Add Tournament";
const String uploadQR = "Upload QR code";
const String addPayment = "Add Another Payment";
const String dropDownDefaultText = "--Select--";





const String tournamentOfficial = "Tournament Officials";


const String otherInfo = "Other Information";
const String additionalInfo = "Additional Information";
const String rulesRegulation = "Rules & Regulations";
const String tfAdditionalHint = "Enter additional information here..";
const String tfRulesHint = "Enter rules here..";



const String tournamentVenue = "Tournament Venue";
const String venueName = "Venue Name";
const String venueAddress = "Venue Address";
const String venuePhone = "Venue Phone";



const String basicInfo = "Basic Information";
const String tourName = "Tournament Name";
const String tourDrawType = "Tournament Draw Type";
const String tourStartDate = "Start Date";
const String tourEndDate = "End Date";
const String tourState = "State";
const String tourCity = "City";
const String entryDeadline = "Entry Deadline";
const String withdrawDeadLine = "Withdraw Deadline";
const String sets = "Sets";
const String winnerPrize = "Winner Prize";
const String runnerUpPrize = "Runner Up Prize";
//const String basicInfo = "All Stars Championship";
// const String basicInfo = "Knockouts";
// const String basicInfo = "Rajasthan";
// const String basicInfo = "Jaipur";
// const String basicInfo = "20-03-2023";
// const String basicInfo = "12-04-2023";
// const String basicInfo = "3";
// const String basicInfo = "Car";
// const String basicInfo = "Cash";
// const String basicInfo = "Jaipur";

const String tournamentDetails = "Tournament Details";
const String tournamentCategories = "Tournament Categories";
const String tournamentFeeStructure = "Tournament Fee Structure";
const String tournamentSlots = "Tournament Slots";
const String doubles = "Doubles";
const String singles = "Singles";
const String menSingles = "Men Singles";
const String womenSingles = "Women Singles";
const String mixedDoubles = "Mixed Doubles";
const String open = "Open";
const String ruppe = "\u{20B9}";
//const String basicInfo = "25+, 35+, 40+, 50+";

const String tournamentOfficials = "Tournament Officials";
const String name = "Name";
const String phoneNum = "Phone Number";
const String  obscurePhoneNum= "+91-XXXX-XXXXX";

//const String tournamentVenue = "Tournament Venue";
const String dummyAddress = "Barakhamba Rd, Todermal Road Area, Mandi House, New Delhi, Delhi 110001, India";
//const String basicInfo = "Name";
const String phone = "Phone";

const String address = "Address";
//const String otherInfo = "Other Information";
//const String additionalInfo = "Additional Information";
const String dummyInfoPera = "Lorem ipsum dolor sit amet consectetur. Blandit lobortis facilisis. Lorem ipsum dolor sit amet consectetur. Blandit lobortis facilisisLorem ipsum dolor sit amet consectetur. Blandit lobortis facilisis";
//const String basicInfo = "Rules & Regulations";
const String dummyRule = "Lorem ipsum dolor sit amet consectetur. Blandit lobortis facilisis";

const String registerNow = 'Register Now';



const String tournaments = 'Tournaments';
const String liveTournaments = 'Live Tournaments';
const String live = 'Live';
const String upcoming = 'Upcoming';
const String joined = 'Joined';
const String all = 'All';
const String allStarChamp = 'All Star Championship';
const String upcomingTournament = 'Upcoming Tournaments';
const String joinedTournament = 'Joined Tournaments';
const String completedTournament = 'Completed Tournaments';
const String allTournaments = 'All Tournament';




const String tournamentRegistration = 'Tournament Registration';
const String registerFor = 'Register for';
const String participantName = 'Participant Name';
const String participantName1 = 'Participant 1 Name';
const String participantName2 = 'Participant 2 Name';
const String tournamentFee = 'Tournament Fee';
const String selectPaymentMethod = 'Select Payment Method';
const String qrCodeToPayAndRegister = 'Scan QR Code \nto pay and get registered';
const String paymentReceipt = 'Payment Receipt';
const String uploadPhoto = 'Upload Photo';
const String register = 'Register';
const String cancel = 'Cancel';



const String staffMembers = 'Staff Members';
const String sno = 'S.No';
const String emailAddress = 'Email address';
const String staffList = 'Staff List';
const String addStaff = 'Add Staff';
const String updateChanges = 'Update Changes';
const String remove = 'Remove';
const String details = 'Details';
const String editViewDetails = 'Edit/View Details';



const String summerChamp= 'Summer Championship';
const String overview= 'Overview';
const String scores= 'Scores';
const String draws = 'Draws';
const String players= 'Players';
const String month= 'Mar';
const String central= 'Central';
const String player1= 'Player 1';
const String player2= 'Player 2';
const String estimatedStartTime= 'Estimated Start Time';
const String finalText = 'Final';
const String court1 = 'Court 1';
const String qualRnd1 = 'Qual.Rnd 1';
const String min20 = '20 min';
const String min40 = '40 min';
const String pm430= '4:30 pm';
const String watchLiveStream= 'Watch Live Stream';




const String ongoing= 'Ongoing';
//const String upcoming= 'Upcoming';
const String mainCourt= 'Main Court';
const String sideCourt= 'Side Court';
const String indoorCourt= 'Indoor Court';
const String liveNow= 'Live Now';



const String scoreManagement= 'Score Management';
const String vs= 'VS';
const String scoreSheet= 'Score Sheet';
const String service= 'Service';
const String tossWon= 'Toss Won';
const String undo= 'Undo';
const String points= 'Points';
const String set1= 'Set 1';
const String set2= 'Set 2';
const String set3= 'Set 3';
const String category= 'Category';
const String paymentStatus= 'Payment Status';
const String totalParticipants= 'Total Participants';


//const String participantName= 'Participant’s Name';

