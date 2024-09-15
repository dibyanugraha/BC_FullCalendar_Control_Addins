var controlAddIn = document.getElementById("controlAddIn");

if (controlAddIn) {
  var parentBody = controlAddIn.parentNode;
  if (parentBody)
    parentBody.style.overflow = "scroll";
}

var target = window.frameElement;

if (target)
  target.setAttribute("scrolling", "yes");

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('controlAddIn');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    timeZone: 'UTC',
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay'
    },
    editable: true,
    dayMaxEvents: true, // when too many events in a day, show the popover
    events: supplyData(),
    eventResize: async function(info) {
      if (!confirm("Continue to resize?")) {
        info.revert();
      } else {
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ShowMessageOnBC', [info.event.title + " end is now " + info.event.end.toISOString()]);
      }
    },
    eventDrop: function(info) {
      if (!confirm("Are you sure about this change?")) {
        info.revert();
      } else {
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ShowMessageOnBC', [info.event.title + " was dropped on " + info.event.end.toISOString()]);
      }
    }

  });
  calendar.render();
});
