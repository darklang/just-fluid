module Status = {
  @ppx.deriving(show({with_path: false}))
  type rec t =
    | Deploying
    | Deployed

  let decode = (j): t => {
    open Json_decode_extended
    variants(list{("Deployed", variant0(Deployed)), ("Deploying", variant0(Deploying))}, j)
  }
  let encode = (s: t): Js.Json.t => {
    open Json_encode_extended
    let ev = variant
    switch s {
    | Deploying => ev("Deploying", list{})
    | Deployed => ev("Deployed", list{})
    }
  }
}

module Deploy = {
  @ppx.deriving(show({with_path: false}))
  type rec t = {
    deployHash: string,
    url: string,
    @opaque lastUpdate: Js.Date.t,
    status: Status.t,
  }

  let decode = (j): t => {
    open Json_decode_extended
    {
      deployHash: field("deployHash", string, j),
      url: field("url", string, j),
      lastUpdate: field("lastUpdate", date, j),
      status: field("status", Status.decode, j),
    }
  }

  let encode = (d: t): Js.Json.t => {
    open Json_encode_extended
    object_(list{
      ("deployHash", string(d.deployHash)),
      ("url", string(d.url)),
      ("lastUpdate", date(d.lastUpdate)),
      ("status", Status.encode(d.status)),
    })
  }
}
