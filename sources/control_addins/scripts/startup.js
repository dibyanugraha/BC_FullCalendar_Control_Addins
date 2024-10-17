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

    // var target = window.frameElement;

    // if (target) {
    //   target.setAttribute("scrolling", "yes");
    // };

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
          backgroundColor: '#03bd9e',
        },
        {
          id: 'cal2',
          name: 'Work',
          backgroundColor: '#00a9ff',
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
          id: 'event1',
          calendarId: 'cal2',
          title: 'Weekly meeting',
          start: '2024-10-17T09:00:00',
          end: '2024-10-17T10:00:00',
        },
        {
          id: 'event2',
          calendarId: 'cal1',
          title: 'Lunch appointment',
          start: '2024-10-18T12:00:00',
          end: '2024-10-18T13:00:00',
        },
        {
          id: 'event3',
          calendarId: 'cal2',
          title: 'Vacation',
          start: '2024-10-19',
          end: '2024-10-22',
          isAllday: true,
          category: 'allday',
        },
      ]
    );
    
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
  }
});

function RetrieveData(eventData) {
  alert(eventData);
  calendarData.push(eventData);
}
