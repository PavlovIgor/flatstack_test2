import { BaseController } from "controllers/base_controller.js";

export default class extends BaseController {

  static targets = ["calendar", "info"]

  initialize() {
    var context = this;

    var calendar = $(this.calendarTarget).fullCalendar({

      events: function(start, end, timezone, callback) {

        var data = {  start:  start.format(),
                      end:    end.format(),
                      scope:  context.get_query_param('scope') }

        $.ajax({
          type:     'POST',
          url:      '/api/callendar',
          data:     data,
          success:  function(data){
            context.prepare_events(data, callback);
          },
          error:    function(data){
            console.log(data);
          }
        });
      },
      locale:         'ru',
      eventColor:     '#528078',
      eventTextColor: '#fff',
      dayClick:       function(date, jsEvent, view) {
        context.api_call({
          url: 'api/date',
          data: {
            date: date.format(),
            scope:  context.get_query_param('scope')
          },
          success: context.show_date,
          error: function(){ console.log('error') }
        })

        $('.fc-day').css('background-color', '');
        $(this).css('background-color', '#f0f0f0');
      }
    })
  }

  show_date(data, context){
    $(context.infoTarget).html('')

    $(data).each(function(){
      $(context.infoTarget).append(`
        <li class="list-group-item">
          <h4>${$(this).attr('name')}</h4>
          <small>${$(this).attr('date')}</small>
          <p>${$(this).attr('truncated')}</p>
          <a class="btn btn-outline-primary btn-sm" href="/events/${$(this).attr('id')}">Посмотреть</a>
          ${ $(this).attr('edit') ? `<a class="btn btn-outline-danger btn-sm" href="/events/${$(this).attr('id')}/edit">Редактировать</a>` : '' }
        </li>
      `);
    });
  }

  prepare_events(data, callback){
    var events = [];
    $(data).each(function() {
      events.push({
        title: $(this).attr('name'),
        start: $(this).attr('date'),
        url: `/events/${$(this).attr('id')}/edit`
      });
    });
    return callback(events);
  }

}
