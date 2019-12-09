 // setup datetimepicker and called ajax for fetching selected booking date items
$(function () {
  $('#booking_date, #booked_from, #booked_upto').datetimepicker( {
    format: 'YYYY-MM-DD'
  });

  // call ajax to fetching available rooms belonging to given date
  $('#booking_date').on('dp.change', function(e){
    var current_date = moment(new Date(e.date)).format('YYYY-MM-DD');
    if (current_date)
    { 
      // clear previous data to append new html view
      $('.rooms_details_by_categories').html('');
      $.ajax({
        url  : '/api/v1/rooms',
        type : 'get',            
        data : { booking_date: current_date},
        success : function(response){
          available_rooms_by_categories = response;
          // call function to append html view here after resoonse
          rooms_views();
        }
      });
    }
  });

  // appending html view into given class selector div
  function rooms_views() {
    $.each(available_rooms_by_categories, function (i, element) {
      var rooms = element.rooms;
      var html_views = [];

      $.each(rooms, function (i, room) {
        html_views.push('<div class="col-md-3 portfolio-item"><a href="#"><h3>Room Details</h3><h4><span>Room Number : <small>'+room.room_number+'</small></span><br><span>Facility: <small>'+room.description+'</small></span><br><span>Facility: <small>'+room.charged_per_night+'/night</small></span><br></h4></a><a class="btn btn-primary" href="/rooms/'+room.id+'/bookings/new">Book Room</a></div>');
      });
      
      $('.rooms_details_by_categories').append('<div class="col-lg-12"><h3 class="page-header">'+element.total_rooms+' '+element.category+' Rooms</h3><div class="row only_room_details">'+html_views.join('')+'</div></div>');
    }); 
  }
});
