== README
Room Booking System application (1-Sept-2018):

     In this application you can add your booking for room with different categories. you are eligible to booked room in 6 months advanced. you can also see the available rooms for particular date. 

Software Requirements:

	Ruby version = ruby 2.5.0p0
	Rails version = Rails ~> 4.2.4
	database used = Postgresql


How to run :

	1. open command prompt and goto directory contain project i.e cd directory_path.
	2. next type bundle install command and enter.
    3. next goto app/config/database.yml and fill your postgresql password.
    4. next type rake db:create to create database for application on your system.
	5. next type rake db:migrate command to create structure of database.
	6. next type rake rooms:create and run this rake task to create rooms database entries on your system.
    7. next start rails server with command rails s.
	8. next open the browser and type url localhost:3000 to go on root page.
	9. next on the browser you can see category wise rooms are displayed, you can add your booking for particular room by clicking on 'Book Room' button but for that you need to be user of this application.
	10. if you not the user of this site then you need click on sign up buttun and fill up all information which is mandatory and click sign up button to create account on this site.
    11. if you already user of this application then you just need to sign in the with your valid details of application i.e email id and passsword.
    12. after sign in you will redirect to book form if you clicked book room button before sign in on home page otherwise on normal sign in root page is displayed.
    13. On Add Booking form Fill the booking information and save your booking. if the room is booked by someone else for your selected date then you need to check other rooms.
    14. You can also cancel booking for that you need to go on booking details page then click on cancel booking.


Mobile Api's Details:


 	User Sign in Api: 
 		url: 'localhost:3000/api/v1/users/sign_in'
 		header: Content-Type = application/x-www-form-urlencoded
 		method: post
 		params: user[email], user[password]

 	User Sign out Api: 
 		url: 'localhost:3000/api/v1/users/sign_out'
 		header: Content-Type = application/x-www-form-urlencoded
 		method: post
 		params: user[email]

  	Availability of rooms: 
 		url: 'localhost:3000/api/v1/rooms'
 		header: Content-Type = application/x-www-form-urlencoded
 		method: get
 		params: booking_date And/Or room_type

  	User see his/her Booking by using booking id: 
 		url: 'localhost:3000/api/v1/bookings/:id
 		header: Content-Type = application/x-www-form-urlencoded
 		method: get


Room Booking System can be reach at:

	Voice : 9881647882
	Email : ketandhatrak@gmail.com

