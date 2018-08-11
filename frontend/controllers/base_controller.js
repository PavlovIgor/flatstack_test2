import { Controller } from "stimulus";

export class BaseController extends Controller {

  get_query_param(name){
    var urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(name);
  }

  api_call(options){
    var context = this;

    $.ajax({
        type: "POST",
        url: options.url,
        data: options.data,
        success: function(data){
          options.success(data, context)
        },
        error: function(data){
          options.error(data, context)
        }
    });

  }

}
