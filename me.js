import {json,secureHeaders,csrfCookie,cookieValue,randomHex} from "../../_lib.js";
import {admin} from "../../_lib.js";
export async function onRequestGet(ctx){const ok=await admin(ctx,ctx.request);if(!ok)return json({authenticated:false},200,secureHeaders());let csrf=cookieValue(ctx.request,"lb_csrf");if(!csrf){csrf=randomHex(32);return json({authenticated:true,csrf},200,secureHeaders({"Set-Cookie":csrfCookie(csrf,86400,ctx.request.url.startsWith("https:"))}))}return json({authenticated:true,csrf},200,secureHeaders())}
