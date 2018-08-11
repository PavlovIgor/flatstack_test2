import application from "stimulus_application";
import { definitionsFromContext } from "stimulus/webpack-helpers";
import "./elements_calendars_event.css";

const context = require.context('./', true, /_controller\.js$/);
application.load(definitionsFromContext(context));
