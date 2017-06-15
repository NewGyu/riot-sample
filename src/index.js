import riot from "riot";
import route from "riot-route";
import "./tags/app.tag";
import config from "config";

riot.mount("app");
route.start(true);
