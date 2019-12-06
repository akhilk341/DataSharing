/*
Date:12/05/2019
Authors:  Akhil Kattepogu || Mohan Siva Krishna Konakanchi || Nikhil Masur
Class: CS6030- Final Project
Assignment: Data Sharing in Cloud Using Symmetric Cryptographic Algorithm

*/


_____________________________Web_Application Link_______________________________________________________

Link to redirect to the Application :                Sedascaws-env.w4rjkspc6u.us-east-2.elasticbeanstalk.com
_____________________________________________________________________________________________________


_____________________________Database_Connection__________________________ ____________________________

Database endpoint:    jdbc:mysql://sedascdatabase.cvdxo4wfuwri.us-east-2.rds.amazonaws.com:3306/sedasc  
Username:    sedasc
Password:     sedasc#123
_____________________________________________________________________________________________________


*****Registration*******

1. Enter the details to register the owner and assign to a particular group.
2. Enter the details to register the owner and assign to a particular group.
3.The Cryptographic server login details are pre defined in the application: Details-> 
	Username: CS
	Password:  CS

******Upload a file to store in database from owner profile********

1. Login to the owner.
2. Go to Upload files-> And Browse a file to be uploaded and click on upload
3. On the next page, give permission to the users [READ/WRITE] and send the file upload request to Cryptographic Server.


******Login to Cryptographic Server to encrypt file and share key to the user******

1. After Logging in, Go to -> New Files
2. You can see the file which is sent by the owner with file id and owner email id.
3. Click on 'Execute'
4. You can see-> File ID, File name and File data which is converted to byte format
4. Click on 'Get Random Number' and on the next page you can see the random number generated
5. Click on -> Get Hash Value(R) - > which converts the random number to hash value
6. Then using secure hashing alogorithm a Key is created.
7. Then Encrypt the file with the Key
	-> Click on ->  Encrypt SKA(F,K)
8. On the next page, you can see the Encrypted data of the file.
9. Click on -> 'Share to Users'   ( the key will be shared to the user email)


**********Login to User and profile and request the CS with key to access the file*************

1. Login to user and click on -> Shared files
2. You can see the files shared with File ID
3. Click on -> "View"
4. Enter Security key which is sent to the User e-mail   -> And Click Request to CS ( The request to sent to the CS to decrypt the file)
5. Dialog box will be opened saying " Wait for the result"
6. Leave the tab opened and open another wnidow to login to Cryotpgraphic Server.




*********Login to Cryptographic server and to decrypt the file with key provided by the user************

1. After logging in to CS -> Click on "Download Request"
2. Then Click on 'Execute' for the user whom the file should be decrypted and send
3. Click on "Decrypt" to decrypt the file.
4. If the key provided by the user is correct ----> Click on "Share to User" ( File will be shared to the user)
    If the key in incorrect -> Dialog box will be opened saying that  "Key is incorrect"'



**********Go to User Window which is left opened earlier for the result**************

1. Once the CS shares the file.
2. You can see the dialog box saying " File is shared succesfully
3. Click on ---> "Download" to download the file shared.
4. Finally,  user can access the file uploaded by the owner. 












