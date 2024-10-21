var url = Microsoft.Dynamics.NAV.GetImageResource("htmls/calendarContainer.html");

$("#controlAddIn").load(url, function (response, status, xhr) {
  if (status === "error") {
    var msg = "Sorry but there was an error: ";
    $("#controlAddIn").html(msg + xhr.status + " " + xhr.statusText);
    return;
  } else {
    var controlAddIn = document.getElementById("controlAddIn");

    if (controlAddIn) {
      var parentBody = controlAddIn.parentNode;
      if (parentBody) { 
        parentBody.style.overflow = "scroll";
      }
    }

    const options = {
      usageStatistics: false,
      defaultView: 'week',
      useFormPopup: true,
      useDetailPopup: true,
      week: {
        startDayOfWeek: 1,
        workweek: true,
        showNowIndicator: true,
        hourStart: 8,
        hourEnd: 17,
        taskView: false,
        collapseDuplicateEvents: false,
      },
      calendars: [
        {
          id: 'cal1',
          name: 'Personal',
          backgroundColor: '#90ee90',
        },
        {
          id: 'cal2',
          name: 'Work',
          backgroundColor: '#e0ffff',
        },
        {
          id: 'cal3',
          name: 'Day off',
          backgroundColor: '#ffffe0',
        },
        {
          id: 'cal4',
          name: 'Emergency',
          backgroundColor: '#ffa07a',
        },
      ]
    };

    var Calendar = tui.Calendar;
    let calendar = new Calendar('#calendarFrame', options);
    let dateStart = new Date(calendar.getDateRangeStart());
    let dateEnd = new Date(calendar.getDateRangeEnd());
    document.getElementById("calendarDateRange").innerHTML = dateStart.toLocaleDateString() + ' ~ ' + dateEnd.toLocaleDateString();

    calendar.createEvents([
      {
        id: 'event0',
        calendarId: 'cal2',
        title: 'Daily standup',
        start: '2024-10-23T08:00:00',
        end: '2024-10-23T08:15:00',
      },
      {
        id: 'event1',
        calendarId: 'cal2',
        title: 'Weekly planning',
        start: '2024-10-23T09:00:00',
        end: '2024-10-23T10:00:00',
      },
      {
        id: 'event2',
        calendarId: 'cal4',
        title: 'Production issue',
        start: '2024-10-23T09:30:00',
        end: '2024-10-23T11:30:00',
      },
      {
        id: 'event3',
        calendarId: 'cal1',
        title: 'Lunch appointment',
        start: '2024-10-23T12:00:00',
        end: '2024-10-23T13:00:00',
      },
      {
        id: 'event3',
        calendarId: 'cal3',
        title: 'Vacation',
        start: '2024-10-16',
        end: '2024-10-21',
        isAllday: true,
        category: 'allday',
      },
    ]);
    
    calendar.render();

    window.gotoToday = function() {
      calendar.today();
      dateStart = new Date(calendar.getDateRangeStart());
      dateEnd = new Date(calendar.getDateRangeEnd());
      document.getElementById("calendarDateRange").innerHTML = dateStart.toLocaleDateString() + ' ~ ' + dateEnd.toLocaleDateString();
    }

    window.gotoNextWeek = function() {
      calendar.next();
      dateStart = new Date(calendar.getDateRangeStart());
      dateEnd = new Date(calendar.getDateRangeEnd());
      document.getElementById("calendarDateRange").innerHTML = dateStart.toLocaleDateString() + ' ~ ' + dateEnd.toLocaleDateString();
    }

    window.gotoPrevWeek = function() {
      calendar.prev();
      dateStart = new Date(calendar.getDateRangeStart());
      dateEnd = new Date(calendar.getDateRangeEnd());
      document.getElementById("calendarDateRange").innerHTML = dateStart.toLocaleDateString() + ' ~ ' + dateEnd.toLocaleDateString();
    }

    calendar.on('beforeUpdateEvent', ({ event, changes }) => {
      console.log('beforeUpdateEvent', event);
      console.log('beforeUpdateEvent', changes);
      calendar.updateEvent(event.id, event.calendarId, changes);
    });

    calendar.on('beforeDeleteEvent', (eventObj) => {
      console.log('beforeDeleteEvent', eventObj);
      calendar.deleteEvent(eventObj.id, eventObj.calendarId);
    });
  }
});

function RetrieveData(eventData) {
  alert(eventData);
  calendarData.push(eventData);
}
