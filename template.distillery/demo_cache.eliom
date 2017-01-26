(* This file was generated by Ocsigen Start.
   Feel free to use it, modify it, and redistribute it as you wish. *)

(* Eliom_cscache demo *)

[%%shared
  open Eliom_content.Html.F
]

(* Service for this demo *)
let%server service =
  Eliom_service.create
    ~path:(Eliom_service.Path ["demo-cache"])
    ~meth:(Eliom_service.Get Eliom_parameter.unit)
    ()

(* Make service available on the client *)
let%client service = ~%service

(* Name for demo menu *)
let%shared name () = [%i18n S.demo_cache]

(* Class for the page containing this demo (for internal use) *)
let%shared page_class = "os-page-demo-cache"

(* Page for this demo *)
let%shared page () =
  Lwt.return
    [ h1 [ pcdata "Caching the data" ]
    ; p [ pcdata "Module "
        ; code [ pcdata "Eliom_cscache" ]
        ; pcdata " implements a cache of data that is designed for Eliom's \
                  client-server programming model. It makes it possible to \
                  save a client-side copy of the data. Have look at module "
        ; code [ pcdata "Os_user_proxy" ]
        ; pcdata " to see how it works (and use this module for getting \
                 information about Ocsigen Start's users). "
        ]
    ; p [ pcdata "When you get a piece of data through "
        ; code [ pcdata "Eliom_cscache" ]
        ; pcdata " from client-side, the request to the server is done only \
                  if the data is not already in the client-side cache. "
        ; pcdata "On server side, "
        ; code [ pcdata "Eliom_cscache" ]
        ; pcdata " is using a temporary cache (with \"request\" scope) \
                  to avoid fetching the data several time from the database \
                  during the same request. This server-side cache is \
                  automatically sent to the client to fill the client-side \
                  cache. If you want to avoid too many requests from the \
                  client, prefill the server-side cache with the data the \
                  client program will need."
        ]
    ; p [ pcdata "In the near future, "
        ; code [ pcdata "Eliom_cscache" ]
        ; pcdata " will make it possible to save persistent data, \
                  which is useful for implementing off-line applications."
        ]
    ]
