<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

    
       <div class="row">
            <div class="col-md-10 col-md-offset-1">

                <div class="card card-calendar">
                    <div class="content">
                        <div id="fullCalendar"></div>
                    </div>
                </div>
            </div>
        </div>
        
<script src="js/fullcalendar.min.js" type="text/javascript"></script>
<script>
$().ready(function(){
        $calendar = $('#fullCalendar');
        today = new Date();
        y = today.getFullYear();
        m = today.getMonth();
        d = today.getDate();

        $calendar.fullCalendar({
			header: {
				left: 'title',
				center: 'month,agendaWeek,agendaDay',
				right: 'prev,next today'
			},
			defaultDate: today,
			selectable: true,
			selectHelper: true,
			titleFormat: {
                month: 'MMMM YYYY', // September 2015
                week: "MMMM D YYYY", // September 2015
                day: 'D MMM, YYYY'  // Tuesday, Sep 8, 2015
            },
			select: function(start, end) {

                // on select we show the Sweet Alert modal with an input
				swal({
    				title: '添加事件',
    				html: '<br><input class="form-control" placeholder="事件名称" id="input-field">',
    				showCancelButton: true,
    				closeOnConfirm: true
                }, function() {

                    var eventData;
                    event_title = $('#input-field').val();

                    if (event_title) {
    					eventData = {
    						title: event_title,
    						start: start,
    						end: end
    					};
    					$calendar.fullCalendar('renderEvent', eventData, true); // stick? = true
    				}

    				$calendar.fullCalendar('unselect');

                });
			},
			editable: true,
			droppable: true, // this allows things to be dropped onto the calendar !!!
			drop: function(date, allDay) { // this function is called when something is dropped
			
				// retrieve the dropped element's stored Event Object
				var originalEventObject = $(this).data('eventObject');
				var $extraEventClass = $(this).attr('data-class');
				
				
				// we need to copy it, so that multiple events don't have a reference to the same object
				var copiedEventObject = $.extend({}, originalEventObject);
				
				// assign it the date that was reported
				copiedEventObject.start = date;
				copiedEventObject.allDay = allDay;
				if($extraEventClass) copiedEventObject['className'] = [$extraEventClass];
				
				// render the event on the calendar
				// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
				$calendar.fullCalendar('renderEvent', copiedEventObject, true);
				
				// is the "remove after drop" checkbox checked?
				if ($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}
				
			}
			,
			editable: true,
			eventLimit: true, // allow "more" link when too many events


            // color classes: [ event-blue | event-azure | event-green | event-orange | event-red ]
            events: [
				{
					title: '本月工作计划',
					start: new Date(y, m, 1)
				},
				{
					id: 999,
					title: '库存清理',
					start: new Date(y, m, d-4, 6, 0),
					allDay: false,
					className: 'event-blue'
				},
				{
					id: 999,
					title: '库存清理',
					start: new Date(y, m, d+3, 6, 0),
					allDay: false,
					className: 'event-blue'
				},
				{
					title: '会见客户',
					start: new Date(y, m, d-1, 10, 30),
					allDay: false,
					className: 'event-green'
				},
				{
					title: '与沈老板在锦江之星午餐',
					start: new Date(y, m, d+7, 12, 0),
					end: new Date(y, m, d+7, 14, 0),
					allDay: false,
					className: 'event-red'
				},
				{
					title: '会见客户',
					start: new Date(y, m, d-2, 12, 0),
					allDay: true,
					className: 'event-azure'
				},
				{
					title: '周末party',
					start: new Date(y, m, d+1, 19, 0),
					end: new Date(y, m, d+1, 22, 30),
					allDay: false,
				},
				{
					title: '制作季度任务报表',
					start: new Date(y, m, 21),
					end: new Date(y, m, 22),
					className: 'event-orange'
				},
				{
					title: '采购新式自行车',
					start: new Date(y, m, 23),
					end: new Date(y, m, 23),
					className: 'event-orange'
				}
			]
     });
        
});    


</script>